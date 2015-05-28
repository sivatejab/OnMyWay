//
//  RootViewController.m
//  OnMyWay
//
//  Created by Siva Teja on 28/05/15.
//  Copyright (c) 2015 Siva. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

@implementation RootViewController

- (IBAction)searchBtnAction:(id)sender {
    [[OMWNetworkManager sharedNetworkManager] queryPlacesOfInterestWithUserLocation:CLLocationCoordinate2DMake(12.969011, 77.750930) withType:@"cafe" inRadius:5000];
}
@end
