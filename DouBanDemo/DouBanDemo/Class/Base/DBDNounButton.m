//
//  DBDNounButton.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/17.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDNounButton.h"

@implementation DBDNounButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(5, 15, 60, 25);
}
// 背景边界
- (CGRect)backgroundRectForBounds:(CGRect)bounds {
    return self.bounds;
}
//图片大小
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(60, 17, 20, 20);
}
//内容边界
- (CGRect)contentRectForBounds:(CGRect)bounds {
    return self.bounds;
}

@end
