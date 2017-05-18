# TPUnionPay

[![CI Status](http://img.shields.io/travis/kingdomrain/TPUnionPay.svg?style=flat)](https://travis-ci.org/kingdomrain/TPUnionPay)
[![Version](https://img.shields.io/cocoapods/v/TPUnionPay.svg?style=flat)](http://cocoapods.org/pods/TPUnionPay)
[![License](https://img.shields.io/cocoapods/l/TPUnionPay.svg?style=flat)](http://cocoapods.org/pods/TPUnionPay)
[![Platform](https://img.shields.io/cocoapods/p/TPUnionPay.svg?style=flat)](http://cocoapods.org/pods/TPUnionPay)


## Release Notes
### 1.0.0   
基于SDK 3.3.6版本 



## Usage
    var union=new UnionPay();
    union.tn="201605031034241756648";
    union.success=function(data){
        log("success:"+data);
    }
    union.error=function(data){
        log("error:"+data);
    }
    union.pay();


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

1.首先，在AppDelegate文件中引入头文件 TPUnionPay/UPPaymentControl.h。![](https://raw.githubusercontent.com/TinySunline/TPUnionPay/master/READMESource/1.png)  
支付控件结果处理函数handlePaymentResult: completeBlock:需要在工程AppDelegate文件的application: openURL: options: 方法中进行调用。添加如下代码:
    
        //通联支付
    [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
     
     //结果code为成功时，先校验签名，校验成功后做后续处理
     if([code isEqualToString:@"success"]) {
     
     [[NSNotificationCenter defaultCenter] postNotificationName:@"UnionPaySuccess" object:nil];
     
     
     //判断签名数据是否存在
     if(data == nil){
     //如果没有签名数据，建议商户app后台查询交易结果
     return;
     }
     
     //数据从NSDictionary转换为NSString
     NSData *signData = [NSJSONSerialization dataWithJSONObject:data
                                                        options:0
                                                          error:nil];
     NSString *sign = [[NSString alloc] initWithData:signData encoding:NSUTF8StringEncoding];
     
    
     //验签证书同后台验签证书
     //此处的verify，商户需送去商户后台做验签
     //            if([self verify:sign]) {
     //                //支付成功且验签成功，展示支付成功提示
     //            }
     //            else {
     //                //验签失败，交易结果数据被篡改，商户app后台查询交易结果
     //            }
     }
     else if([code isEqualToString:@"fail"]) {
     //交易失败
     [[NSNotificationCenter defaultCenter] postNotificationName:@"UnionPayError" object:nil];
     }
     else if([code isEqualToString:@"cancel"]) {
     //交易取消
     [[NSNotificationCenter defaultCenter] postNotificationName:@"UnionPayError" object:nil];
     }
     }];
 
2.工程配置  
2.1在工程info.plist设置中添加一个URL Types回调协议(在UPPayDemo工程中使用“UPPayDemo”作为协议)，用于在支付完成后返回商户客户端。
     ![](https://raw.githubusercontent.com/TinySunline/TPUnionPay/master/READMESource/2.png) 
2.2在Xcode7.0之后的版本中进行开发，需要在工程对应的plist文件中，添加LSApplicationQueriesSchemes  Array并加入uppaysdk、uppaywallet、uppayx1、uppayx2、uppayx3五个item，具体设置可参考以下截图：
    ![](https://raw.githubusercontent.com/TinySunline/TPUnionPay/master/READMESource/3.png) 
       
3.注册JS扩展  
在tinyPlus.plist中注册JS扩展
    ![](https://raw.githubusercontent.com/TinySunline/TPUnionPay/master/READMESource/4.png)

## Installation

TPUnionPay is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TPUnionPay"
```

## tips
官方帮助文档地址  
https://open.unionpay.com/ajweb/product/detail?id=3


## Author

kingdomrain, bygd2014@sina.com

## License

TPUnionPay is available under the MIT license. See the LICENSE file for more info.

