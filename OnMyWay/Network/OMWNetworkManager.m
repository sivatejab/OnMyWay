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

-(void) queryPlacesOfInterestWithUserLocation:(CLLocationCoordinate2D)userLocation withType:(NSString*)type inRadius:(int)radius{
    // Build the url string to send to Google. NOTE: The kGOOGLE_API_KEY is a constant that should contain your own API key that you obtain from Google. See this link for more info:
    // https://developers.google.com/maps/documentation/places/#Authentication
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%@&types=%@&sensor=true&key=%@", userLocation.latitude, userLocation.longitude, [NSString stringWithFormat:@"%i", radius], type, kAPIKey];
    
    //Formulate the string as a URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
    // Retrieve the results of the URL.
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data
                          
                          options:kNilOptions
                          error:&error];
    
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"results"];
    
    //Write out the data to the console.
    NSLog(@"Google Data: %@", places);
}


@end
