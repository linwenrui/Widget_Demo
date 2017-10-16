//
//  TodayViewController.m
//  WidgetTest
//
//  Created by XH-LWR on 2017/10/16.
//  Copyright © 2017年 XH-LWR. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "WFHeaderView.h"

@interface TodayViewController () <NCWidgetProviding, WFHeaderViewDelegate>

@property (nonatomic, weak) WFHeaderView *headerView;

@end

@implementation TodayViewController

#pragma mark - 设置界面的高度

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (ios10_later) {
        
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
        // 设置界面的高度
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    } else {
    
        // 设置界面的高度
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
}

#pragma mark - 初始化

- (void)setup {

    // 添加headerView
    WFHeaderView *headerView = [[WFHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 110)];
    headerView.delegate = self;
    [self.view addSubview:headerView];
    self.headerView = headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    NSLog(@"TodayViewController 内存警告");
}

#pragma mark - 更新Widget界面

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    //    NCUpdateResultNewData   新的内容需要重新绘制视图
    //    NCUpdateResultNoData    部件不需要更新
    //    NCUpdateResultFailed    更新过程中发生错误
    completionHandler(NCUpdateResultNewData);
}

#pragma mark - widgetMarginInsetsForProposedMarginInsets iOS10以后已废除

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {

    return UIEdgeInsetsMake(0, 10, 0, 10);
}

#pragma mark - WFHeaderViewDelegate 

- (void)WGHeaderView:(WFHeaderView *)headerVie clickTag:(NSInteger)index {

    NSString *urlStr = [NSString stringWithFormat:@"MyWidget://%ld", index];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        
    }];
}

@end
