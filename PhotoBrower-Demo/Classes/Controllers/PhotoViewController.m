//
//  PhotoViewController.m
//  PhotoBrower-Demo
//
//  Created by 王潇 on 2017/2/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

#import "PhotoViewController.h"
#import "JRPhotoBrower.h"

@interface PhotoViewController ()

@property (nonatomic, strong) JRPhotoBrower *brower;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	self.brower = [[JRPhotoBrower alloc] initWithSuper:self.navigationController.view];
}

@end
