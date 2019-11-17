//
//  DBDEveryMovieModel.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/2.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AuthorModel
@end
@protocol RatingsEveryModel
@end
@protocol  PopularCommentsModel
@end
@protocol RatingsModel
@end
@protocol ImageSmallModel
@end
@protocol DetailsMode
@end

@interface AuthorModel : JSONModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatar;
@end

@interface RatingsEveryModel : JSONModel
@property (nonatomic, copy) NSString *value;
@end

@interface PopularCommentsModel : JSONModel
@property (nonatomic, copy) RatingsEveryModel *rating;
@property (nonatomic, copy) AuthorModel *author;
@property (nonatomic, copy) NSString *content;
@end


@interface DetailsModel : JSONModel
@property (nonatomic, copy) NSString * one;
@property (nonatomic, copy) NSString * two;
@property (nonatomic, copy) NSString * three;
@property (nonatomic, copy) NSString * four;
@property (nonatomic, copy) NSString * five;
@end

@interface ImageSmallModel : JSONModel
@property (nonatomic, copy) NSString *small;
@end

@interface RatingsModel : JSONModel
@property (nonatomic, copy) NSString *max;
@property (nonatomic, copy) NSString *stars;
@property (nonatomic, copy) NSString *average;
@property (nonatomic) DetailsModel *details;

@end


@interface DBDEveryMovieModel : JSONModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) RatingsModel *rating;
@property (nonatomic, copy) ImageSmallModel *images;
@property (nonatomic, copy) NSArray *genres;
@property (nonatomic, copy) NSArray *countries;
@property (nonatomic, copy) NSArray *pubdates;
@property (nonatomic, copy) NSArray *durations;
@property (nonatomic, copy) NSString *original_title;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *wish_count;
@property (nonatomic, copy) NSString *collect_count;
@property (nonatomic, copy) NSString *ratings_count;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSArray <PopularCommentsModel> * popular_comments;
@end

NS_ASSUME_NONNULL_END
