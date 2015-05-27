//
//  ONWNetworkManager.m
//  OnMyWay
//
//  Created by Siva Teja on 27/05/15.
//  Copyright (c) 2015 Siva. All rights reserved.
//

#import "OMWNetworkManager.h"

@implementation OMWNetworkManager


+ (instancetype)sharedNetworkManager {
    static OMWNetworkManager *sharedNetworkManagerInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNetworkManagerInstance = [[OMWNetworkManager alloc] init];
        sharedNetworkManagerInstance.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return sharedNetworkManagerInstance;
}




@end
