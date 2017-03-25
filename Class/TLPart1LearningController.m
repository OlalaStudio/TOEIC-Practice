//
//  TLCommonViewController.m
//  Toeic
//
//  Created by NguyenThanhLuan on 15/03/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import "TLPart1LearningController.h"

@interface TLPart1LearningController ()

@end

@implementation TLPart1LearningController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"script"
                                                                style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:@selector(show_Script:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    //setup page
    [self setupPageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setData:(NSArray *)dataArr{
    _itemList = [[NSArray alloc] initWithArray:dataArr];
}

-(void)show_Script:(id)sender
{
    // code for right Button
    
    TLPhotoViewController *currentView = (TLPhotoViewController*)[_controllerArr objectAtIndex:[self.pageControll currentPage]];
    
    [currentView show_script];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setupPageView{
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:nil];
    
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    TLPhotoViewController *initialView = [self viewControllerAtIndex:0];
    
    _controllerArr = [NSMutableArray arrayWithObject:initialView];
    
    [self.pageController setViewControllers:_controllerArr direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    
    [self.pageController didMoveToParentViewController:self];
    [self addPageControll];
    
}

#pragma mark
#pragma mark PageViewControllerDelegate
-(void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    TLPhotoViewController *pageContentView = (TLPhotoViewController*)pendingViewControllers[0];
    [self.pageControll setCurrentPage:[pageContentView index]];
    [self.pageControll updateCurrentPageDisplay];
}

-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [(TLPhotoViewController*)viewController index];
    
    index++;
    
    if (index > [_itemList count] - 1) {
        return nil;
    }
    
    if ([_controllerArr count] <= index) {
        [_controllerArr addObject:[self viewControllerAtIndex:index]];
    }
    
    return [_controllerArr objectAtIndex:index];
}

-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [(TLPhotoViewController*)viewController index];
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [_controllerArr objectAtIndex:index];
}

-(TLPhotoViewController*)viewControllerAtIndex:(NSInteger)index
{
    TLPhotoViewController *pageviewcontroller = [[TLPhotoViewController alloc] initWithNibName:@"TLPhotoViewController" bundle:nil];
    [pageviewcontroller setData:[_itemList objectAtIndex:index]];
    pageviewcontroller.index = index;
    [pageviewcontroller.view setFrame:[[self view] frame]];
    
    return pageviewcontroller;
}

-(void)addPageControll
{
    self.pageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    [self.pageControll setTintColor:[UIColor redColor]];
    [self.pageControll setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [self.pageControll setPageIndicatorTintColor:[UIColor lightGrayColor]];
    [self.pageControll setHidesForSinglePage:YES];
    [self.pageControll setNumberOfPages:[_itemList count]];
    [self.pageControll setCurrentPage:0];
    [self.view addSubview:self.pageControll];
}

@end
