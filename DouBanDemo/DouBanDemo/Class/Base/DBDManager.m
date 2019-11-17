//
//  DBDManager.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/22.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDManager.h"
#import "DBDMovieModel.h"
static DBDManager *manager = nil;
@implementation DBDManager
+ (instancetype)sharedLeton {
    if (!manager){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [DBDManager new];
        });
    }
    return manager;
}
//https://api.douban.com
- (void)netWorkWithNumber:(NSInteger)number succeed:(AllMovieHandle)successblock error:(ErrorHandle)errorblock {
    NSString *string = @"https://douban-api.uieee.com/v2/movie/in_theaters";
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            DBDMovieModel *allMovieModel = [[DBDMovieModel alloc] initWithDictionary:dict error:&err];
          
            successblock(allMovieModel);
        } else {
            errorblock(error);
        }
    }];
    [dataTask resume];
}
- (void)netWorkFetureMovieSuccess:(FutureMovieHandle)successblock error:(ErrorHandle)errorblock {
    NSString *string = @"https://douban-api.uieee.com/v2/movie/coming_soon";
       NSURL *url = [NSURL URLWithString:string];
       NSURLRequest *request = [NSURLRequest requestWithURL:url];
       NSURLSession *session = [NSURLSession sharedSession];
       NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           if (error == nil) {
               
               NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               NSError *err = nil;
               DBDFutureMovie *futureMovieModel = [[DBDFutureMovie alloc] initWithDictionary:dict error:&err];
             
               successblock(futureMovieModel);
           } else {
               errorblock(error);
           }
       }];
       [dataTask resume];
}
- (void)netWorkOfWishWithID:(NSString *)ID  success:(WishMovieHandle)successBlock error:(ErrorHandle)errorBlock {
    NSString *string =[NSString stringWithFormat:@"https://douban-api.uieee.com/v2/movie/subject/%@",ID];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            DBDWishModel *wishModel = [[DBDWishModel alloc] initWithDictionary:dict error:&err];
          
            successBlock(wishModel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
    
}
- (void)netWorkOfEveryMovieWithID:(NSString *)ID success:(EveryMovieHandle)successBlock error:(ErrorHandle)errorBlock {
    NSString *string =[NSString stringWithFormat:@"https://douban-api.uieee.com/v2/movie/subject/%@",ID];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            DBDEveryMovieModel *everyMovieModel = [[DBDEveryMovieModel alloc] initWithDictionary:dict error:&err];
          
            successBlock(everyMovieModel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];

}

- (void)everyMoviewImagesWithID:(NSString *)ID success:(EveryMovieImageHandle)successBlock error:(ErrorHandle)errorBlock  {
    NSString *string =[NSString stringWithFormat:@"https://douban-api.uieee.com/v2/movie/subject/%@/photos",ID];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            DBDEveryMovieImagesModel *everyImagesModel = [[DBDEveryMovieImagesModel alloc] initWithDictionary:dict error:&err];
          
            successBlock(everyImagesModel);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
    
}
@end
