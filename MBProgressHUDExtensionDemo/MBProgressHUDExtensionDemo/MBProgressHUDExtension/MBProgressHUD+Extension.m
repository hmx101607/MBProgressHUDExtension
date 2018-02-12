//
//  MBProgressHUD+Extension.m
//  qingxun
//
//  Created by mason on 15/12/30.
//
//

#import "MBProgressHUD+Extension.h"

#define DelayTime   1
#define APPWindow   [UIApplication sharedApplication].keyWindow
#define STRING_OR_EMPTY(A)  ({ __typeof__(A) __a = (A); __a ? __a : @""; })
#define SCREEN_WIDTH MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)
#define SCREEN_HEIGHT MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)

@implementation MBProgressHUD (Extension)

+ (void)showLoadingHUD:(UIView *)view{
    if (view) {
        [self hideHUD:view];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        [hud setUserInteractionEnabled:YES];
    }
}

+ (void)showLoadingHUD{
    [self hideHUD:APPWindow];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:APPWindow animated:YES];
    [hud setUserInteractionEnabled:YES];
}

+ (void)showCustomLoadingHub:(UIView *)customView withView:(UIView *)view{
    [self hideHUD:view];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:APPWindow];
    [APPWindow addSubview:hud];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = customView;
    hud.color = [UIColor clearColor];
    [hud show:YES];
    [hud setUserInteractionEnabled:YES];
}

+ (void)showLoadingHUDWithText:(NSString *)text{
    [self hideHUD:APPWindow];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:APPWindow animated:YES];
    [hud setUserInteractionEnabled:YES];
    hud.labelText = STRING_OR_EMPTY(text);
}

+ (MBProgressHUD *)showLoadingHUDWithText:(NSString *)text view:(UIView *)view{
    [self hideHUD:view];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud setUserInteractionEnabled:YES];
    hud.labelText = STRING_OR_EMPTY(text);
    return hud;
}

+ (void)hideHUD
{
    [MBProgressHUD hideAllHUDsForView:APPWindow animated:YES];
}

+ (void)hideHUD:(UIView *)view
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

+ (void)showHUDWithSuccessText:(NSString *)successText{
    [self showHUDWithCustom:AlertSuccessImage withText:successText view:APPWindow];
}

+ (void)showHUDWithFailedText:(NSString *)failedText{
    [self showHUDWithCustom:AlertFailureImage withText:failedText view:APPWindow];
}

+ (void)showHUDWithAlertText:(NSString *)alertText{
    [self showHUDWithCustom:AlertWarningImage withText:alertText view:APPWindow];
}

+ (void)showHUDWithSuccessText:(NSString *)successText view:(UIView *)view
{
    if (view) {
        [self showHUDWithCustom:AlertSuccessImage withText:successText view:view];
    }
}

+ (void)showHUDWithFailedText:(NSString *)failedText view:(UIView *)view
{
    if (view) {
        [self showHUDWithCustom:AlertFailureImage withText:failedText view:view];
    }
}

+ (void)showHUDWithAlertText:(NSString *)alertText view:(UIView *)view
{
    if (view) {
        [self showHUDWithCustom:AlertWarningImage withText:alertText view:view];
    }
}

+ (void)showHUDWithCustom:(NSString *)customImageName withText:(NSString *)customText view:(UIView *)view{
    [self showHUDWithCustom:customImageName withText:customText view:view autoHide:YES];
}

+ (MBProgressHUD *)showHUDWithCustom:(NSString *)customImageName withText:(NSString *)customText view:(UIView *)view autoHide:(BOOL)autoHide {
    [self hideHUD:view];
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:view];
    [view addSubview:hud];
    hud.mode = MBProgressHUDModeCustomView;
    
    CGSize size = [customText boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 120, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil].size;
    UIImage *image = [UIImage imageNamed:customImageName];
    
    CGFloat maxWidth = MAX(size.width , image.size.width);
    
    MBProgressHUDCoustomView *coustomView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MBProgressHUDCoustomView class]) owner:nil options:nil] firstObject];
    [coustomView setFrame:CGRectMake(0, 0, maxWidth + 10, image.size.height + 15 + size.height)];
    [coustomView setImageName:customImageName withPrompt:customText];
    hud.customView = coustomView;
    
    [hud show:YES];
    if (autoHide) {
        [hud hide:YES afterDelay:DelayTime];
    }
    
    return hud;
}

@end
