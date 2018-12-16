//
//  NetworkManager.h
//  JSONDemoApp
//
//  Created by Sania Zafar on 12/12/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NetworkManager : NSObject

+ (NetworkManager *)sharedInstance;

- (void)requestApiData:(NSString *)endPoint completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

@end
