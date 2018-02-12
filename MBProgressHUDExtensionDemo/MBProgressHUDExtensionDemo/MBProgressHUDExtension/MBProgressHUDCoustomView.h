//
//  MBProgressHUDCoustomView.h
//  qingxun
//
//  Created by mason on 16/3/3.
//
//

#import <UIKit/UIKit.h>

@interface MBProgressHUDCoustomView : UIView

- (void) setImageName:(NSString *)imageName withPrompt:(NSString *)prompt;

- (void)setimage:(UIImage *)image withPrompt:(NSString *)prompt;

+ (UIView *)hotelLoadingGifView;

@end
