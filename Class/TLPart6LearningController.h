//
//  TLPart6LearningController.h
//  Toeic
//
//  Created by NguyenThanhLuan on 07/04/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartBaseViewController.h"
#import "TLTableViewCellBase.h"

@interface TLPart6LearningController : PartBaseViewController <UITableViewDelegate, UITableViewDataSource, TLTableViewCellDelegate>{
    NSDictionary *dataDic;
    NSMutableDictionary *uDic;
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UITextView  *textview;

-(void)setData:(NSDictionary*)data;

@end
