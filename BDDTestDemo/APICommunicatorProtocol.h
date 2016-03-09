//
//  APICommunicatorProtocol.h
//  BDDTestDemo
//
//  Created by vincent on 16/3/9.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonInfo.h"

@protocol APICommunicatorProtocol <NSObject>

- (NSArray *)getPeople;
- (void)postPerson:(PersonInfo *)personInfo error:(NSError **)error;

@end
