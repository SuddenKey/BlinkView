//
//  AlertView.h
//  BlinkView
//
//  Created by HaoHao on 16/9/29.
//  Copyright © 2016年 haohao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlertViewDelegate <NSObject>

- (void)selectLearn;

@end

@interface AlertView : UIView

@property (nonatomic, assign) id<AlertViewDelegate>delegate;

- (void)dismiss;

- (void)show;

@end
