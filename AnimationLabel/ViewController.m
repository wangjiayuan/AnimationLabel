//
//  ViewController.m
//  AnimationLabel
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 cheniue. All rights reserved.
//

#import "ViewController.h"
#import "AnimationLabel.h"

@interface ViewController ()
{
    AnimationLabel *timeLabel;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    timeLabel = [[AnimationLabel alloc]initWithFrame:CGRectMake(20, 40, 280, 30)];
    [timeLabel setBackgroundColor:[UIColor greenColor]];
    [timeLabel setFunction:^(AnimationLabel *label)
     {
         NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
         [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
         [label setText:[formatter stringFromDate:[NSDate date]]];
     }];
    [timeLabel startAnimation];
    [self.view addSubview:timeLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
