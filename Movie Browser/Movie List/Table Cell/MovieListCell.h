//
//  MovieListCell.h
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *poster_img;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblRating;
@property (weak, nonatomic) IBOutlet UIView *RatingView;

@end
