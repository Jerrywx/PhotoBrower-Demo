//
//  UIScrollView+YYAdd.m
//  YYKit <https://github.com/ibireme/YYKit>
//
//  Created by ibireme on 13/4/5.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "UIScrollView+YYAdd.h"


@implementation UIScrollView (YYAdd)

- (void)scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

@end
