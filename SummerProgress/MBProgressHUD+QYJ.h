//
//  MBProgressHUD+QYJ.h
//  ETONE
//
//  Created by Summer on 8/23/16.
//
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (QYJ)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+(void)showLightSuccess:(NSString *)success;
+ (void)showLightError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message withView:(UIView *)view;
+ (MBProgressHUD *)showLightMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;
@end
