//
//  DBDBaseButton.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/11.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDBaseButton.h"

@implementation DBDBaseButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//返回标题view的大小
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, self.bounds.size.height * 3 / 4 + 10, self.bounds.size.width, self.bounds.size.height / 4);
}
// 背景边界
- (CGRect)backgroundRectForBounds:(CGRect)bounds {
    return CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height + 10);
}
//图片大小
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 3/4);
}
//内容边界
- (CGRect)contentRectForBounds:(CGRect)bounds {
    return CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height + 10);
}
@end
