//
//  WFHeaderView.h
//  Widget_Demo
//
//  Created by XH-LWR on 2017/10/16.
//  Copyright © 2017年 XH-LWR. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WFHeaderView;

#define ios10_later [[UIDevice currentDevice].systemVersion doubleValue] >= 10.0

@protocol WFHeaderViewDelegate <NSObject>

@optional
- (void)WGHeaderView:(WFHeaderView *)headerVie clickTag:(NSInteger)index;

@end

@interface WFHeaderView : UIView

@property (nonatomic, weak) id<WFHeaderViewDelegate> delegate;

@end
