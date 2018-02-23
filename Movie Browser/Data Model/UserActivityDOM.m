//
//  UserActivityDOM.m
//  Movie Browser
//
//  Created by Quentin Desouza on 23/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import "UserActivityDOM.h"

@implementation UserActivityDOM
@synthesize SortType,arrSelectedsort,SearchText,LoadingFor;

+(id)sharedInstance{
    static UserActivityDOM *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        SortType = @"popular";
        arrSelectedsort = [[NSMutableArray alloc] initWithObjects:@"1",@"0", nil];
        SearchText = @"";
    }
    
    return self;
}

-(void)clearData{
    
    SortType = @"popular";
    arrSelectedsort = [[NSMutableArray alloc] initWithObjects:@"1",@"0", nil];
    SearchText = @"";
    
}
@end
