//
//  UIViewController+BackButtonWithImage.m
//  PharmEasy
//
//  Created by Rushikesh for PharmEasy on 29/03/15.
//  Copyright (c) 2015 pharmEasy. All rights reserved.
//

#import "UIViewController+BackButtonWithImage.h"

@implementation UIViewController (BackButtonWithImage)

- (void)setUpImageBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"arrow-back_new"] forState:UIControlStateNormal];
    UIBarButtonItem *barBackButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(popCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barBackButtonItem;
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
}

- (void)popCurrentViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)SetNavigationBarTitle:(NSString *)Title{
    
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    lbl.textAlignment = NSTextAlignmentLeft;
    lbl.font = [UIFont boldSystemFontOfSize:18];
    lbl.textColor = [UIColor whiteColor];
    lbl.numberOfLines = 0;
    lbl.lineBreakMode = NSLineBreakByWordWrapping;
    lbl.text = Title;
    
    self.navigationItem.titleView = lbl;
    
    [[self.navigationController navigationBar]setBarTintColor:UIColorThemeColor];
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor whiteColor],NSForegroundColorAttributeName, nil];
    [[self.navigationController navigationBar] setTitleTextAttributes:navbarTitleTextAttributes];
    
}

@end
