//
//  MenuViewController.h
//  Engrid
//
//  Created by Quentin Desouza on 11/04/17.
//  Copyright © 2017 Quentin Desouza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *ProfileView;
@property (strong, nonatomic) IBOutlet UITableView *tblMenu;

@end
