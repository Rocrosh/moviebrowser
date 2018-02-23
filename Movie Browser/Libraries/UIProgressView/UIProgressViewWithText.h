

#import <UIKit/UIKit.h>

@interface UIProgressViewWithText : UIView

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UILabel *lblPrgoress;


-(void)startAnimating;
-(void)stopAnimating;

@end
