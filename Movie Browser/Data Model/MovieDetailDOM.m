//
//  MovieDetailDOM.m
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import "MovieDetailDOM.h"

@implementation MovieDetailDOM
@synthesize movie_release_date,movie_name,movie_image,movie_id,movie_overview,movie_rating,movie_popularity;

-(id)init{
    
    self = [super init];
    
    if (self) {
        
        movie_id = @"";
        movie_image = @"";
        movie_name = @"";
        movie_release_date = @"";
        movie_overview = @"";
        movie_rating = @"";
        movie_popularity = @"";
    }
    
    return self;
}

@end
