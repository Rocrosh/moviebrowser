//
//  CircularMenuView.h
//  Engrid
//
//  Created by Quentin Desouza on 30/10/17.
//  Copyright © 2017 Quentin Desouza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface CircularMenuView : UIView<IGCMenuDelegate>
{
    IGCMenu *igcMenu;
    HomeViewController *homeView;
}
@property (strong, nonatomic) IBOutlet UIButton *btnMenu;
- (IBAction)btnMenuClicked:(id)sender;

@end
