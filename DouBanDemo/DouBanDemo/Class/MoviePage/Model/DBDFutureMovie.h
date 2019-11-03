//
//  DBDFutureMovie.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/27.
//  Copyright © 2019 王天亮. All rights reserved.
//

@protocol SubjectsFutureModel
@end

#import "JSONModel.h"


NS_ASSUME_NONNULL_BEGIN


@interface ImagesFutureModel : JSONModel
@property (nonatomic, copy) NSString *small;
@property (nonatomic, copy) NSString *medium;
@end


@interface SubjectsFutureModel : JSONModel
@property (nonatomic, strong) NSString *mainland_pubdate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) ImagesFutureModel *images;
@property (nonatomic, strong) NSString *ID;

@end


@interface DBDFutureMovie : JSONModel
@property (nonatomic, copy) NSString *total;
@property (nonatomic, strong) NSArray <SubjectsFutureModel>*subjects;
@end

NS_ASSUME_NONNULL_END
