//
//  MBProgressHUD+Extension.h
//  qingxun
//
//  Created by mason on 15/12/30.
//
//

#import "MBProgressHUD.h"
#import "MBProgressHUDCoustomView.h"

#define AlertSuccessImage @"icon_alert_success"
#define AlertFailureImage @"icon_alert_failure"
#define AlertWarningImage @"icon_alert_warning"

@interface MBProgressHUD (Extension)

+ (void)showLoadingHUD;

+ (void)showCustomLoadingHub:(UIView *)customView withView:(UIView *)view;

/**
 *  显示加载进度条
 */
+ (void)showLoadingHUD:(UIView *)view;

/**
 *  显示加载进度条和文字
 *
 *  @param text 文字
 */
+ (void)showLoadingHUDWithText:(NSString *)text;

+ (MBProgressHUD *)showLoadingHUDWithText:(NSString *)text view:(UIView *)view;

+ (void)hideHUD;
/**
 *  隐藏
 */
+ (void)hideHUD:(UIView *)view;

/**
 *  显示成功信息
 *
 *  @param successText 成功信息
 */
+ (void)showHUDWithSuccessText:(NSString *)successText;

/**
 *  显示错误信息
 *
 *  @param failedText 错误信息
 */
+ (void)showHUDWithFailedText:(NSString *)failedText;

/**
 *  显示警告信息
 *
 *  @param alertText 警告信息
 */
+ (void)showHUDWithAlertText:(NSString *)alertText;

/**
 *  显示信息
 *
 *  @param failedText 错误信息
 */
+ (void)showHUDWithSuccessText:(NSString *)successText view:(UIView *)view;

+ (void)showHUDWithFailedText:(NSString *)failedText view:(UIView *)view;

+ (void)showHUDWithAlertText:(NSString *)alertText view:(UIView *)view;

/**
 *  显示自定义图案和文字
 *
 *  @param customImage 自定义图案
 *  @param customText  自定义文字
 */
+ (void)showHUDWithCustom:(NSString *)customImageName withText:(NSString *)customText view:(UIView *)view;

+ (MBProgressHUD *)showHUDWithCustom:(NSString *)customImageName withText:(NSString *)customText view:(UIView *)view autoHide:(BOOL)autoHide;

@end



