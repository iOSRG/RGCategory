# RGCategory

[![CI Status](https://img.shields.io/travis/18607304107@163.com/RGCategory.svg?style=flat)](https://travis-ci.org/18607304107@163.com/RGCategory)
[![Version](https://img.shields.io/cocoapods/v/RGCategory.svg?style=flat)](https://cocoapods.org/pods/RGCategory)
[![License](https://img.shields.io/cocoapods/l/RGCategory.svg?style=flat)](https://cocoapods.org/pods/RGCategory)
[![Platform](https://img.shields.io/cocoapods/p/RGCategory.svg?style=flat)](https://cocoapods.org/pods/RGCategory)

##框架主要封装了iOS中常用控件的快捷创建方法以及常用功能的快捷实现方法

## 例如
一行代码创建button

```
UIButton *testBtn = [UIButton ButtonWithNormalTitle:@"测试" NormalTitleColor:[UIColor redColor] FontSize:14 backgroundColor:[UIColor grayColor] supView:self.view buttonMas:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(100);
        make.top.mas_equalTo(100);
        make.width.height.mas_equalTo(50);
    }];
```



## Requirements

## Installation

RGCategory is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RGCategory'
```

## Author

18607304107@163.com, gui.ren@hand-china.com

## License

RGCategory is available under the MIT license. See the LICENSE file for more info.
