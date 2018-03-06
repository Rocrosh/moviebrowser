//
//  MovieDetailDOM.h
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailDOM : NSObject

@property (strong,nonatomic) NSString *movie_id;
@property (strong,nonatomic) NSString *movie_name;
@property (strong,nonatomic) NSString *movie_release_date;
@property (strong,nonatomic) NSString *movie_image;
@property (strong,nonatomic) NSString *movie_overview;
@property (strong,nonatomic) NSString *movie_rating;
@property (strong,nonatomic) NSString *movie_popularity;

@end
