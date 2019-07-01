//
//  MBProgressHUD+QYJ.m
//  ETONE
//
//  Created by Summer on 8/23/16.
//
//

#import "MBProgressHUD+QYJ.h"

@implementation MBProgressHUD (QYJ)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    [self configHUD:hud];
    // 设置图片
//    hud.customView = [self customView];
    //设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.7];
}

+ (void)showLight:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    [self configLightHUD:hud];
    // 设置图片
    hud.customView = [self customView];
    //设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.7];
}



#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

+(void)showLightSuccess:(NSString *)success
{
    [self showLight:success icon:nil view:nil];
}
+ (void)showLightError:(NSString *)error
{
    [self showLight:error icon:nil view:nil];
}


#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil)
    {
      view = [UIApplication sharedApplication].keyWindow;
    }
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText =message;
//    hud.customView = [self customView];
    [self configHUD:hud];
    
    //设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

+(void)configHUD:(MBProgressHUD *)HUD
{
    HUD.color = [UIColor clearColor];
    HUD.labelColor = [UIColor darkGrayColor];
    HUD.labelFont = [UIFont systemFontOfSize:12];
}

+(void)configLightHUD:(MBProgressHUD *)HUD
{
    HUD.color = [UIColor clearColor];
    HUD.labelColor = [UIColor whiteColor];
    HUD.labelFont = [UIFont systemFontOfSize:12];
}

//加载一个自定义动态图
+(UIImageView *)customView
{
    NSMutableArray * imageArray = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_0%d",i + 1]];
        [imageArray addObject:image];
    }
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 18)];
    imageView.animationImages = imageArray;
    imageView.animationDuration = 0.4;
    [imageView startAnimating];
    return imageView;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}
+ (MBProgressHUD *)showMessage:(NSString *)message withView:(UIView *)view
{
    return [self showMessage:message toView:view];

}

+ (MBProgressHUD *)showLightMessage:(NSString *)message
{
    UIView * view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = @"为您加载中...";
    hud.customView = [self customView];
    [self configLightHUD:hud];
    
    //设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

@end
