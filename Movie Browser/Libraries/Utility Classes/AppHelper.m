//
//  AppHelper.m
//  Goa Tourisam
//
//  Created by Rushikesh Khadsare on 22/02/16.
//  Copyright © 2016 Rushikesh Khadsare. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper

+ (id)sharedInstance
{
    static AppHelper *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}


#pragma mark - Phone Number Validation

- (BOOL)validatePhone:(NSString *)phoneNumber
{
    NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    return [phoneTest evaluateWithObject:phoneNumber];
}

-(BOOL) validatePinCode:(NSString *)pinCode
{
    NSScanner *scanner = [NSScanner scannerWithString:pinCode];
    BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
    return isNumeric;
}

#pragma mark - CHeck if email is valid

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    
    return [emailTest evaluateWithObject:checkString];
}
-(void)GAScreenView : (NSString *)ScreenName{
    
//    id tracker = [[GAI sharedInstance] defaultTracker];
//    [tracker set:kGAIScreenName value:ScreenName];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}
//-(void)GAButtonClicked:(UIButton *)button Category:(NSString *)category Event:(NSString *)eventname {
//    
////    id tracker = [[GAI sharedInstance] defaultTracker];
////    
////    [tracker set:kGAIScreenName value:@"default"];
////    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:category
////                                                          action:eventname
////                                                           label:[button.titleLabel text]
////                                                           value:nil] build]];
////    [tracker set:kGAIScreenName value:nil];
//}
@end
