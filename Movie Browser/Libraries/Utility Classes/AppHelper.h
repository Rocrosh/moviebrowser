//
//  AppHelper.h
//  Goa Tourisam
//
//  Created by Rushikesh Khadsare on 22/02/16.
//  Copyright © 2016 Rushikesh Khadsare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppHelper : NSObject

+ (id)sharedInstance;

#pragma mark - Phone Number Validation

-(BOOL) validatePhone:(NSString *)phoneNumber;
-(BOOL) validatePinCode:(NSString *)pinCode;

#pragma mark - CHeck if email is valid

-(BOOL) NSStringIsValidEmail:(NSString *)checkString;
-(void)GAScreenView : (NSString *)ScreenName;
//-(void)GAButtonClicked:(UIButton *)button Category:(NSString *)category Event:(NSString *)eventname;

@end
