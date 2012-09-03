//
//  MovingLabel.m
//  MovinLabel
//
//  Created by DevZloi on 04.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MovingLabel.h"
#import <QuartzCore/QuartzCore.h>


@interface MovingLabel()
@property(nonatomic, retain) UILabel *label;
-(void) animationFrameLabel;
@end


@implementation MovingLabel
@synthesize delegate;
@synthesize label = label_;

-(void) dealloc {
  [label_ release];
  [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.clipsToBounds = YES;
    self.label = [[[UILabel alloc] initWithFrame:self.bounds] autorelease];
    self.label.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    self.label.textColor = [UIColor whiteColor];
    SEL selectorTapGesture = @selector(tapGestureClick:);
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self 
                                            action:selectorTapGesture];
    [self addGestureRecognizer:tapGesture];
    [tapGesture release];
    [self addSubview:self.label];
  }
  return self;
}


-(void)tapGestureClick:(UITapGestureRecognizer *) tap {
  SEL selClick = @selector(movingLabelClick:);
  if ([delegate respondsToSelector:selClick]) {
    [delegate performSelector:selClick withObject:tap];
  }
}

-(void) animationFrameLabel { 
  CGFloat tx = 0-(self.label.bounds.size.width+self.bounds.size.width+10); 
  CGAffineTransform afTransform = CGAffineTransformMakeTranslation(tx, 0);
  CATransform3D t3Transform =  CATransform3DMakeAffineTransform(afTransform);
  // Указваем какое свойство надо анимировать
  CABasicAnimation *bAnimation = [CABasicAnimation animationWithKeyPath: @"transform"];
  [bAnimation setDuration:6];
  [bAnimation setTimeOffset:1];
  bAnimation.fromValue = [NSValue valueWithCATransform3D:self.label.layer.transform];
  bAnimation.toValue = [NSValue valueWithCATransform3D:t3Transform];
  bAnimation.repeatCount = HUGE_VALF;
  //bAnimation.autoreverses = YES;
  
  [self.label.layer addAnimation:bAnimation forKey:@"animationLabel"];
  
}

-(void) stopAnimationText {
  [self.label.layer removeAnimationForKey:@"animationLabel"];
  CGSize size = [self.label.text sizeWithFont:self.label.font];
  [self.label setFrame:(CGRect){self.bounds.origin.x,
    self.bounds.origin.y,
    size.width,
    size.height}];
}

-(void) setLabelFrame {
  [self stopAnimationText];
  CGSize size = [self.label.text sizeWithFont:self.label.font];
  [self.label setFrame:(CGRect){self.bounds.size.width+10,
    self.bounds.origin.y,
    size.width,
    size.height}];
  if (self.label.frame.size.width > self.frame.size.width) {
    [self animationFrameLabel];
  } else {
    [self.label setFrame:(CGRect){self.bounds.origin.x,
      self.bounds.origin.y,
      size.width,
      size.height}];
  }
  
}

-(void) setText:(NSString *)text {
  self.label.text = text;
  [self setLabelFrame];
}

-(void) setTextFont:(UIFont *) font {
  self.label.font = font;
  [self setLabelFrame];
}

-(void) setTextColor:(UIColor *)color {
  self.label.textColor = color;
}

@end
