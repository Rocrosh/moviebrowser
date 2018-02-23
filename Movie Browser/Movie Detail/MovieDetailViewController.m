//
//  MovieDetailViewController.m
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "DetailView.h"

@interface MovieDetailViewController ()
{
    DetailView *detailView;
}
@end

@implementation MovieDetailViewController
@synthesize detailDOM;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpImageBackButton];
    self.navigationItem.title = @"Movie Detail";
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DetailView" owner:self options:nil];
    detailView =(DetailView *)[nib objectAtIndex:0];
    detailView.frame = CGRectMake(0.0, 0.0,self.view.frame.size.width,self.view.frame.size.height);
    
    detailView.detailDOM = detailDOM;
    [detailView CreateTitleView];
    [self.view addSubview:detailView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
