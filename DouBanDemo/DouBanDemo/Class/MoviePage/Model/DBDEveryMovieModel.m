//
//  DBDEveryMovieModel.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/2.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDEveryMovieModel.h"

@implementation DBDEveryMovieModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation RatingsModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation ImageSmallModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation DetailsModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"one":@"1", @"two":@"2", @"three":@"3", @"four":@"4",@"five":@"5"}];
}
@end


@implementation PopularCommentsModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation AuthorModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation RatingsEveryModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
