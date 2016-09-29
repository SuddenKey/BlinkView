//
//  ViewController.m
//  BlinkView
//
//  Created by HaoHao on 16/9/29.
//  Copyright © 2016年 haohao. All rights reserved.
//

#import "ViewController.h"
#import "AlertView.h"
@interface ViewController ()

@property (nonatomic, strong) UILabel *greenLabel;

@property (nonatomic, strong) CALayer *aLayer;

@property (nonatomic, strong) NSTimer *timeFire;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *redLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redLabel.center = self.view.center;
    redLabel.layer.cornerRadius = redLabel.frame.size.width / 2;
    redLabel.clipsToBounds = YES;
    redLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:redLabel];
    
    UILabel *blueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    blueLabel.center = self.view.center;
    blueLabel.layer.cornerRadius = blueLabel.frame.size.width / 2;
    blueLabel.clipsToBounds = YES;
    blueLabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueLabel];
    
    UILabel *yellowLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    yellowLabel.center = self.view.center;

    yellowLabel.layer.cornerRadius = yellowLabel.frame.size.width / 2;
    yellowLabel.clipsToBounds = YES;
    yellowLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowLabel];
    
    _greenLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    _greenLabel.center = self.view.center;
    _greenLabel.layer.cornerRadius = _greenLabel.frame.size.width / 2;
    _greenLabel.clipsToBounds = YES;
    _greenLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_greenLabel];
    
    _aLayer = [[CALayer alloc] init];
    _aLayer.bounds = CGRectMake(0, 0, 40, 40);
    _aLayer.position = self.view.center;
    _aLayer.opacity = 0.3;
    _aLayer.backgroundColor = [UIColor greenColor].CGColor;
    _aLayer.cornerRadius = _aLayer.frame.size.height / 2;
    _aLayer.allowsEdgeAntialiasing = YES;
    [self.view.layer addSublayer:_aLayer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    [button setBackgroundColor:[UIColor yellowColor]];
    [button addTarget:self action:@selector(time) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)time {
    [self.timeFire fire];
    AlertView *view = [[AlertView alloc] initWithFrame:CGRectZero];
    [view show];
}

- (void)layerChange {
    if (self.aLayer.bounds.size.width == 20) {
        self.aLayer.bounds = CGRectMake(0, 0, 40, 40);
        _aLayer.opacity = 0.3;
    } else {
        self.aLayer.bounds = CGRectMake(0, 0, 20, 20);
        _aLayer.opacity = 1.0;
    }
    self.aLayer.position = self.view.center;
    self.aLayer.cornerRadius = self.aLayer.bounds.size.width / 2;
}

- (NSTimer *)timeFire {
    if (_timeFire == nil) {
        _timeFire = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(layerChange) userInfo:nil repeats:YES];
    }
    return _timeFire;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
