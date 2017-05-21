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
@synthesize mode;
@synthesize success;
@synthesize error;

-(id)init{
    if(self = [super init]) {
        Class TinyPlus=NSClassFromString(@"TinyPlus");
        if(TinyPlus){
            id tinyPlusInPod  =  [[TinyPlus alloc] init];
            if([tinyPlusInPod respondsToSelector:@selector(getViewController)]){
                self.viewController =[tinyPlusInPod performSelector:@selector(getViewController)];
            }
        }
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
         mode:mode
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
    }
}

-(void)WXPayError
{
    if(self.error != nil) {
        [self.error callWithArguments:@[@"失败"]];
        success = nil;
        error = nil;
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"WXPaySuccess" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"WXPayError" object:nil];
}

@end


