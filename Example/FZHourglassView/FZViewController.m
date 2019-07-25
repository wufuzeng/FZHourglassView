//
//  FZViewController.m
//  FZHourglassView
//
//  Created by wufuzeng on 07/25/2019.
//  Copyright (c) 2019 wufuzeng. All rights reserved.
//

#import "FZViewController.h"

#import <FZHourglassView.h>
@interface FZViewController ()

@property (nonatomic,strong) FZHourglassView *hourglassView;

@end

@implementation FZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.hourglassView show];
}

-(FZHourglassView *)hourglassView{
    if (_hourglassView == nil) {
        _hourglassView = [FZHourglassView new];
        [self.view addSubview:_hourglassView];
        _hourglassView.center = self.view.center;
    }
    return _hourglassView;
}


@end
