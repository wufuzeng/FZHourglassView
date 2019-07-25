//
//  FZHourglassView.m
//  FZHourglassView_Example
//
//  Created by 吴福增 on 2019/7/25.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import "FZHourglassView.h"

#import <QuartzCore/QuartzCore.h>


@interface FZHourglassView ()

@property (nonatomic,assign,readonly) CGFloat defaultDuration;
@property (nonatomic,strong,readonly) UIColor *defaultColor;

@property (nonatomic,strong) CALayer *containerLayer;
@property (nonatomic,strong) CAShapeLayer *topLayer;
@property (nonatomic,strong) CAShapeLayer *lineLayer;
@property (nonatomic,strong) CAShapeLayer *bottomLayer;

// Animaiton
@property (nonatomic,strong) CAKeyframeAnimation *topAnimation;
@property (nonatomic,strong) CAKeyframeAnimation *bottomAnimation;
@property (nonatomic,strong) CAKeyframeAnimation *lineAnimation;
@property (nonatomic,strong) CAKeyframeAnimation *containerAnimation;

@end

@implementation FZHourglassView

-(void)setupViews{
    [self containerLayer];
    [self topLayer];
    [self bottomLayer];
    [self lineLayer];
}

-(void)reset{
    _isShowing = NO;
    self.containerLayer = nil;
    self.topLayer = nil;
    self.lineLayer = nil;
    self.bottomLayer = nil;
}

#pragma mark - Action
-(void)show {
    if (self.isShowing) return;
    _isShowing =  YES;
    [self addAnimation];
}
-(void) dismiss {
    if (!self.isShowing) return;
    _isShowing = NO;
    [self removeAnimation];
}

-(void)addAnimation{
    [self.topLayer addAnimation:self.topAnimation forKey:@"TopAnimatin"];
    [self.bottomLayer addAnimation:self.bottomAnimation forKey:@"BottomAnimation"];
    [self.lineLayer addAnimation:self.lineAnimation forKey:@"LineAnimation"];
    [self.containerLayer addAnimation:self.containerAnimation forKey:@"ContainerAnimation"];
}

-(void)removeAnimation{
    [self.topLayer removeAnimationForKey:@"TopAnimatin"];
    [self.bottomLayer removeAnimationForKey:@"BottomAnimation"];
    [self.lineLayer removeAnimationForKey:@"LineAnimation"];
    [self.containerLayer removeAnimationForKey:@"ContainerAnimation"];
}

#pragma mark -- Set,Get Func ---

-(void)setFrame:(CGRect)frame{
    CGFloat width = frame.size.width > 30 ? frame.size.width : 30;
    CGFloat height = frame.size.height > 30 ? frame.size.height : 30;
    CGRect nFrame = CGRectMake(frame.origin.x, frame.origin.y, width, height);
    [super setFrame:nFrame];
    [self reset];
    [self setupViews];
    [self show];
}

-(void)setDuration:(CGFloat)duration{
    _duration = duration;
    [self reset];
    [self setupViews];
    [self show];
}

-(void)setColor:(UIColor *)color{
    _color = color;
    [self reset];
    [self setupViews];
    [self show];
}

#pragma mark -- Lazy Func --

-(CALayer *)containerLayer{
    if (_containerLayer == nil) {
        _containerLayer = [CALayer layer];
        _containerLayer.backgroundColor = [UIColor clearColor].CGColor;
        _containerLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2.0 * 2);
        _containerLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
        _containerLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        [self.layer addSublayer:_containerLayer];
    }
    return _containerLayer;
}

-(CAShapeLayer *)topLayer{
    if (_topLayer == nil) {
        // BezierPath
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2.0f, self.frame.size.height/2.0)];
        [path addLineToPoint:CGPointMake(0, 0)];
        
        [path closePath];
        
        // Top Layer
        _topLayer = [CAShapeLayer layer];
        _topLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2.0);
        _topLayer.path = path.CGPath;
        _topLayer.fillColor = self.color.CGColor?:self.defaultColor.CGColor;
        _topLayer.strokeColor = self.color.CGColor?:self.defaultColor.CGColor;
        _topLayer.lineWidth = 0.0f;
        _topLayer.anchorPoint = CGPointMake(0.5f, 1);
        _topLayer.position = CGPointMake(self.frame.size.width / 2.0f, self.frame.size.height/2.0);
        
        [self.containerLayer addSublayer:_topLayer];
    }
    return _topLayer;
}



-(CAShapeLayer *)bottomLayer {
    if (_bottomLayer == nil) {
        // BezierPath
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(self.frame.size.width / 2, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2.0)];
        [path addLineToPoint:CGPointMake(0, self.frame.size.height/2.0 )];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, 0)];
        
        [path closePath];
        
        // Top Layer
        _bottomLayer = [CAShapeLayer layer];
        _bottomLayer.frame = CGRectMake(0, self.frame.size.height/2.0, self.frame.size.width, self.frame.size.height/2.0);
        _bottomLayer.path = path.CGPath;
        _bottomLayer.fillColor = self.color.CGColor?:self.defaultColor.CGColor;
        _bottomLayer.strokeColor = self.color.CGColor?:self.defaultColor.CGColor;
        _bottomLayer.lineWidth = 0.0f;
        _bottomLayer.anchorPoint = CGPointMake(0.5f, 1.0f);
        _bottomLayer.position = CGPointMake(self.frame.size.width / 2.0f, self.frame.size.height/2.0 * 2.0f);
        _bottomLayer.transform = CATransform3DMakeScale(0, 0, 0);
        
        [self.containerLayer addSublayer:_bottomLayer];
    }
    return _bottomLayer;
    
}
-(CAShapeLayer *)lineLayer{
    if (_lineLayer == nil) {
        // BezierPath
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(self.frame.size.width / 2, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height/2.0)];
        
        // Line Layer
        _lineLayer = [CAShapeLayer layer];
        _lineLayer.frame = CGRectMake(0, self.frame.size.height/2.0, self.frame.size.width, self.frame.size.height/2.0);
        _lineLayer.strokeColor = self.color.CGColor?:self.defaultColor.CGColor;
        _lineLayer.lineWidth = 1.0;
        _lineLayer.lineJoin = kCALineJoinMiter;
        _lineLayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:1], nil];
        _lineLayer.lineDashPhase = 3.0f;
        _lineLayer.path = path.CGPath;
        _lineLayer.strokeEnd = 0.0f;
        
        [self.containerLayer addSublayer:_lineLayer];
    }
    return _lineLayer;
}

-(CAKeyframeAnimation *)topAnimation {
    if (_topAnimation == nil) {
        _topAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        _topAnimation.duration = self.duration?:self.defaultDuration;
        _topAnimation.repeatCount = HUGE_VAL;
        _topAnimation.keyTimes = @[@0.0f, @0.9f, @1.0f];
        _topAnimation.values = @[@1.0f, @0.0f, @0.0f];
    }
    return _topAnimation;
}


-(CAKeyframeAnimation *)bottomAnimation{
    if (_bottomAnimation == nil) {
        _bottomAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        _bottomAnimation.duration = self.duration?:self.defaultDuration;
        _bottomAnimation.repeatCount = HUGE_VAL;
        _bottomAnimation.keyTimes = @[@0.1f, @0.9f, @1.0f];
        _bottomAnimation.values = @[@0.0f, @1.0f, @1.0f];
    }
    return _bottomAnimation;
}

-(CAKeyframeAnimation *)lineAnimation{
    if (_lineAnimation == nil) {
        _lineAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
        _lineAnimation.duration = self.duration?:self.defaultDuration;
        _lineAnimation.repeatCount = HUGE_VAL;
        _lineAnimation.keyTimes = @[@0.0f, @0.1f, @0.9f, @1.0f];
        _lineAnimation.values = @[@0.0f, @1.0f, @1.0f, @1.0f];
    }
    return _lineAnimation;
}

-(CAKeyframeAnimation *)containerAnimation{
    if (_containerAnimation == nil) {
        _containerAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
        _containerAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2f :1 :0.8f :0.0f];
        _containerAnimation.duration = self.duration?:self.defaultDuration;
        _containerAnimation.repeatCount = HUGE_VAL;
        _containerAnimation.keyTimes = @[@0.8f, @1.0f];
        _containerAnimation.values = @[[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:M_PI]];
        //_containerAnimation.calculationMode = kCAAnimationCubic;
    }
    return _containerAnimation;
}

-(CGFloat )defaultDuration{
    return 3.5f;
}
-(UIColor *)defaultColor{
    return [UIColor colorWithRed:0.859 green:0.467 blue:0.412 alpha:1.000];
}

@end
