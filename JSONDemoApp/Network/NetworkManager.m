//
//  NetworkManager.m
//  JSONDemoApp
//
//  Created by Sania Zafar on 12/12/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import "NetworkManager.h"
#import "Constants.h"

@implementation NetworkManager


static NetworkManager *networkManager =  nil;


+ (NetworkManager *)sharedInstance {
    static dispatch_once_t _dispatch;
    static NetworkManager *sharedInstance = nil;
    dispatch_once(&_dispatch,
                  ^{
                      sharedInstance = [[self alloc] init];
                  });
    
    return sharedInstance;
}


- (void)requestApiData:(NSString *)endPoint completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    NSString *urlString = [BASE_URL stringByAppendingString:endPoint];
    NSURL *url = [NSURL URLWithString:urlString];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        completionHandler(data,response,error);
    }] resume];
}

@end
