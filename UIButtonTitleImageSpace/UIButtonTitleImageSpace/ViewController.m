//
//  ViewController.m
//  UIButtonTitleImageSpace
//
//  Created by YongLeiChu on 2018/4/17.
//  Copyright © 2018年 YongLeiChu. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+TitleImageSpaceButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 200, 100);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"哇哈哈" forState:UIControlStateNormal];
    btn.titleLabel.backgroundColor = [UIColor purpleColor];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setImage:[UIImage imageNamed:@"image.jpg"] forState:UIControlStateNormal];
    btn.titleSpaceRect = NSStringFromCGRect(CGRectMake(0, 50, 200, 50));
    btn.imageSpaceRect = NSStringFromCGRect(CGRectMake(0, 0, 200, 50));
    [self.view addSubview:btn];
    btn.center = self.view.center;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
