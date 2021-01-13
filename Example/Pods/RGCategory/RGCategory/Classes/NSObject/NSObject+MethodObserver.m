//
//  NSObject+MethodObserver.m
//  TESTRuntime
//
//  Created by 浮生似梦、Dream on 2019/8/23.
//  Copyright © 2019年 Dream. All rights reserved.
//

#import "NSObject+MethodObserver.h"
#import <Objc/runtime.h>
#import <Objc/message.h>

static NSString * const SelectorAliasPrefix = @"alias_";
static void *SubclassAssociationKey = &SubclassAssociationKey;

//static void *ObserversKey = &ObserversKey;

@implementation NSObject (MethodObserver)


- (void)ObserverSelector:(SEL)aselector  observerName:(NSString *)observerName callBack:(void(^)(NSArray *arguments))callBack {
    
    NSCParameterAssert(aselector != NULL);
    NSCParameterAssert(observerName != nil);
    NSCParameterAssert(callBack != nil);
    
    SEL newSel = NSSelectorFromString([SelectorAliasPrefix stringByAppendingString:NSStringFromSelector(aselector)]);
    
   NSMutableArray *callBackArr =  objc_getAssociatedObject(self, newSel);
    if (callBackArr.count) {
        NSDictionary *keyCallBack = @{@"key" : observerName, @"callBack" : callBack};
        [callBackArr addObject:keyCallBack];
        objc_setAssociatedObject(self, newSel, callBackArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return;
    }
    
    
    
    Class class = [self SwizzleClass:self];
    
    Method targetMethod = class_getInstanceMethod(class, aselector);
    const char *typeEncoding = method_getTypeEncoding(targetMethod);
    
    //给新类添加新的 newSel, 实际指向老方法(aselector)的实现
    BOOL addMethodSucess = class_addMethod(class, newSel, method_getImplementation(targetMethod), typeEncoding);
    if (addMethodSucess) {
        
    }
    
    class_replaceMethod(class, aselector, _objc_msgForward, method_getTypeEncoding(targetMethod));
    
    
    NSDictionary *keyCallBack = @{@"key" : observerName, @"callBack" : callBack};
    callBackArr = [NSMutableArray arrayWithObject:keyCallBack];
    objc_setAssociatedObject(self, newSel, callBackArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (Class)SwizzleClass:(NSObject *)targetObj {
    
    //1.获取父类
    Class statedClass = targetObj.class;
    Class baseClass = object_getClass(targetObj);
    
    
    Class knownSubclass = objc_getAssociatedObject(targetObj, SubclassAssociationKey);
    if (knownSubclass) {  return knownSubclass; }
    
    
    //2.创建子类名字
    NSString *baseClassName = NSStringFromClass(baseClass);
    const char *subclassName = [baseClassName stringByAppendingString:@"TEST"].UTF8String;
    
    Class subclass = objc_getClass(subclassName);
    if (subclass == nil) {
        //3.生成子类并注册
        subclass = objc_allocateClassPair(statedClass, subclassName, 0);
        [self swizzleforwardInvocation:subclass];
        [self swizzleRespondsToSelector:subclass];
        [self swizzleGetClass:subclass statedClass:statedClass];
        [self swizzleGetClass:object_getClass(subclass) statedClass:statedClass];
        [self swizzleMethodSignatureForSelector:subclass];
        objc_registerClassPair(subclass);
    }
    
    //4.将原来的对象的类替换为子类, 可以执行子类的方法
    object_setClass(targetObj, subclass);
    
    //5保存新类
    objc_setAssociatedObject(targetObj, SubclassAssociationKey, subclass, OBJC_ASSOCIATION_ASSIGN);
    return subclass;
}

//MARK: - 交换forwardInvocation方法

- (void)swizzleforwardInvocation:(Class)subclass {
    
    //找到forwardInvocationSEL方法
    SEL forwardInvocationSEL = @selector(forwardInvocation:);
    Method forwardInvocationMethod = class_getInstanceMethod(subclass, forwardInvocationSEL);
    
    
    //修改forwardInvocation的IMP指针
    void (*originalForwardInvocation)(id, SEL, NSInvocation *) = NULL;
    if (forwardInvocationMethod != NULL) {
        //使用IMP指针指向forwardInvocationSEL的实现
        originalForwardInvocation = (__typeof__(originalForwardInvocation))method_getImplementation(forwardInvocationMethod);
    }
    
    
    
    id newForwardInvocation = ^(id self, NSInvocation *invocation) {
        
//        NSLog(@"1.0_执行forwardInvocationSEL");
        BOOL matched = [self clasSforwardInvocation:invocation];
        if (matched) return;
        
        if (originalForwardInvocation == NULL) {
            //主动抛出错误
            [self doesNotRecognizeSelector:invocation.selector];
        } else {
            originalForwardInvocation(self, forwardInvocationSEL, invocation);
        }
    };
    
    class_replaceMethod(subclass, forwardInvocationSEL, imp_implementationWithBlock(newForwardInvocation), "v@:@");
}

- (BOOL)clasSforwardInvocation:(NSInvocation *)invocation {
    
    
    SEL aliasSelector = NSSelectorFromString([SelectorAliasPrefix stringByAppendingString:NSStringFromSelector(invocation.selector)]);;
//    NSLog(@"1.1_获取invocation.selector, 并转换成新的aliasSelector = %@",NSStringFromSelector(aliasSelector));
    
    Class class = object_getClass(invocation.target);
//    NSLog(@"1.2_获取object_getClass(invocation.target),invocation.targetClass =  = %@",NSStringFromClass(class));
    
    BOOL respondsToAlias = [class instancesRespondToSelector:aliasSelector];
    if (respondsToAlias) {
//        NSLog(@"1.3_如果class包含新的aliasSelector方法,则执行aliasSelector \n class = %@ \n aliasSelector = %@",class,NSStringFromSelector(aliasSelector));
        invocation.selector = aliasSelector;
        //执行aliasSelector方法
        [invocation invoke];
    }
    
    NSUInteger numberOfArguments = invocation.methodSignature.numberOfArguments;
    NSMutableArray *argumentsArray = [NSMutableArray arrayWithCapacity:numberOfArguments - 2];
    
    for (NSUInteger index = 2; index < numberOfArguments; index++) {
        [argumentsArray addObject:[self argumentAtIndex:index invocation:invocation] ? : [NSObject new]];
    }
    
    NSMutableArray *callBackArr =  objc_getAssociatedObject(self, aliasSelector);
    for (NSInteger i = 0; i < callBackArr.count; i++) {
        
        NSDictionary *keyCallBack = callBackArr[i];
        void(^CallBack)(NSArray *arguments) = keyCallBack[@"callBack"];
        CallBack(argumentsArray);
        
    }
    
    
    return YES;
}
//
//#define WRAP_AND_RETURN(type) \
//do { \
//type val = 0; \
//[self getArgument:&val atIndex:(NSInteger)index]; \
//return @(val); \
//}


- (id)argumentAtIndex:(NSUInteger)index invocation:(NSInvocation *)invocation{
#define WRAP_AND_RETURN(type,invocation) \
do { \
type val = 0; \
[invocation getArgument:&val atIndex:(NSInteger)index]; \
return @(val); \
} while (0)

    
    NSMethodSignature *methodSignature = invocation.methodSignature;
    const char *argType = [methodSignature getArgumentTypeAtIndex:index];
    if (argType[0] == 'r') {
        argType++;
    }
    
    if (strcmp(argType, @encode(id)) == 0 || strcmp(argType, @encode(Class)) == 0) {
        __autoreleasing id returnObj;
        [invocation getArgument:&returnObj atIndex:(NSInteger)index];
        return returnObj;
    } else if (strcmp(argType, @encode(char)) == 0) {
        WRAP_AND_RETURN(char,invocation);
    } else if (strcmp(argType, @encode(int)) == 0) {
        WRAP_AND_RETURN(int,invocation);
    } else if (strcmp(argType, @encode(short)) == 0) {
        WRAP_AND_RETURN(short,invocation);
    } else if (strcmp(argType, @encode(long)) == 0) {
        WRAP_AND_RETURN(long,invocation);
    } else if (strcmp(argType, @encode(long long)) == 0) {
        WRAP_AND_RETURN(long long,invocation);
    } else if (strcmp(argType, @encode(unsigned char)) == 0) {
        WRAP_AND_RETURN(unsigned char,invocation);
    } else if (strcmp(argType, @encode(unsigned int)) == 0) {
        WRAP_AND_RETURN(unsigned int,invocation);
    } else if (strcmp(argType, @encode(unsigned short)) == 0) {
        WRAP_AND_RETURN(unsigned short,invocation);
    } else if (strcmp(argType, @encode(unsigned long)) == 0) {
        WRAP_AND_RETURN(unsigned long,invocation);
    } else if (strcmp(argType, @encode(unsigned long long)) == 0) {
        WRAP_AND_RETURN(unsigned long long,invocation);
    } else if (strcmp(argType, @encode(float)) == 0) {
        WRAP_AND_RETURN(float,invocation);
    } else if (strcmp(argType, @encode(double)) == 0) {
        WRAP_AND_RETURN(double,invocation);
    } else if (strcmp(argType, @encode(BOOL)) == 0) {
        WRAP_AND_RETURN(BOOL,invocation);
    } else if (strcmp(argType, @encode(char *)) == 0) {
        WRAP_AND_RETURN(const char *,invocation);
    } else if (strcmp(argType, @encode(void (^)(void))) == 0) {
        __unsafe_unretained id block = nil;
        [invocation getArgument:&block atIndex:(NSInteger)index];
        return [block copy];
    } else {
        NSUInteger valueSize = 0;
        NSGetSizeAndAlignment(argType, &valueSize, NULL);
        
        unsigned char valueBytes[valueSize];
        [invocation getArgument:valueBytes atIndex:(NSInteger)index];
        
        return [NSValue valueWithBytes:valueBytes objCType:argType];
    }
    
    return nil;

    
}


//MARK: - 交换respondsToSelector方法

- (void)swizzleRespondsToSelector:(Class)subclass {
    
    
    SEL respondsToSelector = @selector(respondsToSelector:);
    Method respondsToSelectorMethod = class_getInstanceMethod(subclass, respondsToSelector);
    
    BOOL (*originalRespondsToSelector)(id, SEL, SEL) = (__typeof__(originalRespondsToSelector))method_getImplementation(respondsToSelectorMethod);
    
    id newRespondsToSelector = ^ BOOL (id self, SEL selector) {
        Method method = [self getImmediateInstanceMethod:subclass sel:@selector(selector)];
        
        if (method != NULL && method_getImplementation(method) == _objc_msgForward) {
//            SEL aliasSelector = RACAliasForSelector(selector);
//            if (objc_getAssociatedObject(self, aliasSelector) != nil) return YES;
        }
        
        return originalRespondsToSelector(self, respondsToSelector, selector);
    };

    
    class_replaceMethod(subclass, respondsToSelector, imp_implementationWithBlock(newRespondsToSelector), method_getTypeEncoding(respondsToSelectorMethod));
}


- (Method)getImmediateInstanceMethod:(Class)aClass sel:(SEL)aSelector {
    unsigned methodCount = 0;
    Method *methods = class_copyMethodList(aClass, &methodCount);
    Method foundMethod = NULL;
    
    for (unsigned methodIndex = 0;methodIndex < methodCount;++methodIndex) {
        if (method_getName(methods[methodIndex]) == aSelector) {
            foundMethod = methods[methodIndex];
            break;
        }
    }
    
    free(methods);
    return foundMethod;
}


//MARK: - 交换Class方法

- (void)swizzleGetClass:(Class)subClass statedClass:(Class)statedClass {
    SEL selector = @selector(class);
    Method method = class_getInstanceMethod(subClass, selector);
    IMP newIMP = imp_implementationWithBlock(^(id self) {
        return statedClass;
    });
    class_replaceMethod(subClass, selector, newIMP, method_getTypeEncoding(method));
}

//MARK: - 交换MethodSignatureForSelector

- (void)swizzleMethodSignatureForSelector:(Class)subClass {
    
    IMP newIMP = imp_implementationWithBlock(^(id self, SEL selector) {
        // Don't send the -class message to the receiver because we've changed
        // that to return the original class.
        Class actualClass = object_getClass(self);
        Method method = class_getInstanceMethod(actualClass, selector);
        if (method == NULL) {
            // Messages that the original class dynamically implements fall
            // here.
            //
            // Call the original class' -methodSignatureForSelector:.
            struct objc_super target = {
                .super_class = class_getSuperclass(subClass),
                .receiver = self,
            };
            NSMethodSignature * (*messageSend)(struct objc_super *, SEL, SEL) = (__typeof__(messageSend))objc_msgSendSuper;
            return messageSend(&target, @selector(methodSignatureForSelector:), selector);
        }
        
        char const *encoding = method_getTypeEncoding(method);
        return [NSMethodSignature signatureWithObjCTypes:encoding];
    });
    
    SEL selector = @selector(methodSignatureForSelector:);
    Method methodSignatureForSelectorMethod = class_getInstanceMethod(subClass, selector);
    class_replaceMethod(subClass, selector, newIMP, method_getTypeEncoding(methodSignatureForSelectorMethod));
}



- (void)removeObserverWithName:(NSString *)observerName selector:(SEL)aselector {
    
    NSCParameterAssert(observerName != nil);
    NSCParameterAssert(aselector != NULL);

    SEL newSel = NSSelectorFromString([SelectorAliasPrefix stringByAppendingString:NSStringFromSelector(aselector)]);
    
    NSMutableArray *callBackArr =  objc_getAssociatedObject(self, newSel);
    if (callBackArr.count) {

        for (NSInteger i = callBackArr.count-1; i >= 0; i--) {
            NSDictionary *keyCallBack = callBackArr[i];
            if ([keyCallBack[@"key"] isEqualToString:observerName]) {
                [callBackArr removeObject:keyCallBack];
            }
        }
        
        objc_setAssociatedObject(self, newSel, callBackArr, OBJC_ASSOCIATION_RETAIN);
    }

    
}

@end
