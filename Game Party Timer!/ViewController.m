//
//  ViewController.m
//  Game Party Timer!
//
//  Created by Student on 5/20/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "ViewController.h"


UILabel * timerLabelMinutes;
UILabel * timerLabelSeconds;
UILabel * colon;
NSTimer * pollingTimer;
NSDateFormatter * dateFormatter;
int * timerValue;
NSInteger secondsInteger;

@interface ViewController ()

{
    AVAudioPlayer * playSound;
    AVAudioPlayer * playSoundTwo;
    UIView * stateTwoImage;
    UIImageView * cook;
    UIImageView * explode;
    UIView * last;
    NSArray * endAnimation;
    NSArray * animationImage;
    ADBannerView * adView;
    CGRect * trial;
   


}
@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UILabel *timerLabelTwo;

@end

@implementation ViewController {
     ADBannerView *_bannerView;
    
}





- (void)viewDidLoad
{
      [super viewDidLoad];
    
    //CGRect trial = CGRectZero;
    
   

    _bannerView= [[ADBannerView alloc] initWithFrame:CGRectMake(125, 650, 0, 0)];
    
    //[_bannerView.center.
    
    _bannerView.delegate = self;
    
    
    
    endAnimation = [NSArray arrayWithObjects:
                    [UIImage imageNamed:@"explode0001"],
                    [UIImage imageNamed:@"explode0002"],
                    [UIImage imageNamed:@"explode0003"],
                    [UIImage imageNamed:@"explode0004.png"],
                    [UIImage imageNamed:@"explode0005.png"],
                    [UIImage imageNamed:@"explode0006.png"],
                    [UIImage imageNamed:@"explode0007.png"],
                    [UIImage imageNamed:@"explode0008.png"],
                    [UIImage imageNamed:@"explode0009.png"],
                    [UIImage imageNamed:@"explode0010.png"],
                    [UIImage imageNamed:@"explode0011.png"],
                    [UIImage imageNamed:@"explode0012.png"],
                    [UIImage imageNamed:@"explode0013.png"],
                    [UIImage imageNamed:@"explode0014.png"],
                    [UIImage imageNamed:@"explode0015.png"],
                    [UIImage imageNamed:@"explode0016.png"],
                    [UIImage imageNamed:@"explode0017.png"],
                    [UIImage imageNamed:@"explode0018.png"],
                    [UIImage imageNamed:@"explode0019.png"],
                    [UIImage imageNamed:@"explode0020.png"],
                    [UIImage imageNamed:@"explode0021.png"],
                    [UIImage imageNamed:@"explode0022.png"],
                    [UIImage imageNamed:@"explode0023.png"],nil];
    
    animationImage = [NSArray arrayWithObjects:
                      [UIImage imageNamed:@"cook0001.png"],
                      [UIImage imageNamed:@"cook0002.png"],
                      [UIImage imageNamed:@"cook0003.png"],
                      [UIImage imageNamed:@"cook0004.png"],
                      [UIImage imageNamed:@"cook0005.png"],
                      [UIImage imageNamed:@"cook0006.png"],
                      [UIImage imageNamed:@"cook0007.png"],
                      [UIImage imageNamed:@"cook0008.png"],
                      [UIImage imageNamed:@"cook0009.png"],
                      [UIImage imageNamed:@"cook0010.png"],
                      [UIImage imageNamed:@"cook0011.png"],
                      [UIImage imageNamed:@"cook0012.png"],nil];
    
   


    
    NSURL * url = [NSURL fileURLWithPath:[[NSBundle mainBundle ] pathForResource:@"beep" ofType:@"mp3"]];
    NSError * error;
    
    playSound =[[AVAudioPlayer alloc]initWithContentsOfURL:url error: &error];
    
    if (!error) {
        playSound.delegate = self;
        [playSound prepareToPlay];
    }
    
    NSURL * urlTwo = [NSURL fileURLWithPath:[[NSBundle mainBundle ] pathForResource:@"DingDone" ofType:@"mp3"]];
    NSError * errorTwo;
    
    playSoundTwo =[[AVAudioPlayer alloc]initWithContentsOfURL:urlTwo error: &error];
    
    if (!errorTwo) {
        playSoundTwo.delegate = self;
        [playSoundTwo prepareToPlay];
    }
    
    

    
    
    secondsInteger = [timerLabelSeconds.text integerValue];
    
    timerLabelMinutes = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    [timerLabelMinutes setBackgroundColor:[UIColor clearColor]];
    
    [timerLabelMinutes setFont:[UIFont fontWithName:@"Herculanum" size:60]];
    [timerLabelMinutes setText:@"00"];
    [timerLabelMinutes setTextColor:[UIColor colorWithRed:140.0/255.0 green:255.0/255.0 blue:109.0/255.0 alpha:1]];
    [timerLabelMinutes setCenter:CGPointMake(870, 170)];
    [self.view addSubview:timerLabelMinutes];
    
    
    timerLabelSeconds = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    [timerLabelSeconds setBackgroundColor:[UIColor clearColor]];
    
    [timerLabelSeconds setFont:[UIFont fontWithName:@"Herculanum" size:60]];
    [timerLabelSeconds setText:@"00"];
    [timerLabelSeconds setTextColor:[UIColor colorWithRed:140.0/255.0 green:255.0/255.0 blue:109.0/255.0 alpha:1]];
    [timerLabelSeconds setCenter:CGPointMake(970, 170)];
    [self.view addSubview:timerLabelSeconds];
    
    colon = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    [colon setBackgroundColor:[UIColor clearColor]];
    
    [colon setFont:[UIFont fontWithName:@"Herculanum" size:60]];
    [colon setText:@":"];
    [colon setTextColor:[UIColor colorWithRed:140.0/255.0 green:255.0/255.0 blue:109.0/255.0 alpha:1]];
    [colon setCenter:CGPointMake(947, 165)];
    [self.view addSubview:colon];
//    int timerValue=[timerLabel.text intValue];
    
    
  UIButton * start = [UIButton buttonWithType:UIButtonTypeCustom];
    [start setBackgroundImage:[UIImage imageNamed:@"start.png"]forState:UIControlStateNormal];
    start.frame = CGRectMake(873, 498, 84, 37);
    [self.view addSubview:start];
    
    [start addTarget:self action:@selector(startTime)forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * stopClear = [UIButton buttonWithType:UIButtonTypeCustom];
    [stopClear setBackgroundImage:[UIImage imageNamed:@"Stop-Clear.png"]forState:UIControlStateNormal];
    stopClear.frame = CGRectMake(757, 498, 108, 37);
    [self.view addSubview:stopClear];
    
    [stopClear addTarget:self action:@selector(clearValue) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * quickMin = [UIButton buttonWithType:UIButtonTypeCustom];
    [quickMin setBackgroundImage:[UIImage imageNamed:@"Quick-Min.png"]forState:UIControlStateNormal];
    quickMin.frame = CGRectMake(757, 435, 66, 47);
    [self.view addSubview:quickMin];
    
    [quickMin addTarget:self action:@selector(addMin)forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * timerClock = [UIButton buttonWithType:UIButtonTypeCustom];
    [timerClock setBackgroundImage:[UIImage imageNamed:@"Timer-Clock.png"]forState:UIControlStateNormal];
    timerClock.frame = CGRectMake(890, 435, 66, 47);
    [self.view addSubview:timerClock];
    
    [timerClock addTarget:self action:@selector(mode) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton * zero = [UIButton buttonWithType:UIButtonTypeCustom];
    [zero setBackgroundImage:[UIImage imageNamed:@"0.png"]forState:UIControlStateNormal];
    zero.frame = CGRectMake(830, 430, 53, 53);
    [self.view addSubview:zero];
    zero.tag = 0;
    [zero addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * one = [UIButton buttonWithType:UIButtonTypeCustom];
    [one setBackgroundImage:[UIImage imageNamed:@"1.png"]forState:UIControlStateNormal];
    one.frame = CGRectMake(765, 215, 53, 53);
    [self.view addSubview:one];
    one.tag = 1;
    [one addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton * two = [UIButton buttonWithType:UIButtonTypeCustom];
    [two setBackgroundImage:[UIImage imageNamed:@"2.png"]forState:UIControlStateNormal];
    two.frame = CGRectMake(830, 215, 53, 53);
    [self.view addSubview:two];
    two.tag = 2;
    [two addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton * three = [UIButton buttonWithType:UIButtonTypeCustom];
    [three setBackgroundImage:[UIImage imageNamed:@"3.png"]forState:UIControlStateNormal];
    three.frame = CGRectMake(900, 215, 53, 53);
    [self.view addSubview:three];
    three.tag = 3;
    [three addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton * four = [UIButton buttonWithType:UIButtonTypeCustom];
    [four setBackgroundImage:[UIImage imageNamed:@"4.png"]forState:UIControlStateNormal];
    four.frame = CGRectMake(765, 290, 53, 53);
    [self.view addSubview:four];
    four.tag = 4;
    [four addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton * five = [UIButton buttonWithType:UIButtonTypeCustom];
    [five setBackgroundImage:[UIImage imageNamed:@"5.png"]forState:UIControlStateNormal];
    five.frame = CGRectMake(830, 290, 53, 53);
    [self.view addSubview:five];
    five.tag = 5;
    [five addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];

    
   UIButton * six = [UIButton buttonWithType:UIButtonTypeCustom];
    [six setBackgroundImage:[UIImage imageNamed:@"6.png"]forState:UIControlStateNormal];
    six.frame = CGRectMake(900, 290, 53, 53);
    [self.view addSubview:six];
    six.tag = 6;
    [six addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];

    UIButton * seven = [UIButton buttonWithType:UIButtonTypeCustom];
    [seven setBackgroundImage:[UIImage imageNamed:@"7.png"]forState:UIControlStateNormal];
    seven.frame = CGRectMake(765, 360, 53, 53);
    [self.view addSubview:seven];
    seven.tag = 7;
    [seven addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * eight = [UIButton buttonWithType:UIButtonTypeCustom];
    [eight setBackgroundImage:[UIImage imageNamed:@"8.png"]forState:UIControlStateNormal];
    eight.frame = CGRectMake(830, 360, 53, 53);
    [self.view addSubview:eight];
    eight.tag = 8;
    [eight addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];

    UIButton * nine = [UIButton buttonWithType:UIButtonTypeCustom];
    [nine setBackgroundImage:[UIImage imageNamed:@"9.png"] forState:UIControlStateNormal];
    [nine setBackgroundColor:[UIColor clearColor]];
    nine.frame = CGRectMake(900, 360, 53, 53);
    [self.view addSubview:nine];
    nine.tag = 9;
    [nine addTarget:self action:@selector(inputValue:) forControlEvents:UIControlEventTouchUpInside];

    
    explode = [[UIImageView alloc] initWithFrame:CGRectMake(30, -20, 800, 800)];
    //[cook setCenter:self.view.center];
    
    
    explode.animationImages = endAnimation;
    
    // all frames will execute in 1.8 seconds
    explode.animationDuration = 1.8;
    // 0 means repeat the annimation forever
    explode.animationRepeatCount = 1;
    // start animating
    //[pony startAnimating];
    
    
    cook = [[UIImageView alloc] initWithFrame:CGRectMake(-15, -80, 800, 800)];
    //[cook setCenter:self.view.center];
    
    
    cook.animationImages = animationImage;
    // all frames will execute in .9 seconds
    cook.animationDuration = .9;
    // 0 means repeat the annimation forever
    cook.animationRepeatCount = 0;
    
    [cook startAnimating];
    [explode startAnimating];
 
    
        
    //cook.animationDuration   = .9;
    //explode.animationDuration = 1.8;
    // start animating
    //[pony startAnimating];
   
    
    [self.view addSubview:explode];
    [explode setAlpha:(0)];
    
    
    [self.view addSubview:cook];
    [cook setAlpha:(0)];

    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    stateTwoImage = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1080, 720)];
    UIImage * pngTwo = [UIImage imageNamed:@"state 2.png"];
    UIColor * backer = [[UIColor alloc]initWithPatternImage:pngTwo];
    stateTwoImage.backgroundColor = backer;
    
    last = [[UIView alloc] initWithFrame:CGRectMake(30, -20, 800, 800)];
    UIImage * pnglast = [UIImage imageNamed:@"explode.0023.png"];
    UIColor * laster = [[UIColor alloc]initWithPatternImage:pnglast];
    last.backgroundColor = laster;
    
    
    
   [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"state 1"]]];
    
    [self.view addSubview:_bannerView];
    
}


- (void)bannerViewDidLoadAd:(ADBannerView *)banner{
//_bannerView= [[ADBannerView alloc] initWithFrame:CGRectMake(125, 650, 0, 0)];
    _bannerView.frame = CGRectMake(125, 650, 0, 0);

}


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
_bannerView.frame = CGRectMake(125, -200, 0, 0);
}


- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{

    return YES;
}


- (void)bannerViewActionDidFinish:(ADBannerView *)banner{}






-(void) inputValue:(UIButton *)sender {
    
    NSLog(@"Button Tag is : %i",[sender tag]);
    [playSound setCurrentTime:00];
    [playSound play];
    int info = [timerLabelSeconds.text intValue];
    int infoM = [timerLabelMinutes.text intValue];
    int minutes;
    if (infoM/10){
        return;
    }


    infoM = (infoM - infoM/10 * 10);
    minutes = info/10;
    info = (info - info/10 * 10);
    
    [timerLabelMinutes setText:[NSString
                                stringWithFormat:@"%d%d",infoM,minutes]];
    
    switch ([sender tag]) {
        case 0:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,0]];
            break;
        
        }

            
        case 1:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,1]];
            
            break;
        }
          
        case 2:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,2]];
            
            break;
        }
           
        case 3:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,3]];
            
            break;
        }
        case 4:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,4]];
            
            break;
        }
        case 5:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,5]];
            
            break;
        }
        case 6:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,6]];
            
            break;
        }

        case 7:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,7]];
            
            break;
        }

        case 8:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,8]];
            
            break;
        }
        case 9:
        {
            [timerLabelSeconds setText:[NSString
                                        stringWithFormat:@"%d%d",info,9]];
            
            break;
        }

        default:
            
            break;
    
    }


}


-(void) clearValue {
    [pollingTimer invalidate];
    [playSound setCurrentTime:00];
    [playSound play];
    [cook stopAnimating];
    
    [timerLabelMinutes setText:[NSString
                                stringWithFormat:@"%d%d",0,0]];
    [timerLabelSeconds setText:[NSString
                                stringWithFormat:@"%d%d",0,0]];
    
    if ((timerLabelMinutes.text.integerValue == 0) && (timerLabelSeconds.text.integerValue == 0)) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"state 1"]]];
    }
    return;
                    }
-(void) mode{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"hh:mm";
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
   // NSString * intermediate = [NSDateFormatter localizedStringFromDate:now dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:now];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSLog(@"%ld hours and %ld minutes",(long)hour,(long)minute);
    
    if (hour > 9) {
        [timerLabelMinutes setText:[NSString
                                    stringWithFormat:@"%d",hour]];
    }
    else {
        [timerLabelMinutes setText:[NSString
                                    stringWithFormat:@"%d%d",0,hour]];
    }
    if (minute >9) {
        [timerLabelSeconds setText:[NSString
                                    stringWithFormat:@"%d",minute]];
    }
    else {
        [timerLabelSeconds setText:[NSString
                                    stringWithFormat:@"%d%d",0,minute]];
    }
    
    
 
    //[dateFormatter release];
    
}

-(void) addMin {
    [playSound setCurrentTime:00];
    [playSound play];
    int infoM = [timerLabelMinutes.text intValue];
    int minutesPlus = infoM + 1;
    if (infoM >8) {
        [timerLabelMinutes setText:[NSString
                                    stringWithFormat:@"%d",minutesPlus]];
    }
    else{
        [timerLabelMinutes setText:[NSString
                                        stringWithFormat:@"%d%d",0,minutesPlus]];
        
        
    }


   
}


-(void)startTime   {
    
    [playSound setCurrentTime:00];
    [playSound play];
    // add the animation view to the main window
    //[self.view addSubview:cook];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"state 1"]]];
    [cook stopAnimating];
    [cook setAlpha:(1)];
    [UIView animateWithDuration:.5 animations:^{
        [cook startAnimating];
        
    }];
    
    
    NSTimer * timerSeconds = [NSTimer scheduledTimerWithTimeInterval: 1
     target:self
    selector:@selector(subtractSeconds:)
     userInfo:nil
     repeats:YES];
    pollingTimer = timerSeconds;
    
    
    
    return;
                    }

-(void) subtractSeconds: (NSTimer *) sender {
    
    NSInteger minutesValue = [timerLabelMinutes.text integerValue];
    NSInteger minutesValueOnes = minutesValue - 1;
    NSInteger secondsValue = [timerLabelSeconds.text integerValue];
    NSInteger secondsValueOnes;
    secondsValueOnes = secondsValue - 1;
    
    
[timerLabelSeconds setText:[NSString stringWithFormat:@"%d%d",0,secondsValueOnes]];
    
    if ((secondsValue == 0)&&(minutesValue > 0)) {
        [timerLabelMinutes setText:[NSString stringWithFormat:@"%d%d",0,minutesValueOnes]];
        [timerLabelSeconds setText:[NSString stringWithFormat:@"%d%d",5,9]];
    }
    if ((minutesValue >=11)&&(secondsValue == 0)) {
        [timerLabelMinutes setText:[NSString stringWithFormat:@"%d",minutesValueOnes]];
        [timerLabelSeconds setText:[NSString stringWithFormat:@"%d%d",5,9]];
    }
    
    if ((secondsValue == 1) && (minutesValue == 0) ){
        [playSoundTwo setCurrentTime:00];
        [playSoundTwo play];
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"state 2"]]];
        [sender invalidate];
        
        [self.view addSubview:explode];
        [explode stopAnimating];
        [explode setAlpha:(1)];
        [UIView animateWithDuration:.5 animations:^{
            [explode startAnimating];
        }];

        
        [cook stopAnimating];

        //[self.view addSubview:last];
        
        
        
        return;
    }
    
    
    
    
    
    if (secondsValue >10) {
        [timerLabelSeconds setText:[NSString stringWithFormat:@"%d", secondsValueOnes]];
        
    }
    
//    if (minutesValue >10) {
//        [timerLabelMinutes setText:[NSString stringWithFormat:@"%d", minutesValueOnes]];
//        
//    }
    NSLog(@"%d minutes and %d seconds",timerLabelMinutes.text.integerValue,timerLabelSeconds.text.integerValue);
    if ((timerLabelMinutes.text.integerValue == 0) && (timerLabelSeconds.text.integerValue == 0))
        
    {
        
        
    }
    
}

    //- (void)decreaseTimerCount
    //    {
    //        timerLabel.text = [NSString stringWithFormat:@"%d", timerCount--];
    //    }
    
    





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
