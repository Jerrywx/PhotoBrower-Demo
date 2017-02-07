//
//  JRPhotoModel.h
//  PhotoBrower-Demo
//
//  Created by 王潇 on 2017/2/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRPhotoModel : NSObject

/// 缩略图数据
@property (nonatomic, strong) UIImage *thumbImage;
/// imageView
@property (nonatomic, strong) UIImageView	*thumbImageView;
/// index
@property (nonatomic, assign) NSInteger	index;
/// url
@property (nonatomic, strong) NSString	*urlString;

@end
