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

@implementation TLPart3LearningViewController{
    NSString *audio;
    NSArray  *questions;
    NSString *script;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_tableview setDelegate:self];
    [_tableview setDataSource:self];
    
    [_tableview registerNib:[UINib nibWithNibName:@"TLQuestionTableViewCell" bundle:nil] forCellReuseIdentifier:@"idnormalcell"];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"script"
                                                                style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:@selector(show_Script:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    [_scriptview setText:script];
    [_scriptview setHidden:YES];
    
    [_playerBar setPlayerBarDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [_playerBar stop];
}

-(void)setData:(NSDictionary *)dataDic{
    _itemList = [[NSDictionary alloc] initWithDictionary:dataDic];
    
    audio = [_itemList objectForKey:@"audio"];
    questions = [_itemList objectForKey:@"question"];
    script = [_itemList objectForKey:@"script"];
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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [questions count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TLQuestionTableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:@"idnormalcell"];
    [cell setQNumber:indexPath.section * 2 + indexPath.row];
    [cell setData:[questions objectAtIndex:indexPath.row]];
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
    [_playerBar setPlayerURL:audio];
    [_playerBar setPlayerBarDelegate:self];
    [_playerBar loadContent];
}

-(void)canClickPlayer
{
    
}

@end
