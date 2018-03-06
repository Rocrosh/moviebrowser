//
//  UserActivityDOM.h
//  Movie Browser
//
//  Created by Quentin Desouza on 23/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserActivityDOM : NSObject

typedef enum : NSUInteger {
    MostPopular = 1,
    TopRated = 2,
    SearchList = 3,
    
} LoadingType;

@property LoadingType LoadingFor;
@property(nonatomic,strong) NSString *SortType;
@property(nonatomic,strong) NSMutableArray *arrSelectedsort;
@property(nonatomic,strong) NSString *SearchText;

+(id)sharedInstance;
-(void)clearData;
@end
