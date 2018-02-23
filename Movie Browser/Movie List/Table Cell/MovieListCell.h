//
//  MovieListCell.h
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieListCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *poster_img;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblRating;
@property (strong, nonatomic) IBOutlet UIView *RatingView;

@end
