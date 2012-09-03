//
//  MovingLabel.h
//  MovinLabel
//
//  Created by DevZloi on 04.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MovingLableDelegate <NSObject>
@optional
-(void) movingLabelClick:(id) touch;
@end

@interface MovingLabel : UIView
@property(nonatomic, assign) id<MovingLableDelegate> delegate;
-(void) stopAnimationText;
-(void) setText:(NSString *) text;
-(void) setTextFont:(UIFont *) font;
-(void) setTextColor:(UIColor *) color;
@end
