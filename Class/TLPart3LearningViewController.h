//
//  TLPart3ViewController.h
//  Toeic
//
//  Created by NguyenThanhLuan on 24/03/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerBarView.h"

@interface TLPart3LearningViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,PlayerBarViewDelegate>{
    NSArray          *_itemList;
}

@property (weak, nonatomic) IBOutlet PlayerBarView *playerBar;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UITextView *scriptview;

-(void)setData:(NSArray*)dataArr;

@end
