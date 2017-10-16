//
//  WFHeaderView.m
//  Widget_Demo
//
//  Created by XH-LWR on 2017/10/16.
//  Copyright © 2017年 XH-LWR. All rights reserved.
//

#import "WFHeaderView.h"
#import "WGButton.h"

@implementation WFHeaderView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupWith:frame];
    }
    return self;
}

#pragma mark - 初始化

- (void)setupWith:(CGRect)frame {
    
    CGFloat magin = 10;
    CGFloat btnW = (frame.size.width - 6 * magin) / 4;
    CGFloat btnH = frame.size.height - 2 * magin;
    NSArray *infoArr = [NSArray array];
    if (ios10_later) {
        
        infoArr = @[
                    @{@"imageName":@"diagnosis_wg",
                      @"title":@"诊疗中心"
                      },
                    @{@"imageName":@"season_wg",
                      @"title":@"时令养生"
                      },
                    @{@"imageName":@"test_wg",
                      @"title":@"体质测试"
                      },
                    @{@"imageName":@"game_wg",
                      @"title":@"游戏"
                      },
                    ];
    }else{
        
        infoArr = @[
                    @{@"imageName":@"diagnosis_wg9",
                      @"title":@"诊疗中心"
                      },
                    @{@"imageName":@"season_wg9",
                      @"title":@"时令养生"
                      },
                    @{@"imageName":@"test_wg9",
                      @"title":@"体质测试"
                      },
                    @{@"imageName":@"game_wg9",
                      @"title":@"游戏"
                      }
                    ];
    }
    for (int i = 0; i < infoArr.count; i++) {
        
        WGButton *btn = [[WGButton alloc] initWithFrame:CGRectMake(magin * (i + 1) + btnW * i, magin, btnW, btnH)];
        [btn setImage:[UIImage imageNamed:infoArr[i][@"imageName"]] forState:UIControlStateNormal];
        [btn setTitle:infoArr[i][@"title"] forState:UIControlStateNormal];
        if (ios10_later) {
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        } else {
        
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self addSubview:btn];
    }
}

- (void)onClick:(UIButton *)btn {

    if ([self.delegate respondsToSelector:@selector(WGHeaderView:clickTag:)]) {
        
        [self.delegate WGHeaderView:self clickTag:btn.tag];
    }
}

@end
