//
//  DetailView.m
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import "DetailView.h"
#import "UIImageView+WebCache.h"

@implementation DetailView{
    UIView *titleView,*galleryView,*synopsisView,*RatingView,*DateView;
}
@synthesize detailDOM,scrContainer;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    [super awakeFromNib];

}

-(void)CreateTitleView{
    
    NSLog(@"DETAILVIEW");
    
    titleView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, scrContainer.frame.size.width, 60.0)];
    
    [scrContainer addSubview:titleView];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, titleView.frame.size.width - 10.0, titleView.frame.size.height)];
    
    NSLog(@"movie_name - %@",detailDOM.movie_name);
    
    lblTitle.text = detailDOM.movie_name;
    lblTitle.font = [UIFont systemFontOfSize:22];
    lblTitle.textColor = [UIColor darkGrayColor];
    lblTitle.numberOfLines = 0;
    lblTitle.lineBreakMode = NSLineBreakByWordWrapping;
    [titleView addSubview:lblTitle];
    
    [self CreateGalleryView];
}

-(void)CreateGalleryView{
    
    float height = scrContainer.frame.size.width / 2;
    
    galleryView = [[UIView alloc] initWithFrame:CGRectMake(0.0, titleView.frame.origin.y + titleView.frame.size.height, scrContainer.frame.size.width, height)];
    
    [scrContainer addSubview:galleryView];
    
    UIImageView *img_view = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, galleryView.frame.size.width, galleryView.frame.size.height)];
    
    [img_view sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_URL,detailDOM.movie_image]] completed:nil];
    [galleryView addSubview:img_view];
    [self CreateSynopsisView];
    
}

-(void)CreateSynopsisView{
    
    synopsisView = [[UIView alloc] initWithFrame:CGRectMake(0.0, galleryView.frame.origin.y + galleryView.frame.size.height, scrContainer.frame.size.width, 150.0)];
    
    [scrContainer addSubview:synopsisView];
    
    UILabel *lblOverview = [[UILabel alloc] initWithFrame:CGRectMake(10.0,0.0,synopsisView.frame.size.width - 20.0,40.0)];
    lblOverview.text = @"Overview";
    lblOverview.textColor = [UIColor darkGrayColor];
    
    lblOverview.font = FontRegular24;
    [synopsisView addSubview:lblOverview];
    
    UILabel *lblSynopsis = [[UILabel alloc] initWithFrame:CGRectMake(10.0, lblOverview.frame.origin.y + lblOverview.frame.size.height, synopsisView.frame.size.width - 20.0, 70.0)];
    lblSynopsis.font = [UIFont systemFontOfSize:14.0];
    lblSynopsis.textColor = [UIColor darkGrayColor];
    lblSynopsis.numberOfLines = 0;
    lblSynopsis.lineBreakMode = NSLineBreakByWordWrapping;
    lblSynopsis.text = detailDOM.movie_overview;
    CGRect frame = [self getHeightForText:detailDOM.movie_overview];
    lblSynopsis.frame = CGRectMake(lblSynopsis.frame.origin.x, lblSynopsis.frame.origin.y, lblSynopsis.frame.size.width, frame.size.height + 10.0);
    [synopsisView addSubview:lblSynopsis];
    
    synopsisView.frame = CGRectMake(synopsisView.frame.origin.x, synopsisView.frame.origin.y, synopsisView.frame.size.width, lblSynopsis.frame.origin.y + lblSynopsis.frame.size.height);
    
    scrContainer.contentSize = CGSizeMake(0.0, synopsisView.frame.size.height + synopsisView.frame.origin.y);
    
    [self CreateRatingView];
    
}

-(void)CreateRatingView{
    RatingView = [[UIView alloc] initWithFrame:CGRectMake(0.0, synopsisView.frame.origin.y + synopsisView.frame.size.height, scrContainer.frame.size.width, 50.0)];
    
    [scrContainer addSubview:RatingView];
    
    UIView *subHeaderView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, RatingView.frame.size.width - 20, 1.0)];
    subHeaderView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:234.0/255.0 blue:241.0/255.0 alpha:1.0];
    [RatingView addSubview:subHeaderView];
    
    UILabel *lblText = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, 90.0, RatingView.frame.size.height)];
    
    lblText.text = @"Rating : ";
    lblText.font = FontRegular20;
    lblText.textColor = [UIColor darkGrayColor];
    [RatingView addSubview:lblText];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(lblText.frame.size.width, 5.0, 40.0, 40.0)];
    view.backgroundColor = [UIColor redColor];
    view.layer.cornerRadius = 20;
    
    [RatingView addSubview:view];
    
    UILabel *lblRating  = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,view.frame.size.width, view.frame.size.height)];
    lblRating.text = detailDOM.movie_rating;
    lblRating.font = FontRegular20;
    lblRating.textColor = [UIColor whiteColor];
    lblRating.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lblRating];
    
    [self CreateDateView];
    
}

-(void)CreateDateView{
    DateView = [[UIView alloc] initWithFrame:CGRectMake(0.0, RatingView.frame.origin.y + RatingView.frame.size.height, scrContainer.frame.size.width, 50.0)];
    
    [scrContainer addSubview:DateView];
    
    UIView *subHeaderView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, DateView.frame.size.width - 20, 1.0)];
    subHeaderView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:234.0/255.0 blue:241.0/255.0 alpha:1.0];
    [DateView addSubview:subHeaderView];
    
    UILabel *lblReleaseDate = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, DateView.frame.size.width - 10.0, DateView.frame.size.height)];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:detailDOM.movie_release_date];
    [dateFormatter setDateFormat:@"MMMM, dd YYYY"];
    lblReleaseDate.text = [NSString stringWithFormat:@"Released On : %@",[dateFormatter stringFromDate:date]];
    
    lblReleaseDate.font = FontRegular20;
    lblReleaseDate.textColor = [UIColor darkGrayColor];
    lblReleaseDate.numberOfLines = 0;
    lblReleaseDate.lineBreakMode = NSLineBreakByWordWrapping;
    [DateView addSubview:lblReleaseDate];
    
    scrContainer.contentSize = CGSizeMake(0.0, DateView.frame.size.height + DateView.frame.origin.y + 100.0);
}


#pragma mark - Calculate Lable Height

-(CGRect) getHeightForText:(NSString *)text
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:14.0],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(scrContainer.frame.size.width - 20.0, 999999.0f)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:attributes
                                         context:nil];
    
    return textRect;
}

@end
