# RGCategory

[![CI Status](https://img.shields.io/travis/18607304107@163.com/RGCategory.svg?style=flat)](https://travis-ci.org/18607304107@163.com/RGCategory)
[![Version](https://img.shields.io/cocoapods/v/RGCategory.svg?style=flat)](https://cocoapods.org/pods/RGCategory)
[![License](https://img.shields.io/cocoapods/l/RGCategory.svg?style=flat)](https://cocoapods.org/pods/RGCategory)
[![Platform](https://img.shields.io/cocoapods/p/RGCategory.svg?style=flat)](https://cocoapods.org/pods/RGCategory)

# 框架主要封装了iOS中常用控件的快捷创建方法以及常用功能的快捷实现方法

## UI举例

UI布局创建的代码在“Extension_MAS”文件目录下，包含“UIButton”、“UILabel”、“UICollectionView”、“UIImageView”、“UITableView”、“UIView”等常用控件布局

一行代码创建button

```
UIButton *testBtn = [UIButton ButtonWithNormalTitle:@"测试" NormalTitleColor:[UIColor redColor] FontSize:14 backgroundColor:[UIColor grayColor] supView:self.view buttonMas:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(100);
        make.top.mas_equalTo(100);
        make.width.height.mas_equalTo(50);
    }];
```

一行代码创建label

```
UILabel *testLbl = [UILabel LableWithText:@"测试" textColor:[UIColor blueColor] FontSize:15 supView:self.view lableMas:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(200);
        make.top.mas_equalTo(100);
    }];
```

## 常用功能举例

一行代码字符串转日期
```
NSDate *date = [NSDate dateWithString:@"2019-01-19" dateFormat:@"yyyy-MM-dd"];
```

设置中划线
```
testLbl.attributedText = [@"测试" deleteAttributedString];
```


## 安装方法

RGCategory is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RGCategory'
```

## 期待
如果在使用过程中遇到BUG，希望你能Issues我，谢谢

## 作者

18607304107@163.com

## License

RGCategory is available under the MIT license. See the LICENSE file for more info.
