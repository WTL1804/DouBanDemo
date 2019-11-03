//
//  DBDMovieModel.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/24.
//  Copyright © 2019 王天亮. All rights reserved.
//
@protocol SubjectsModel
@end

@protocol RatingModel
@end

@protocol ImagesModel
@end

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface ImagesModel : JSONModel
@property (nonatomic, copy) NSString *small;
@property (nonatomic, copy) NSString *medium;
@end



@interface RatingModel : JSONModel
@property (nonatomic, copy) NSString *average;
@property (nonatomic, copy) NSString *stars;
@end

@interface SubjectsModel : JSONModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *ID;

@property (nonatomic) RatingModel *rating;

@property (nonatomic) ImagesModel *images;

@end

@interface DBDMovieModel : JSONModel

@property (nonatomic) NSArray<SubjectsModel>*subjects;
@property (nonatomic, copy) NSString * total;
@end
NS_ASSUME_NONNULL_END
