//
//  AlertView.m
//  BlinkView
//
//  Created by HaoHao on 16/9/29.
//  Copyright © 2016年 haohao. All rights reserved.
//

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import "AlertView.h"

@interface AlertView ()

@property (nonatomic, strong)  UIView *backView;

@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation AlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, 0, ScreenHeight);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        [self setUpSubView];
    }
    return self;
}

- (void)setUpSubView {
    _backView = [[UIView alloc] initWithFrame:CGRectMake(- ScreenWidth + 60, self.center.y - 100, ScreenWidth - 120, 200)];
    _backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _backView.userInteractionEnabled = YES;
    _backView.layer.cornerRadius = 10;
    _backView.clipsToBounds = YES;
    [self addSubview:_backView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 120, 150)];
    titleLabel.backgroundColor = [UIColor yellowColor];
    [_backView addSubview:titleLabel];
    
    UIButton *learnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [learnButton setBackgroundColor:[UIColor greenColor]];
    learnButton.frame = CGRectMake(0, CGRectGetMaxY(titleLabel.frame) + 0.5, ScreenWidth - 120, 49.5);
    [learnButton addTarget:self action:@selector(learn) forControlEvents:UIControlEventTouchUpInside];
    [_backView addSubview:learnButton];
    
    _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteButton.frame = CGRectMake(- ScreenWidth + 50, self.center.y - 110, 20, 20);
    [_deleteButton setBackgroundColor:[UIColor redColor]];
    [_deleteButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_deleteButton];
}

- (void)dismiss {
    [self removeFromSuperview];
}

- (void)learn {
    if ([_delegate respondsToSelector:@selector(selectLearn)]) {
        [_delegate selectLearn];
    }
}

- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [UIView animateWithDuration:1 animations:^{
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        _backView.frame = CGRectMake(60, self.center.y - 100, ScreenWidth - 120, 200);
        _deleteButton.frame = CGRectMake(50, self.center.y - 110, 20, 20);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
