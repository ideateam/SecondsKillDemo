//
//  SecondsKillMenuView.m
//  SecondsKillDemo
//
//  Created by MacOS on 2018/8/7.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "SecondsKillMenuView.h"

@implementation SecondsKillMenuView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

#pragma mark - 菜单menuArray - 初始化菜单数组 数量
- (void)setMenuTimeArray:(NSArray *)timeArray andTitleArray:(NSArray *)titleArray andNumOfShow:(int)nums{
    
    _timeArray = [NSArray arrayWithArray:timeArray];
    _titleArray = [NSArray arrayWithArray:titleArray];
    
    _menuVisibleNum = nums;
    _menuWidth = self.frame.size.width/nums;
    
    self.pageContentScrollView.contentSize = CGSizeMake(_timeArray.count * SCW, SCH);
    
    [self addSubview:self.menuCenterRedIndicatorView];
    
    //添加指示小三角形
    self.menuCenterRedtriangleView.transform = CGAffineTransformMakeRotation(M_PI * 0.25);
    [self.menuCenterRedIndicatorView addSubview:self.menuCenterRedtriangleView];
    
    for (int i = 2; i < _timeArray.count + 2; i++) {
        
        //20:00 - 即将开始
        _menuClickView = [[TimeView alloc] initWithFrame:CGRectMake(_menuWidth * i, 0, _menuWidth, self.frame.size.height)];
        
        [_menuClickView.startTime setTitle:[NSString stringWithFormat:@"%@",_timeArray[i - 2]] forState:UIControlStateNormal];
        [_menuClickView.timeStatus setTitle:_titleArray[i - 2] forState:UIControlStateNormal];
        _menuClickView.userInteractionEnabled = YES;
        _menuClickView.tag = 200 + i;
        
        
        //添加Button覆盖层，点击事件
        _coverMenuButton = [[UIButton alloc] initWithFrame:CGRectMake(_menuWidth * i, 0, _menuWidth, self.frame.size.height)];
        _coverMenuButton.userInteractionEnabled = YES;
        _coverMenuButton.tag = 100 + i;
        //点击事件
        [_coverMenuButton addTarget:self action:@selector(coverButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
        [self.menuScrollView addSubview:_menuClickView];
        [self.menuScrollView addSubview:_coverMenuButton];
        
        
    }
    [self addSubview:self.menuScrollView];
}

#pragma mark - PageContentScrollView - 初始化布局
- (void)setPageContentScrollViewFrame:(CGRect)frame{
    _pageContentScrollViewFrame = frame;
    self.pageContentScrollView.frame = frame;
}

#pragma mark - coverMenuButton - 点击事件
- (void)coverButtonClick:(UIButton *)button{
    

    int tagValue = (int)button.tag - 100 ;

    [_menuScrollView setContentOffset:CGPointMake((tagValue - 2) * _menuWidth, 0) animated:YES];
    [_pageContentScrollView setContentOffset:CGPointMake((tagValue - 2 ) * SCW, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate - 代理事件
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    if (scrollView == self.pageContentScrollView) {
        
        int x = (int)(scrollView.contentOffset.x/SCW);
        [self.menuScrollView setContentOffset:CGPointMake(_menuWidth *  x, 0) animated:YES];
    }
    
}

//手指离开屏幕
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (scrollView == self.menuScrollView) {
        
        float x1 = (scrollView.contentOffset.x/_menuWidth);
        int x2 = (int)(scrollView.contentOffset.x/_menuWidth) + 1;
        NSLog(@"x1 = %f,x2 = %d ",x1,x2);
        
        
        if (x2 >= _timeArray.count) {
            x2 = (int)self.timeArray.count - 1;
        }
        
        if ( x2 < 1) {
            x2 = 0;
        }
        
        if (x1 <0 ) {
            x2 = 0;
        }
        
        if (x1 == 0) {
            x2 = 0;
        }
        
        [self.menuScrollView setContentOffset:CGPointMake(_menuWidth * x2 , 0) animated:YES];
        [self.pageContentScrollView setContentOffset:CGPointMake(SCW * x2  , 0) animated:YES];
        
    }else if (scrollView == self.menuScrollView){
        
        
        
    }
}
//结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    if (scrollView == self.menuScrollView) {
        
        float x1 = (scrollView.contentOffset.x/_menuWidth);
        int x2 = (int)(scrollView.contentOffset.x/_menuWidth) + 1;
        //NSLog(@"x1 = %f,x2 = %d ",x1,x2);
        
        
        if (x2 >= _timeArray.count) {
            x2 = (int)self.timeArray.count - 1;
        }
        
        if ( x2 < 1) {
            x2 = 0;
        }
        
        if (x1 <0 ) {
            x2 = 0;
        }
        
        if (x1 == 0) {
            x2 = 0;
        }
        
        [self.menuScrollView setContentOffset:CGPointMake(_menuWidth * x2 , 0) animated:YES];
        [self.pageContentScrollView setContentOffset:CGPointMake(SCW * x2  , 0) animated:YES];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
 
}

#pragma mark - 懒加载 -
- (UIScrollView *)menuScrollView{
    if (!_menuScrollView) {
        _menuScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _menuScrollView.backgroundColor = [UIColor clearColor];
        _menuScrollView.contentSize = CGSizeMake((_timeArray.count + 4) * _menuWidth, self.frame.size.height);
        _menuScrollView.contentOffset = CGPointMake(0, 0);
        _menuScrollView.showsHorizontalScrollIndicator = NO;
        _menuScrollView.userInteractionEnabled = YES;
        _menuScrollView.delegate = self;
        _menuScrollView.bounces = NO;
    }
    return _menuScrollView;
}

- (UIView *)menuCenterRedIndicatorView{
    if (!_menuCenterRedIndicatorView) {
        _menuCenterRedIndicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/_menuVisibleNum, self.bounds.size.height)];
        _menuCenterRedIndicatorView.backgroundColor = [UIColor colorWithRed:255/255.0 green:60/255.0 blue:30/255.0 alpha:1];
        _menuCenterRedIndicatorView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    }
    return _menuCenterRedIndicatorView;
}

- (UIView *)menuCenterRedtriangleView{
    if (!_menuCenterRedtriangleView) {
        _menuCenterRedtriangleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        _menuCenterRedtriangleView.backgroundColor = MakeColor(255, 60, 30);
        _menuCenterRedtriangleView.center = CGPointMake(_menuWidth/2, self.frame.size.height - 2);
    }
    return _menuCenterRedtriangleView;
}

- (UIScrollView *)pageContentScrollView{
    if (!_pageContentScrollView) {
        _pageContentScrollView = [[UIScrollView alloc] init];
        _pageContentScrollView.backgroundColor = [UIColor whiteColor];
        _pageContentScrollView.pagingEnabled = YES;
        _pageContentScrollView.delegate = self;
        _pageContentScrollView.contentOffset = CGPointZero;
    }
    return _pageContentScrollView;
}


@end
