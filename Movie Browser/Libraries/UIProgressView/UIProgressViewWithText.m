
#import "UIProgressViewWithText.h"

@implementation UIProgressViewWithText

@synthesize activityIndicator;
@synthesize lblPrgoress;

-(id)init
{
    self = [super init];
    
    if (self)
    {
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityIndicator.hidesWhenStopped = YES;
        activityIndicator.frame = CGRectMake(0.0, 0.0, 20.0, 20.0);
        [self addSubview:activityIndicator];
        
        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 60.0, 80.0, 20.0)];
        lblTitle.text = @"Loading...";
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.font = [UIFont systemFontOfSize:12.0];
        lblTitle.textColor = [UIColor whiteColor];
        [self addSubview:lblTitle];
        
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
        self.layer.cornerRadius = 5.0;
        self.frame = CGRectMake(0.0, 0.0, 90.0, 90.0);
        activityIndicator.center = self.center;
    }
    self.alpha = 0.0;
    return self;
}

-(void)startAnimating
{
    self.alpha = 1.0;
    [activityIndicator startAnimating];
}


-(void)stopAnimating
{
    self.alpha = 0.0;
    [activityIndicator stopAnimating];
}

@end
