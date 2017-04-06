//
//  TLPart7LearningController.m
//  Toeic
//
//  Created by Nguyen Luan on 4/6/17.
//  Copyright (c) 2017 Olala. All rights reserved.
//

#import "TLPart7LearningController.h"
#import "TLQuestionTableViewCell.h"

@interface TLPart7LearningController ()

@end

@implementation TLPart7LearningController{
    NSArray *question;
    NSString *script;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_tableview setDelegate:self];
    [_tableview setDataSource:self];
    [_tableview registerNib:[UINib nibWithNibName:@"TLQuestionTableViewCell" bundle:nil] forCellReuseIdentifier:@"idnormalcell"];
    
    uDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"script"
                                                                style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:@selector(show_script:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:script ofType:@"rtf"];
    
    _textview.attributedText =[[NSAttributedString alloc] initWithFileURL:[NSURL fileURLWithPath:scriptPath]
                                                                    options:nil
                                                         documentAttributes:nil
                                                                      error:nil];
    
    [_textview setHidden:YES];
    [_tableview setHidden:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setData:(NSDictionary *)data{
    dataDic = [NSDictionary dictionaryWithDictionary:data];
    
    question = [dataDic valueForKey:@"question"];
    script = [dataDic valueForKey:@"script"];
}

-(void)viewDidAppear:(BOOL)animated{
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
}

-(void)show_script:(id)sender{
    [_textview setHidden:![_textview isHidden]];
    [_tableview setHidden:![_tableview isHidden]];
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
    
    return [question count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TLQuestionTableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:@"idnormalcell"];
    [cell setDelegate:self];
    [cell setQNumber:indexPath.section * 2 + indexPath.row];
    [cell setData:[question objectAtIndex:indexPath.row]];
    [cell setIndex:indexPath];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //update data
    AnwserState state = [[uDic objectForKey:indexPath] integerValue];
    [(TLTableViewCellBase*)cell updateSelection:state];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 190;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

#pragma mark -
#pragma mark - UITableCellView Delegate
-(void)didSelectAnwser:(AnwserState)anwser forCell:(TLTableViewCellBase *)cell{
    
    NSIndexPath *indexpath = [cell index];
    
    [uDic setObject:[NSNumber numberWithInteger:anwser] forKey:indexpath];
}

@end
