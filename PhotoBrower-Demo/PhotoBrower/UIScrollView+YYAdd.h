//
//  UIScrollView+YYAdd.h
//  YYKit <https://github.com/ibireme/YYKit>
//
//  Created by ibireme on 13/4/5.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `UIScrollView`.
 */
@interface UIScrollView (YYAdd)

/**
 Scroll content to top.
 
 @param animated  Use animation.
 */
- (void)scrollToTopAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
