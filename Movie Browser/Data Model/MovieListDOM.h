//
//  MovieListDOM.h
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieListDOM : NSObject

@property (strong,nonatomic) NSString *movie_id;
@property (strong,nonatomic) NSString *movie_name;
@property (strong,nonatomic) NSString *movie_date;
@property (strong,nonatomic) NSString *movie_image;
@property (strong,nonatomic) NSString *movie_popularity;
@property (assign,nonatomic) float movie_rating;

@end
