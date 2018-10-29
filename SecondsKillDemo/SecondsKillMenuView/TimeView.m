//
//  TimeView.m
//  SecondsKillDemo
//
//  Created by MacOS on 2018/8/7.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        

        // 时间 18:00
        _startTime = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/2)];
        [_startTime setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _startTime.userInteractionEnabled = YES;
        _startTime.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
        //即将开启、已经开启
        _timeStatus = [[UIButton alloc] initWithFrame:CGRectMake(0, _startTime.frame.size.height, frame.size.width, frame.size.height/2)];
        _timeStatus.userInteractionEnabled = YES;
        [_timeStatus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _timeStatus.titleLabel.font = [UIFont systemFontOfSize:13];

        [self addSubview:_startTime];
        [self addSubview:_timeStatus];
        
    }
    return self;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
