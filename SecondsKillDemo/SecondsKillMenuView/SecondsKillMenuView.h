//
//  SecondsKillMenuView.h
//  SecondsKillDemo
//
//  Created by MacOS on 2018/8/7.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeView.h"
#import "WhiteCoverView.h"

#define SCW [UIScreen mainScreen].bounds.size.width
#define SCH [UIScreen mainScreen].bounds.size.height

@interface SecondsKillMenuView : UIView<UIScrollViewDelegate>

//滚动菜单栏 时间Item
@property(nonatomic,strong) TimeView *menuClickView;
//滚动菜单栏 蒙版覆盖层
@property(nonatomic,strong) UIButton *coverMenuButton;
//滚动菜单栏 item Width
@property(nonatomic,assign) float menuWidth;
//滚动菜单栏 布局frame
@property(nonatomic,assign) CGRect menuBaseViewFrame;
//滚动菜单栏 滚动ScrollView
@property(nonatomic,strong) UIScrollView *menuScrollView;
//滚动菜单栏 时间数组
@property(nonatomic,strong) NSArray *timeArray;
//滚动菜单栏 标题数组
@property(nonatomic,strong) NSArray *titleArray;
//滚动菜单栏 显示几个可视菜单
@property(nonatomic,assign) int menuVisibleNum;
//滚动菜单栏 中间红色指示器
@property(nonatomic,strong) UIView *menuCenterRedIndicatorView;
//滚动菜单栏 中间红色指示器小三角
@property(nonatomic,strong) UIView *menuCenterRedtriangleView;
//底部联动内容页面ScrollView
@property(nonatomic,strong) UIScrollView *pageContentScrollView;
//底部联动内容页面布局frame
@property(nonatomic,assign) CGRect pageContentScrollViewFrame;

@property (strong,nonatomic)UIButton * selectedBtn1;
@property (strong,nonatomic)UIButton * selectedBtn2;


- (void)setMenuTimeArray:(NSArray *)timeArray andTitleArray:(NSArray *)titleArray andNumOfShow:(int)nums;
- (void)setPageContentScrollViewFrame:(CGRect)frame;
@end
