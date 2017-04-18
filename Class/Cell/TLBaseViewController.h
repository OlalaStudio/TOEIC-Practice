//
//  TLBaseViewController.h
//  Toeic
//
//  Created by NguyenThanhLuan on 23/03/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICommonDefines.h"
#import "FCAlertView.h"

#import "Appirater.h"

@import GoogleMobileAds;

@interface TLBaseViewController : UIViewController <GADBannerViewDelegate,AppiraterDelegate>{
    AnwserState     _anwser;
    
    GADBannerView           *_adBannerView;
}

@property AnwserState   anwser;

-(void)showAnwser:(BOOL)result;

@end
