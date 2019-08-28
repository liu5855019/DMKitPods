//
//  DMScreen.m
//  DMKit
//
//  Created by iMac-03 on 2019/8/28.
//  Copyright © 2019 daimu. All rights reserved.
//

#import "DMScreen.h"

#import "DMDefine.h"

@interface DMScreen ()

@property (nonatomic , assign) CGFloat scaleH;
@property (nonatomic , assign) CGFloat scaleW;

@end


@implementation DMScreen

+ (instancetype)shareInstance
{
    static DMScreen *screen;
    if (screen) {
        return screen;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        screen = [[self alloc] init];
    });
    return screen;
}

#pragma mark - Screen

- (CGFloat)screenScaleH
{
    if (_scaleH == 0) {
        _scaleH = kScreenH / 667.0f;
    }
    return _scaleH;
}

- (CGFloat)screenScaleW
{
    if (_scaleW == 0) {
        _scaleW = kScreenW / 375.0f;
    }
    return _scaleW;
}

@end

