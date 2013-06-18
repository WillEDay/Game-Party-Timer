//
//  ViewController.h
//  Game Party Timer!
//
//  Created by Student on 5/20/13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate,ADBannerViewDelegate>


@property (nonatomic, retain) IBOutlet UILabel *timerLabel;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) AVAudioPlayer *playSounds;
@property (nonatomic, copy) NSString *text;

@end
