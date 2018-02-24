//
//  MovieListViewController.m
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieListCell.h"
#import "MovieListDOM.h"
#import "MovieDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "MovieDetailDOM.h"
#import "SortingViewController.h"
#import "SearchViewController.h"

@interface MovieListViewController ()
{
    NSMutableArray *movieList;
    UserActivityDOM *userDOM;
    int CurrentPage;
    int TotalPage;
    int TotalItem;
    BOOL isPageRefresing;
}
@end

@implementation MovieListViewController
@synthesize tblMovieList,txtSearchMovie;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initialiseView];

}

-(void)initialiseView{
    userDOM = [UserActivityDOM sharedInstance];
    self.navigationItem.title = @"Movie Browser";
    
    TotalItem = 0;
    CurrentPage = 1;
    TotalPage = CurrentPage;
    isPageRefresing = NO;
    movieList = [[NSMutableArray alloc] init];
    
    switch (userDOM.LoadingFor) {
        case MostPopular:
            [self GetPopularMovieList];
            break;
            
        case TopRated:
            [self GetTopRatedMovieList];
            break;
            
        case SearchList:
            [self GetSearchedMovieList];
            break;
            
        default:
            [self GetPopularMovieList];
            break;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [movieList count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"MovieListCell";
    
    MovieListCell *Cell = (MovieListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (Cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        
        Cell = [nib objectAtIndex:0];
    }
    
    MovieListDOM *listDOM = (MovieListDOM *)[movieList objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:listDOM.movie_date];
    [dateFormatter setDateFormat:@"YYYY"];
    
    Cell.lblTitle.text = [NSString stringWithFormat:@"%@ | %@",listDOM.movie_name,[dateFormatter stringFromDate:date]];

    Cell.lblRating.text = [NSString stringWithFormat:@"%@",listDOM.movie_rating];
    
    [Cell.poster_img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_URL,listDOM.movie_image]]];
    return Cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MovieListDOM *listDOM = (MovieListDOM *)[movieList objectAtIndex:indexPath.row];
    
    NSString *path = [NSString stringWithFormat:@"/movie/%@?%@&language=en-US",listDOM.movie_id,API_KEY];
    
    UtilityClass *util_class = [[UtilityClass alloc] init];
    
    [util_class GetDataFromURL:path View:self.view withData:^(id response, NSError *error) {
        
        if (response) {
            
            //Parsing the JSON and creating DOM for the value
            
            MovieDetailDOM *detailDOM = [[MovieDetailDOM alloc] init];
            detailDOM.movie_id = [response objectForKey:@"id"];
            detailDOM.movie_name = [response objectForKey:@"original_title"];
            detailDOM.movie_image = [response objectForKey:@"backdrop_path"];
            detailDOM.movie_release_date = [response objectForKey:@"release_date"];
            detailDOM.movie_rating = [NSString stringWithFormat:@"%.1f",[[response objectForKey:@"vote_average"] floatValue]];
            detailDOM.movie_overview = [response objectForKey:@"overview"];
            detailDOM.movie_popularity = [response objectForKey:@"popularity"];
            
            
            MovieDetailViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"MovieDetailViewController"];
            
            detailController.detailDOM = detailDOM;
            
            [self.navigationController pushViewController:detailController animated:YES];
        }
    }];
    
}

-(void)GetPopularMovieList{
    
    NSString *path = [NSString stringWithFormat:@"/movie/popular?%@&language=en-US&page=%d",API_KEY,CurrentPage];
    
    [self ParseMovieData:path];
    
}

-(void)GetTopRatedMovieList{
    
    NSString *path = [NSString stringWithFormat:@"/movie/top_rated?%@&language=en-US&page=%d",API_KEY,CurrentPage];
    
    [self ParseMovieData:path];
    
}

-(void)GetSearchedMovieList{
    
    NSString *path = [NSString stringWithFormat:@"/search/movie?%@&query=%@&page=%d",API_KEY,userDOM.SearchText,CurrentPage];
    
    txtSearchMovie.text = userDOM.SearchText;
    
    [self ParseMovieData:path];
}

-(void)ParseMovieData:(NSString *)Path{
    NSLog(@"Path - %@",Path);
    
    UtilityClass *util_class = [[UtilityClass alloc] init];
    
    [util_class GetDataFromURL:Path View:self.view withData:^(id response, NSError *error) {
        
        if (response) {
            
            NSMutableArray *temp_array = [[NSMutableArray alloc] init];
            
            TotalPage = [[response valueForKey:@"total_pages"] intValue];
            TotalItem = [[response valueForKey:@"total_results"] intValue];
            
            NSMutableArray *JSONData = [response valueForKey:@"results"];
            
            for (NSDictionary *data in JSONData) {
                MovieListDOM *listDOM = [[MovieListDOM alloc] init];
                listDOM.movie_id = [data objectForKey:@"id"];
                listDOM.movie_name = [data objectForKey:@"title"];
                listDOM.movie_image = [data objectForKey:@"poster_path"];
                listDOM.movie_date = [data objectForKey:@"release_date"];
                listDOM.movie_popularity = [data objectForKey:@"popularity"];
                listDOM.movie_rating = [NSString stringWithFormat:@"%.1f",[[data objectForKey:@"vote_average"] floatValue]];
                [temp_array addObject:listDOM];
            }
            
            if ([temp_array count] > 0) {
                isPageRefresing = NO;
                [movieList addObjectsFromArray:temp_array];
            
                [tblMovieList reloadData];
                
            }else{
                [UtilityClass Notification:@"Unable to find movies " view_name:self.view];
            }
            
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSortClicked:(id)sender {
    SortingViewController *sortController = [self.storyboard instantiateViewControllerWithIdentifier:@"SortingViewController"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sortController];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    textField.text = @"";
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - Pagination

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if(tblMovieList.contentOffset.y >= (tblMovieList.contentSize.height - tblMovieList.bounds.size.height)) {
        
        //NSLog(@" scroll to bottom!");
        if(isPageRefresing == NO){
            
            if (CurrentPage < TotalPage) {
                isPageRefresing = YES;
                CurrentPage = CurrentPage + 1;
                
                switch (userDOM.LoadingFor) {
                        
                    case MostPopular:
                        [self GetPopularMovieList];
                        break;
                        
                    case TopRated:
                        [self GetTopRatedMovieList];
                        break;
                        
                    case SearchList:
                        [self GetSearchedMovieList];
                        break;
                        
                    default:
                        [self GetPopularMovieList];
                        break;
                }
            }
        }
    }
}

- (IBAction)btnMenubar:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (IBAction)btnReloadTable:(id)sender {
    
    userDOM.LoadingFor = MostPopular;
    
    self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeNavigation"];
    
}

@end
