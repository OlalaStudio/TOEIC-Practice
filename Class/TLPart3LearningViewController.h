//
//  TLPart3ViewController.h
//  Toeic
//
//  Created by NguyenThanhLuan on 24/03/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartBaseViewController.h"
#import "PlayerBarView.h"
#import "TLTableViewCellBase.h"

@interface TLPart3LearningViewController : PartBaseViewController <UITableViewDelegate,UITableViewDataSource,PlayerBarViewDelegate,TLTableViewCellDelegate>{
    NSDictionary          *_itemList;
    NSMutableDictionary     *uDic;
    
    NSInteger       rAnwser;
    NSInteger       tAnwser;
}

@property (weak, nonatomic) IBOutlet PlayerBarView *playerBar;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UITextView *scriptview;

-(void)setData:(NSDictionary*)dataDic;

@end
