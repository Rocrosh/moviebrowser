//
//  SearchViewController.m
//  Movie Browser
//
//  Created by Quentin Desouza on 22/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
{
    UISearchBar *searchBar;
    NSMutableArray *allObjectArray;
    NSMutableArray *searchArray;
    
}
@end

@implementation SearchViewController
@synthesize tblSearch;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpImageBackButton];
    
    
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(50, 0, self.view.frame.size.width-60.0, 40)];
    searchBar.delegate = self;
    searchBar.tintColor = [UIColor darkGrayColor];
    
    for (UIView *subView in searchBar.subviews) {
        for(id field in subView.subviews){
            if ([field isKindOfClass:[UITextField class]]) {
                UITextField *textField = (UITextField *)field;
                [textField setBackgroundColor:[UIColor lightGrayColor]];
            }
        }
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBar];
    
    searchArray = [[NSMutableArray alloc] init];
    allObjectArray = [[NSMutableArray alloc] init];
    
    searchBar.placeholder = @"Enter movie name";
    [searchBar becomeFirstResponder];

    
    [tblSearch reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return searchArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SearchCell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    else
    {
        UIView *line = (UIView *)[cell.contentView viewWithTag:93];
        [line removeFromSuperview];
    }
    
    cell.textLabel.text = [[searchArray objectAtIndex:indexPath.row] capitalizedString];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserActivityDOM *sort = [UserActivityDOM sharedInstance];
    
    sort.SearchText = [searchArray objectAtIndex:indexPath.row];
    sort.LoadingFor = SearchList;
    
    self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeNavigation"];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"SearchText" object:self userInfo:nil];
//
//    NSLog(@"Movie is - %@",[searchArray objectAtIndex:indexPath.row]);
//
//    [self.navigationController popViewControllerAnimated:YES];
    
    
}

#pragma mark - UISearchBarDelegates methods

- (void)searchBar:(UISearchBar *)searchBar1 textDidChange:(NSString *)searchText
{
    if (searchText.length == 0)
        [self getDataFromServerFor:@"a"];
    else
        [self getDataFromServerFor:searchText];
    
    [tblSearch reloadData];
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [searchBar resignFirstResponder];
}

- (void) getDataFromServerFor:(NSString *)searchText
{

    NSString *path = [NSString stringWithFormat:@"/search/movie?%@&query=%@",API_KEY,searchText];
    
    NSLog(@"Path - %@",path);
    
    UtilityClass *util_class = [[UtilityClass alloc] init];
    
    [util_class GetDataFromURL:path View:self.view withData:^(id response, NSError *error) {
        
        if (response) {
            
            [searchArray removeAllObjects];
            
            NSMutableArray *JSONData = [response valueForKey:@"results"];
            if (JSONData) {
                for (NSDictionary *data in JSONData) {
                    [searchArray addObject:[NSString stringWithFormat:@"%@",[data valueForKey:@"title"]]];
                }
                [tblSearch reloadData];
            }
        }
    }];
    
}


@end
