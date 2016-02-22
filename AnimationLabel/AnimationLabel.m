//
//  AnimationLabel.m
//  果冻动画
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 cheniue. All rights reserved.
//

#import "AnimationLabel.h"
#import <objc/runtime.h> 

@implementation AnimationLabelLayer

+(BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"step"])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

+(void)initialize
{
    [super initialize];
    
    Method my_Method =  class_getInstanceMethod([AnimationLabelLayer class], @selector(labelDrawInContext:));
    
    IMP my_IMP = method_getImplementation(class_getInstanceMethod([UILabel layerClass], @selector(drawInContext:)));
    
    method_setImplementation(my_Method, my_IMP);
}
-(void)drawInContext:(CGContextRef)ctx
{
    [self labelDrawInContext:ctx];
}
-(void)labelDrawInContext:(CGContextRef)ctx
{
    
}
@end

@implementation AnimationLabel

-(void)startAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"step"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 0.5f;
    animation.removedOnCompletion = YES;
    animation.autoreverses = NO;
    animation.repeatCount = HUGE_VALF;
    [self.layer addAnimation:animation forKey:@"step"];
}
-(void)endAnimation
{
    [self.layer removeAnimationForKey:@"step"];
}
+(Class)layerClass
{
    return [AnimationLabelLayer class];
}
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    [super drawLayer:layer inContext:ctx];
    
    if (self.function)
    {
        typeof(self) __weak weakself = self;
        self.function(weakself);
    }
}
-(BOOL)isAnimation
{
    return [self.layer animationForKey:@"step"]!=nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
