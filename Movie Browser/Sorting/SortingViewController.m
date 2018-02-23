//
//  SortingViewController.m
//  Movie Browser
//
//  Created by Quentin Desouza on 22/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import "SortingViewController.h"
#import "SortingViewCell.h"


@interface SortingViewController ()
{
    NSArray *Sorters;
    NSMutableArray *selectedSort;
    int selectedRow;
    UserActivityDOM *sort;
}
@end

@implementation SortingViewController
@synthesize tblSorting;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"Sort";
    [self setBarButton];
    
    Sorters = [NSArray arrayWithObjects:@"Most Popular",@"Top Rated", nil];
    
    selectedSort = [[NSMutableArray alloc] initWithObjects:@"0",@"0", nil];
    
    sort = [UserActivityDOM sharedInstance];
    selectedSort = sort.arrSelectedsort;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Sorters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"SortingViewCell";
    
    SortingViewCell *cell = (SortingViewCell *)[tblSorting dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (SortingViewCell *)[nib objectAtIndex:0];
    }
    // Configure the cell...
    if([[selectedSort objectAtIndex:indexPath.row] isEqualToString:@"1"]){
        cell.ImgRadio.image = [UIImage imageNamed:@"radio-checked"];
        selectedRow = indexPath.row;
    }
    else{
        cell.ImgRadio.image = [UIImage imageNamed:@"radio-unchecked"];
    }

    cell.lblText.text = [Sorters objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    selectedSort = [[NSMutableArray alloc] initWithObjects:@"0",@"0", nil];
    selectedRow = (int)indexPath.row;
    
    if ([[selectedSort objectAtIndex:indexPath.row] isEqualToString:@"1"])
        [selectedSort replaceObjectAtIndex:indexPath.row withObject:@"0"];
    else
        [selectedSort replaceObjectAtIndex:indexPath.row withObject:@"1"];
    
    [tableView reloadData];
    
    if (indexPath.row == 0) {
        sort.LoadingFor = MostPopular;
    }else{
        sort.LoadingFor = TopRated;
    }
    
    self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeNavigation"];
}

-(void)setBarButton{
    UIButton *btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCancel.frame = CGRectMake(0.0, 0.0, 15.0, 15.0);
    [btnCancel setBackgroundColor:[UIColor darkGrayColor]];
    [btnCancel setBackgroundImage:[UIImage imageNamed:@"close_new"] forState:UIControlStateNormal];
    //    [btnCancel setTitle:@"X" forState:UIControlStateNormal];
    btnCancel.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btnCancel setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnCancel addTarget:self action:@selector(CancelButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:btnCancel];
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

-(void)CancelButton:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)btnApplySortingClicked:(id)sender {
    UserActivityDOM *sort = [UserActivityDOM sharedInstance];
    
    switch (selectedRow) {
        case 0:
            sort.SortType = @"popular";
            break;
        case 1:
            sort.SortType = @"top_rated";
            break;
            
        default:
            break;
    }
    
    sort.arrSelectedsort = selectedSort;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Sorting" object:self userInfo:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
