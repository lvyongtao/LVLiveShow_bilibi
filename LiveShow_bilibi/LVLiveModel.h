//
//  LVLiveModel.h
//  LiveShow_bilibi
//
//  Created by lvyongtao on 16/10/25.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LVCreatorItem.h"

@interface LVLiveModel : NSObject
/** 直播流地址 */
@property (nonatomic, copy) NSString *stream_addr;
/** 关注人 */
@property (nonatomic, assign) NSUInteger online_users;
/** 城市 */
@property (nonatomic, copy) NSString *city;
/** 主播 */
@property (nonatomic, strong) LVCreatorItem *creator;
@end
