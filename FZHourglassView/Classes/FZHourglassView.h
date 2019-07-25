//
//  FZHourglassView.h
//  FZHourglassView_Example
//
//  Created by 吴福增 on 2019/7/25.
//  Copyright © 2019 wufuzeng. All rights reserved.
//
/**
 ⏳（沙漏加载loading）
 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZHourglassView : UIView

@property (nonatomic,assign) CGFloat duration;
@property (nonatomic,strong) UIColor *color;

@property (nonatomic,assign,readonly) BOOL isShowing;

- (void)show;
- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
