//
//  DBDEveryMovieImagesModel.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/14.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol PhotosModel
@end

@interface PhotosModel : JSONModel
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *photos_count;
@end

@interface DBDEveryMovieImagesModel : JSONModel
@property (nonatomic, copy) NSArray <PhotosModel>*photos;
@end

NS_ASSUME_NONNULL_END
