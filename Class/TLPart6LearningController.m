//
//  TLPart6LearningController.m
//  Toeic
//
//  Created by NguyenThanhLuan on 07/04/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import "TLPart6LearningController.h"
#import "TLQuestionTableViewCell.h"
#import "FCAlertView.h"

@interface TLPart6LearningController ()

@end

@implementation TLPart6LearningController{
    NSString *script;
    NSArray *questions;
    
    NSInteger       rAnwser;
    NSInteger       tAnwser;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_tableview setDelegate:self];
    [_tableview setDataSource:self];
    [_tableview registerNib:[UINib nibWithNibName:@"TLQuestionTableViewCell" bundle:nil] forCellReuseIdentifier:@"idnormalcell"];
    
    uDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"score"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(show_score:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:script ofType:@"rtf"];
    
    _textview.attributedText =[[NSAttributedString alloc] initWithFileURL:[NSURL fileURLWithPath:scriptPath]
                                                                  options:nil
                                                       documentAttributes:nil
                                                                    error:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setData:(NSDictionary *)data{
    dataDic = [NSDictionary dictionaryWithDictionary:data];
    
    questions = [dataDic valueForKey:@"question"];
    script = [dataDic valueForKey:@"script"];
}

-(void)viewDidAppear:(BOOL)animated{
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
}

-(void)show_score:(id)sender{
    [self showAnwser];
}

-(void)showAnwser{
    rAnwser = [self findAnwser];
    tAnwser = [questions count];
    
    FCAlertView *alert = [[FCAlertView alloc] init];
    
    if (rAnwser > 0) {
        NSString *correctcountStr = [NSString stringWithFormat:@"%ld / %lu",(long)rAnwser,(unsigned long)tAnwser];
        [alert showAlertWithTitle:@"Correct!" withSubtitle:correctcountStr withCustomImage:nil withDoneButtonTitle:nil andButtons:nil];
        [alert makeAlertTypeSuccess];
    }
    else{
        [alert showAlertWithTitle:@"Wrong!" withSubtitle:nil withCustomImage:nil withDoneButtonTitle:nil andButtons:nil];
        [alert makeAlertTypeWarning];
    }
}

-(NSInteger)findAnwser{
    
    NSInteger count = 0;
    
    NSInteger session = [_tableview numberOfSections];
    for (int i=0; i<session; i++) {
        NSInteger row = [_tableview numberOfRowsInSection:i];
        
        for (int j=0; j<row; j++) {
            NSIndexPath *indexpath = [NSIndexPath indexPathForRow:j inSection:i];
            
            AnwserState anwser = [[uDic objectForKey:indexpath] integerValue];
            
            NSDictionary* itemDic = [questions objectAtIndex:j];
            
            if ([self checkAnwser:anwser valid:[itemDic objectForKey:@"answer"]]) {
                count++;
            }
        }
    }
    
    return count;
}

-(BOOL)checkAnwser:(AnwserState)uAnwser valid:(NSString*)vAnwser{
    
    AnwserState validAnwserSt = kUnknow;
    
    if ([[vAnwser uppercaseString] isEqualToString:@"A"]) {
        validAnwserSt = kAnwserA;
    }
    else if ([[vAnwser uppercaseString] isEqualToString:@"B"]){
        validAnwserSt = kAnwserB;
    }
    else if ([[vAnwser uppercaseString] isEqualToString:@"C"]){
        validAnwserSt = kAnwserC;
    }
    else if ([[vAnwser uppercaseString] isEqualToString:@"D"]){
        validAnwserSt = kAnwserD;
    }
    
    if (uAnwser != validAnwserSt) {
        return NO;
    }
    
    return YES;
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
    [cell setDelegate:self];
    [cell setQNumber:indexPath.row];
    [cell setData:[questions objectAtIndex:indexPath.row]];
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
