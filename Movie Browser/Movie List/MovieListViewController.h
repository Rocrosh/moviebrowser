//
//  MovieListViewController.h
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MovieListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tblMovieList;
- (IBAction)btnSortClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtSearchMovie;
- (IBAction)btnMenubar:(id)sender;

- (IBAction)btnReloadTable:(id)sender;


@end
