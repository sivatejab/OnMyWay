//
//  ONWNetworkManager.h
//  OnMyWay
//
//  Created by Siva Teja on 27/05/15.
//  Copyright (c) 2015 Siva. All rights reserved.
//


@interface OMWNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedNetworkManager;
-(void) queryPlacesOfInterestWithUserLocation:(CLLocationCoordinate2D)userLocation withType:(NSString*)type inRadius:(int)radius;
@end
