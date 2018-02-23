//
//  UIViewController+BackButtonWithImage.h
//  PharmEasy
//
//  Created by Rushikesh for PharmEasy on 29/03/15.
//  Copyright (c) 2015 pharmEasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BackButtonWithImage)<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

- (void)setUpImageBackButton;
- (void)SetNavigationBarTitle:(NSString *)Title;
@end
