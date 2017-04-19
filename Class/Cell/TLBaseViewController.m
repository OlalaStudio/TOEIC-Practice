//
//  TLBaseViewController.m
//  Toeic
//
//  Created by NguyenThanhLuan on 23/03/2017.
//  Copyright © 2017 Olala. All rights reserved.
//

#import "TLBaseViewController.h"

@interface TLBaseViewController ()

@end

@implementation TLBaseViewController
@synthesize anwser = _anwser;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //load banner ads
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        _adBannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeFullBanner];
    }
    else{
        _adBannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    }
    
    [_adBannerView setAdUnitID:@"ca-app-pub-4039533744360639/8867726503"];
    [_adBannerView setDelegate:self];
    [_adBannerView setRootViewController:self];
    
    CGRect adsrect = [_adBannerView frame];
    CGRect bound = [[self view] frame];
    
    adsrect.origin.y = bound.size.height - 80;
    
    [_adBannerView setFrame:adsrect];
    
    [[self view] addSubview:_adBannerView];
    
    [self runRateApp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[kGADSimulatorID,@"aea500effe80e30d5b9edfd352b1602d"];
    
    [_adBannerView loadRequest:request];
}

#pragma mark - Setting
-(void)runRateApp
{
    //1190545147
    [Appirater setAppId:@"1214277884"];    // Change for your "Your APP ID"
    [Appirater setDaysUntilPrompt:1];     // Days from first entered the app until prompt
    [Appirater setUsesUntilPrompt:12];     // Number of uses until prompt
    [Appirater setTimeBeforeReminding:2]; // Days until reminding if the user taps "remind me"
    //[Appirater setDebug:YES];           // If you set this to YES it will display all the time
    
    //... Perhaps do stuff
    
    [Appirater appLaunched:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setAnwser:(AnwserState)anwser{
    _anwser = anwser;
}

-(AnwserState)anwser{
    return _anwser;
}

-(void)showAnwser:(BOOL)result{

    FCAlertView *alert = [[FCAlertView alloc] init];
    
    if (result) {
        [alert showAlertWithTitle:@"Correct!" withSubtitle:nil withCustomImage:nil withDoneButtonTitle:nil andButtons:nil];
        [alert makeAlertTypeSuccess];
    }
    else{
        [alert showAlertWithTitle:@"Wrong!" withSubtitle:nil withCustomImage:nil withDoneButtonTitle:nil andButtons:nil];
        [alert makeAlertTypeWarning];
    }
}

@end
