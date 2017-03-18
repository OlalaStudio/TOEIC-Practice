//
//  TLPhotoViewController.m
//  Toeic
//
//  Created by NguyenThanhLuan on 15/03/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import "TLPhotoViewController.h"

@interface TLPhotoViewController ()

@end

@implementation TLPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setData:(NSDictionary *)data{
    _dataDic = [[NSDictionary alloc] initWithDictionary:data];
}

-(void)setupView{
    
    NSString *pic = [_dataDic valueForKey:@"picture"];
    
    [_picture setImage:[UIImage imageNamed:pic]];

    NSString *script = [_dataDic valueForKey:@"script"];
    
    [_scriptview setText:script];
    
    [_scriptview setHidden:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)show_script{
    [_scriptview setHidden:![_scriptview isHidden]];
}

@end
