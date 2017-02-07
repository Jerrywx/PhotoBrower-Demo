//
//  ViewController.m
//  PhotoBrower-Demo
//
//  Created by 王潇 on 16/6/22.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "ViewController.h"
#import "YYPhotoGroupView.h"
#import <UIImageView+WebCache.h>
#import "PhotoViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray	*itemArray;
@property (nonatomic, strong) NSArray			*models;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setupView];
	[self loadData];
}

- (void)setupView {
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.itemArray = [NSMutableArray array];
	
	CGFloat margin = 10;
	CGFloat item_W = 100;
	CGFloat item_X = 40;
	CGFloat item_Y = 80;
	
	for (int i = 0; i < 9; i++) {
		
		NSInteger lineNumber = i / 3;
		NSInteger listNumber = i % 3;
		
		CGFloat itemX = item_X + (item_W + margin) * listNumber;
		CGFloat itemY = item_Y + (item_W + margin) * lineNumber;
		
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(itemX, itemY, item_W, item_W)];
		imageView.backgroundColor = [UIColor lightGrayColor];
		imageView.userInteractionEnabled = YES;
		
		
		UITapGestureRecognizer *singleTap =
		[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage:)];
		[imageView addGestureRecognizer:singleTap];
		
		[self.itemArray addObject:imageView];
		[self.view addSubview:imageView];
	}
	
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 420, 80, 30)];
	button.backgroundColor = [UIColor redColor];
	[button setTitle:@"控制器" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(openVC) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
}

- (void)loadData {
	NSURL *url = [[NSBundle mainBundle] URLForResource:@"ttt.json" withExtension:nil];
	NSData *jsonData = [NSData dataWithContentsOfURL:url];
	NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
														 options:kNilOptions
														   error:NULL];
	self.models = dict[@"result"];
	for (int i = 0; i < 9; i++) {
		NSArray *array = dict[@"result"];
		NSString *url = array[i][@"thumbnail"][@"url"];
		
		UIImageView *imageView = self.itemArray[i];
		[imageView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
		}];
	}
}

// 点击图片
- (void)clickImage:(UIGestureRecognizer *)gesture {
	NSLog(@"=== %@", gesture.view);
	
	NSMutableArray *items = [NSMutableArray new];

	for (int i = 0; i < 9; i++) {
		NSString *urlString = self.models[i][@"largest"][@"url"];
		UIImageView *imageView = self.itemArray[i];
		YYPhotoGroupItem *item	= [YYPhotoGroupItem new];
		item.thumbView = imageView;
		item.largeImageURL = [NSURL URLWithString:urlString];
		[items addObject:item];
	}
	
	YYPhotoGroupView *v = [[YYPhotoGroupView alloc] initWithGroupItems:items];
	[v presentFromImageView:gesture.view
				toContainer:self.navigationController.view
				   animated:YES
				 completion:nil];
}

- (void)openVC {
	PhotoViewController *vc = [[PhotoViewController alloc] init];
	[self.navigationController pushViewController:vc animated:YES];
}

@end





