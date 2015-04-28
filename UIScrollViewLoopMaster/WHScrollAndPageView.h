//  WHScrollAndPageView.h
//  循环滚动视图
//
//  Created by ligang on 15/4/25.
//  Copyright (c) 2015年 ligang. All rights reserved.
//
//  我的微信iOS开发：iOSDevTip
//  我的博客地址 http://www.superqq.com

#import <UIKit/UIKit.h>

@protocol WHcrollViewViewDelegate;

@interface WHScrollAndPageView : UIView <UIScrollViewDelegate>
{
    __unsafe_unretained id <WHcrollViewViewDelegate> _delegate;
}

@property (nonatomic, assign) id <WHcrollViewViewDelegate> delegate;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, strong) NSMutableArray *imageViewAry;

@property (nonatomic, readonly) UIScrollView *scrollView;

@property (nonatomic, readonly) UIPageControl *pageControl;

-(void)shouldAutoShow:(BOOL)shouldStart;

@end

@protocol WHcrollViewViewDelegate <NSObject>

@optional
- (void)didClickPage:(WHScrollAndPageView *)view atIndex:(NSInteger)index;

@end