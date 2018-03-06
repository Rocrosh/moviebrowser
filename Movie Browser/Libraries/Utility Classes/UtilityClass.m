//
//  UtilityClass.m
//  Engrid
//
//  Created by Quentin Desouza on 10/04/17.
//  Copyright © 2017 Quentin Desouza. All rights reserved.
//

#import "UtilityClass.h"

@implementation UtilityClass
{
    UIProgressViewWithText *activity;
}

-(void)GetDataFromURL:(NSString *)Path View:(UIView *)viewName withData:(RequestCompletionBlock)block{
    
    activity = [[UIProgressViewWithText alloc] init];
    activity.center = viewName.center;
    [viewName addSubview:activity];
    [viewName bringSubviewToFront:activity];
    
    [activity startAnimating];
//    [viewName setUserInteractionEnabled:NO];
    
    if (block) {
        datablock=[block copy];
    }
    
    Path = [Path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
//    NSLog(@"%@%@",BASE_URL,Path);
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BASE_URL,Path]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
// 3
//        NSMutableDictionary *Dict = (NSMutableDictionary *)responseObject;
//        NSLog(@"%@",Dict);
        
        if (datablock) {
            if(responseObject==nil)
                datablock(operation.responseString,nil);
            else
                datablock(responseObject,nil);
        }
        
        [activity stopAnimating];
//        [viewName setUserInteractionEnabled:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [activity stopAnimating];
//        [viewName setUserInteractionEnabled:YES];
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
    }];
    
    // 5
    [operation start];

}

+(void)Notification:(NSString *)Str_text view_name:(UIView *)View{
    UIView *headerview = [[UIView alloc] initWithFrame:CGRectMake(0, View.frame.size.height, View.frame.size.width,60.0)];
    headerview.backgroundColor = [UIColor colorWithRed:39.0/255.0 green:55.0/255.0 blue:70.0/255.0 alpha:1.0];
    
    headerview.tag = 9999;
    
    UILabel *headerlabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, View.frame.size.width - 20, 60.0)];
    [headerlabel setFont:[UIFont systemFontOfSize:14.0]];
    headerlabel.numberOfLines = 0;
    headerlabel.lineBreakMode = NSLineBreakByWordWrapping;
    headerlabel.textAlignment = NSTextAlignmentCenter;
    headerlabel.text = Str_text;
    headerlabel.textColor = [UIColor whiteColor];
    
    [View addSubview:headerview];
    [headerview addSubview:headerlabel];
    [View addSubview:headerview];
    [UIView animateWithDuration:.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        headerview.frame  = CGRectMake(0, View.frame.size.height - 60.0, View.frame.size.width,60.0);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.5 delay:2.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            headerview.frame  = CGRectMake(0, View.frame.size.height, View.frame.size.width,30);
            
        } completion:^(BOOL finished) {
            [[View viewWithTag:9999]removeFromSuperview];
            
        }];
    }];
}

+(int)GetRandomNumber:(int)from To:(int)to{
    return from + arc4random() % to;
}


@end
