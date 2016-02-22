//
//  AnimationLabel.h
//  果冻动画
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 cheniue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationLabelLayer : CALayer
@property(nonatomic,assign)NSInteger step;
@end

@class AnimationLabel;

typedef void (^AnimationFunction)(AnimationLabel* label);

@interface AnimationLabel : UILabel

@property(nonatomic,copy)AnimationFunction function;

-(BOOL)isAnimation;
-(void)startAnimation;
-(void)endAnimation;



@end
