//
//  TLPart3ViewController.m
//  Toeic
//
//  Created by NguyenThanhLuan on 24/03/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import "TLPart3LearningViewController.h"
#import "TLQuestionTableViewCell.h"

@interface TLPart3LearningViewController ()

@end

@implementation TLPart3LearningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_tableview setDelegate:self];
    [_tableview setDataSource:self];
    
    [_tableview registerNib:[UINib nibWithNibName:@"TLQuestionTableViewCell" bundle:nil] forCellReuseIdentifier:@"idnormalcell"];
    
//    [_playerBar setPlayerURL:@""];
//    [_playerBar setPlayerBarDelegate:self];
//    [_playerBar loadContent];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"script"
                                                                style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:@selector(show_Script:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    [_scriptview setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [_playerBar stop];
}

-(void)setData:(NSArray *)dataArr{
    _itemList = [[NSArray alloc] initWithArray:dataArr];
}

-(void)show_Script:(id)sender
{
    // code for right Button
    [_scriptview setHidden:![_scriptview isHidden]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TLQuestionTableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:@"idnormalcell"];
    [cell setQNumber:indexPath.section * 2 + indexPath.row];
//    [cell setData:[_conversation objectAtIndex:indexPath.row]];
    [cell setIndex:indexPath];
        
    return cell;

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //update data
//    AnwserState state = [[uDic objectForKey:indexPath] integerValue];
//    [(TLTableViewCellBase*)cell updateSelection:state];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 190;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

#pragma mark - Player Bar Delegate
-(void)didFinishPlayer{
    
    //show score
    NSLog(@"Show score");
    
//    [self showAnwser];
}

-(void)didClickPlayer
{
    
}

-(void)canClickPlayer
{
    
}

@end
