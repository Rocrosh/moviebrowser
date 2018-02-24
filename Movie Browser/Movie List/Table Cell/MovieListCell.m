//
//  MovieListCell.m
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import "MovieListCell.h"

@implementation MovieListCell
@synthesize poster_img,lblTitle,lblRating,RatingView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    RatingView.layer.cornerRadius = 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
