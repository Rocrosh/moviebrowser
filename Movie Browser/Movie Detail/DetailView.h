//
//  DetailView.h
//  Movie Browser
//
//  Created by Quentin Desouza on 21/02/18.
//  Copyright © 2018 Quentin Desouza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailDOM.h"

@interface DetailView : UIView

@property (strong, nonatomic) IBOutlet UIScrollView *scrContainer;
@property (strong, nonatomic) MovieDetailDOM *detailDOM;
-(void)CreateTitleView;
@end
