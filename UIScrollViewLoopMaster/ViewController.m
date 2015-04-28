//  ViewController.m
//  循环滚动视图
//
//  Created by ligang on 15/4/25.
//  Copyright (c) 2015年 ligang. All rights reserved.
//
//  我的微信iOS开发：iOSDevTip
//  我的博客地址 http://www.superqq.com

#import "ViewController.h"
#import "WHScrollAndPageView.h"
#define NUM 3

@interface ViewController ()<WHcrollViewViewDelegate>
{
    WHScrollAndPageView *_whView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建view （view中包含UIScrollView、UIPageControl，设置frame）
    _whView = [[WHScrollAndPageView alloc] initWithFrame:CGRectMake(0, 44, 320, 400)];
    
    //把N张图片放到imageview上
    NSMutableArray *tempAry = [NSMutableArray array];
    for (int i=0; i<NUM; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%i.jpg",i]];
        [tempAry addObject:imageView];
    }
    
    //把imageView数组存到whView里
    [_whView setImageViewAry:tempAry];
    
    //把图片展示的view加到当前页面
    [self.view addSubview:_whView];
    
    //开启自动翻页
    [_whView shouldAutoShow:YES];
    
    //遵守协议
    _whView.delegate = self;
}

#pragma mark 协议里面方法，点击某一页
-(void)didClickPage:(WHScrollAndPageView *)view atIndex:(NSInteger)index
{
    NSLog(@"点击了第%li页",index);
}

#pragma mark 界面消失的时候，停止自动滚动
-(void)viewDidDisappear:(BOOL)animated
{
    [_whView shouldAutoShow:NO];
}

@end