//
//  DBDFutureMovie.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/27.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDFutureMovie.h"

@implementation DBDFutureMovie
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation SubjectsFutureModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"ID":@"id"}];
}
@end

@implementation ImagesFutureModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

