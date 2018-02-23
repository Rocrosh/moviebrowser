//
//  MovieListDOM.m
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import "MovieListDOM.h"

@implementation MovieListDOM
@synthesize movie_date,movie_name,movie_image,movie_id,movie_popularity,movie_rating;

-(id)init{
    
    self = [super init];
    
    if (self) {
        
        movie_id = @"";
        movie_image = @"";
        movie_name = @"";
        movie_date = @"";
        movie_popularity = @"";
        movie_rating = @"";
    }

    return self;
}
@end
