//
//  TPUnionPay.h
//  Pods
//
//  Created by kingdomrain on 2017/2/15.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JSExport.h>
#import <UIKit/UIKit.h>

@protocol TPUnionPayProtocol<JSExport>

@property(nonatomic, strong) NSString *tn;

@property(nonatomic, strong) JSValue *success;

@property(nonatomic, strong) JSValue *error;

/**
 *  支付
 */
-(void)pay;
@end

@interface TPUnionPay : NSObject<TPUnionPayProtocol>
@property (nonatomic , strong) UIViewController *viewController;


@end
