//
//  WhiteCoverView.m
//  SecondsKillDemo
//
//  Created by MacOS on 2018/8/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "WhiteCoverView.h"

@implementation WhiteCoverView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [ UIColor colorWithRed:255.0/255.0 green:60/255.0 blue:30/255.0 alpha:1];
        
        // 时间 18:00
        _whiteStartTime = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/2)];
        //_startTime.textAlignment = NSTextAlignmentCenter;
        [_whiteStartTime setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _whiteStartTime.userInteractionEnabled = YES;
        //_startTime.adjustsFontSizeToFitWidth = YES;
        [_whiteStartTime setTitle:@"18:00" forState:UIControlStateNormal];
        _whiteStartTime.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
        //即将开启、已经开启
        _whiteTimeStatus = [[UIButton alloc] initWithFrame:CGRectMake(0, _whiteStartTime.frame.size.height, frame.size.width, frame.size.height/2)];
        //_timeStatus.textAlignment = NSTextAlignmentCenter;
        _whiteTimeStatus.userInteractionEnabled = YES;
        [_whiteTimeStatus setTitle:@"即将开始" forState:UIControlStateNormal];
        //_timeStatus.adjustsFontSizeToFitWidth = YES;
        [_whiteTimeStatus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _whiteTimeStatus.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [self addSubview:_whiteStartTime];
        [self addSubview:_whiteTimeStatus];
        
    }
    return self;
    
}

@end
