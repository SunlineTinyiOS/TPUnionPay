//
//  TPUnionPay.m
//  Pods
//
//  Created by kingdomrain on 2017/2/15.
//
//

#import "TPUnionPay.h"
#import "UPPaymentControl.h"


@implementation TPUnionPay
@synthesize tn;
@synthesize success;
@synthesize error;

-(id)init{
    if(self = [super init]) {
          self.viewController  = [UIApplication sharedApplication].keyWindow.rootViewController;
    }
    return self;
}


-(void)pay{
    //当获得的tn不为空时，调用支付接口
    if (tn != nil && tn.length > 0)
    {
        [[UPPaymentControl defaultControl]
         startPay:tn
         fromScheme:@"UPPayDemo"
         mode:@"01"
         viewController:self.viewController];
    }
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector (WXPaySuccess) name:@"WXPaySuccess" object:nil];
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector (WXPayError) name:@"WXPayError" object:nil];
    
}

-(void)WXPaySuccess
{
    if(self.success != nil) {
        [self.success callWithArguments:@[@"成功"]];
        success = nil;
        error = nil;
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"WXPaySuccess" object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"WXPayError" object:nil];
    }
}

-(void)WXPayError
{
    if(self.error != nil) {
        [self.error callWithArguments:@[@"失败"]];
        success = nil;
        error = nil;
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"WXPaySuccess" object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"WXPayError" object:nil];
        
    }
}

-(void)dealloc
{

}

@end


