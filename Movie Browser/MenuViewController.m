//
//  MenuViewController.m
//  Engrid
//
//  Created by Quentin Desouza on 11/04/17.
//  Copyright © 2017 Quentin Desouza. All rights reserved.
//

#import "MenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"

@interface MenuViewController ()
{
    NSMutableArray *menuContent_arr;
    UIProgressViewWithText *activity;
}
@end

@implementation MenuViewController
@synthesize tblMenu,ProfileView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    menuContent_arr = [[NSMutableArray alloc] initWithObjects:@"Settings",@"Logout", nil];

    //    activity = [[UIProgressViewWithText alloc] init];
//    activity.center = self.view.center;
//    [self.view addSubview:activity];
//    [self.view bringSubviewToFront:activity];
    
    self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGesturePanning | ECSlidingViewControllerAnchoredGestureTapping;
    
    self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeNavigation"];
}

-(void)viewWillAppear:(BOOL)animated{
    self.slidingViewController.topViewController.view.layer.shadowOpacity = 0.75f;
    self.slidingViewController.topViewController.view.layer.shadowRadius = 10.0f;
    self.slidingViewController.topViewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [menuContent_arr count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"MenuCell";
    
    UITableViewCell *Cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (Cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        
        Cell = (UITableViewCell *)[nib objectAtIndex:0];
    }
    
    Cell.textLabel.text = [menuContent_arr objectAtIndex:indexPath.row];
    
    return Cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeNavigation"];
        
    }else if (indexPath.row == 1) {
        
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeNavigation"];
        
}
    
    [self.slidingViewController resetTopViewAnimated:YES];
    
//    [activity stopAnimating];
//    [self.view setUserInteractionEnabled:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
