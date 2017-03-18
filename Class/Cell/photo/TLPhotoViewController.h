//
//  TLPhotoViewController.h
//  Toeic
//
//  Created by NguyenThanhLuan on 15/03/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLPhotoViewController : UIViewController{
    NSDictionary    *_dataDic;
}

@property (assign,nonatomic) NSInteger  index;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UITextView *scriptview;
@property (weak, nonatomic) IBOutlet UILabel *anwser_A;
@property (weak, nonatomic) IBOutlet UILabel *anwser_B;
@property (weak, nonatomic) IBOutlet UILabel *anwser_C;
@property (weak, nonatomic) IBOutlet UILabel *anwser_D;

-(void)setData:(NSDictionary*)data;
-(void)show_script;
@end
