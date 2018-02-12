//
//  MBProgressHUDCoustomView.m
//  qingxun
//
//  Created by mason on 16/3/3.
//
//
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#import "MBProgressHUDCoustomView.h"


@interface MBProgressHUDCoustomView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;

@end

@implementation MBProgressHUDCoustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setBackgroundColor:RGBA(0, 0, 0, 0)];
}

- (void) setImageName:(NSString *)imageName withPrompt:(NSString *)prompt
{
    [self setimage:[UIImage imageNamed:imageName] withPrompt:prompt];
}

- (void)setimage:(UIImage *)image withPrompt:(NSString *)prompt {
    [self.imageView setImage:image];
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:prompt attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}];
    [self.promptLabel setAttributedText:attr];
    
}

+ (UIView *)hotelLoadingGifView {
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 88, 110);
    
//    UIImage *image = [YYImage imageNamed:@"dcloading.gif"];
//    UIImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
//    imageView.frame = CGRectMake(0, 0, 88, 88);
//    [view addSubview:imageView];
//
//    UILabel *label = [[UILabel alloc] init];
//    label.frame = CGRectMake(0, 88, 88, 22);
//    [view addSubview:label];
//    label.text = @"拼命加载中...";
//    label.font = [UIFont systemFontOfSize:14.f];
//    label.textColor = RGB(102, 102, 102);
    return view;
}


@end
