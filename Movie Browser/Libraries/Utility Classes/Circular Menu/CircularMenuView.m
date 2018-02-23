//
//  CircularMenuView.m
//  Engrid
//
//  Created by Quentin Desouza on 30/10/17.
//  Copyright © 2017 Quentin Desouza. All rights reserved.
//

#import "CircularMenuView.h"

@implementation CircularMenuView{
    BOOL isMenuActive;
}
@synthesize btnMenu;

-(void)awakeFromNib{
    
    [super awakeFromNib];
    homeView = [[HomeViewController alloc] init];
    [self setupMenu];
}
-(void)setupMenu{
    btnMenu.clipsToBounds = YES;
    btnMenu.layer.cornerRadius = btnMenu.frame.size.height / 2;
    //Grid menu setup;
    if (igcMenu == nil) {
        igcMenu = [[IGCMenu alloc] init];
    }
    igcMenu.menuButton = btnMenu;   //Pass refernce of menu button
    igcMenu.menuSuperView = self;      //Pass reference of menu button super view
    igcMenu.disableBackground = YES;        //Enable/disable menu background
    igcMenu.numberOfMenuItem = 6;           //Number of menu items to display
    
    //Menu background. It can be BlurEffectExtraLight,BlurEffectLight,BlurEffectDark,Dark or None
    igcMenu.backgroundType = BlurEffectDark;
    
    /* Optional
     Pass name of menu items
     **/
    igcMenu.menuItemsNameArray = [NSArray arrayWithObjects:@"",@"",@"",@"",@"",@"",nil];
    
    /*Optional
     Pass color of menu items
     **/
    
    UIColor *homeBackgroundColor = [UIColor colorWithRed:(33/255.0) green:(180/255.0) blue:(227/255.0) alpha:1.0];
    UIColor *searchBackgroundColor = [UIColor colorWithRed:(139/255.0) green:(116/255.0) blue:(240/255.0) alpha:1.0];
    UIColor *favoritesBackgroundColor = [UIColor colorWithRed:(241/255.0) green:(118/255.0) blue:(121/255.0) alpha:1.0];
    UIColor *userBackgroundColor = [UIColor colorWithRed:(184/255.0) green:(204/255.0) blue:(207/255.0) alpha:1.0];
    UIColor *buyBackgroundColor = [UIColor colorWithRed:(169/255.0) green:(59/255.0) blue:(188/255.0) alpha:1.0];
    igcMenu.menuBackgroundColorsArray = [NSArray arrayWithObjects:homeBackgroundColor,favoritesBackgroundColor,searchBackgroundColor,userBackgroundColor, buyBackgroundColor,nil];
    
    /*Optional
     Pass menu items icons
     **/
    
    igcMenu.menuImagesNameArray = [NSArray arrayWithObjects:@"Flashcards.png",@"Vocab.png",@"home.png",@"sentence pattern.png",@"eassy.png",@"FAQ-100.png",nil];
    
    /*Optional if you don't want to get notify for menu items selection
     conform delegate
     **/
    
    igcMenu.delegate = self;
    
}

- (void)igcMenuSelected:(NSString *)selectedMenuName atIndex:(NSInteger)index{
    
    isMenuActive = YES;
    [self btnMenuClicked:self];
    
    switch (index) {
        case 0:     //Errorcode Module
            //Perform any action that u want on menu selection
            [homeView ErrorCodeClicked];
            break;
        case 1:     //Vocabulary Module
            [homeView VocabularyClicked];
            break;
        case 2:     //Home Page Module
            
            break;
        case 3:     //Sentence Patten Module
            [homeView SentencePatternClicked];
            break;
        case 4:     //Essay Module
            [homeView EssayClicked];
            break;
        case 5:
            [homeView CodeDescriptionClicked];
            break;
        default:
            break;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)btnMenuClicked:(id)sender {
    if (isMenuActive) {
        [btnMenu setImage:[UIImage imageNamed:@"menu plus"] forState:UIControlStateNormal];
        [igcMenu hideCircularMenu];
        isMenuActive = NO;
    }
    else{
        [btnMenu setImage:[UIImage imageNamed:@"menu minus.png"] forState:UIControlStateNormal];
        [igcMenu showCircularMenu];
        isMenuActive = YES;
    }
}

@end
