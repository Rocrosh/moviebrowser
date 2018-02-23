//
//  SearchViewController.h
//  Movie Browser
//
//  Created by Quentin Desouza on 22/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tblSearch;


@end
