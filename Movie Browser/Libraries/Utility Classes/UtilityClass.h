//
//  UtilityClass.h
//  Engrid
//
//  Created by Quentin Desouza on 10/04/17.
//  Copyright © 2017 Quentin Desouza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>

typedef void (^RequestCompletionBlock)(id response, NSError *error);


@interface UtilityClass : NSObject
{
    RequestCompletionBlock datablock;
}
-(void)GetDataFromURL:(NSString *)Path View:(UIView *)viewName withData:(RequestCompletionBlock)block;

+(void)Notification:(NSString *)Str_text view_name:(UIView *)View;
+(int)GetRandomNumber:(int)from To:(int)to;

@end
