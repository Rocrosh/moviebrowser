//
//  SortingViewController.h
//  Movie Browser
//
//  Created by Quentin Desouza on 22/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SortingViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)btnApplySortingClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tblSorting;

@end
