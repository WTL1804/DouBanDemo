//
//  DBDManager.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/22.
//  Copyright © 2019 王天亮. All rights reserved.
//
#import <Foundation/Foundation.h>
//#include "DBDManager.h"
#import "DBDMovieModel.h"
#import "DBDFutureMovie.h"
#import "DBDWishModel.h"
#import "DBDEveryMovieModel.h"
#import "DBDEveryMovieImagesModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^AllMovieHandle)(DBDMovieModel *allMovieModel);
typedef void(^ErrorHandle)(NSError *error);

typedef void(^FutureMovieHandle)(DBDFutureMovie *futureModel);
typedef void(^WishMovieHandle)(DBDWishModel *wishModel);
typedef void(^EveryMovieHandle)(DBDEveryMovieModel *everyModel);
typedef void(^EveryMovieImageHandle)(DBDEveryMovieImagesModel *everyImageModel);

@interface DBDManager : NSObject

- (void)netWorkWithNumber:(NSInteger)number  succeed:(AllMovieHandle)successblock error: (ErrorHandle)errorblock;
+ (instancetype)sharedLeton;
- (void)netWorkFetureMovieSuccess:(FutureMovieHandle)successblock error:(ErrorHandle)errorblock;
- (void)netWorkOfWishWithID:(NSString *)ID success:(WishMovieHandle)successBlock error: (ErrorHandle)errorBlock;
- (void)netWorkOfEveryMovieWithID:(NSString *)ID success:(EveryMovieHandle)successBlock error:(ErrorHandle)errorBlock;
- (void)everyMoviewImagesWithID:(NSString *)ID success:(EveryMovieImageHandle)successBlock error:(ErrorHandle)errorBlock;
@end

NS_ASSUME_NONNULL_END
