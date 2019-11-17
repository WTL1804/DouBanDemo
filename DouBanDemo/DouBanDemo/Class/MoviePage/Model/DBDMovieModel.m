//
//  DBDMovieModel.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/24.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDMovieModel.h"

@implementation DBDMovieModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation RatingModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation SubjectsModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"ID":@"id"}];
}
@end

@implementation CastsModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation DirectorsModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
