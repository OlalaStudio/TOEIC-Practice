//
//  MapViewController.m
//  SlideOutMenu
//
//  Created by NguyenThanhLuan on 14/12/2016.
//  Copyright © 2016 Olala. All rights reserved.
//

#import "Part2ViewController.h"
#import "TLPart2LearningController.h"
#import "TLTableViewCell.h"

@interface Part2ViewController ()

@end

@implementation Part2ViewController{
    NSArray      *dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sideBarButton setTarget:revealViewController];
        [self.sideBarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [_tableview setDelegate:self];
    [_tableview setDataSource:self];
    
    [_tableview registerNib:[UINib nibWithNibName:@"TLTableViewCell" bundle:nil] forCellReuseIdentifier:@"idCellNormal"];
    
    NSString *metadataPath = [[NSBundle mainBundle] pathForResource:@"part2metadata" ofType:@"plist"];
    
    dataArr = [[NSArray alloc] initWithContentsOfFile:metadataPath];
}

-(void)viewWillAppear:(BOOL)animated{
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
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

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArr count];
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _adBannerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return _adBannerView.frame.size.height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellNormal"];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.textColor = [UIColor grayColor];
    
    NSString *title     = [NSString stringWithFormat:@"Question-Responses Test %ld",(long)indexPath.row + 1];
    NSString *avate     = @"part2.png";
    
    [cell setDisplayTitle:title];
    [cell setDisplayAvata:avate];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TLPart2LearningController *lessonViewController = (TLPart2LearningController*)[self.storyboard instantiateViewControllerWithIdentifier:@"idvpart2"];
    
    [lessonViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [lessonViewController setData:[dataArr objectAtIndex:indexPath.row]];
    
    [self.navigationController pushViewController:lessonViewController animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
