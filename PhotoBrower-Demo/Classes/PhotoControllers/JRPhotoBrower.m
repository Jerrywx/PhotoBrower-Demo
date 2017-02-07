//
//  JRPhotoBrowew.m
//  PhotoBrower-Demo
//
//  Created by 王潇 on 2017/2/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

#import "JRPhotoBrower.h"

@interface JRPhotoBrower ()

/// 父View
@property (nonatomic, weak) UIView	*superView;
/// 图片数组
@property (nonatomic, strong) NSArray	*photoItems;

@end


@implementation JRPhotoBrower

- (instancetype)init {
	self = [super init];
	
	return self;
}

- (instancetype)initWithSuper:(UIView *)superView {
	self = [super init];
	self.superView = superView;
	[self initProperty];
	return self;
}

- (instancetype)initWithSuper:(UIView *)superView photoItems:(NSArray *)items {
	self = [super init];
	self.superView  = superView;
	self.photoItems = items;
	[self initProperty];
	return self;
}

/// 初始化属性
- (void)initProperty {
	
	self.frame = self.superView.bounds;
	[self.superView addSubview:self];
	self.backgroundColor = [UIColor clearColor];
	[UIView animateWithDuration:0.5 animations:^{
		self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.9];
	}];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	
	[UIView animateWithDuration:0.5 animations:^{
		self.backgroundColor = [UIColor clearColor];
	} completion:^(BOOL finished) {
		[self removeFromSuperview];
	}];
}

@end









