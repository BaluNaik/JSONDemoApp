//
//  Product.m
//  JSONDemoApp
//
//  Created by Sania Zafar on 12/12/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import "Product.h"

@implementation Product

- (void)setCatalogProductWithName:(NSDictionary *)_catalogProduct {
    if([_catalogProduct isKindOfClass:[NSDictionary class]]) {
        pImageKey = [_catalogProduct objectForKey:@"sku"];
        pName = [_catalogProduct objectForKey:@"name"];
        pBrand = [[_catalogProduct objectForKey:@"brand"] objectForKey:@"name"];
        pPrice = [@"AED " stringByAppendingString:[[_catalogProduct objectForKey:@"price"] stringValue]];
        pImageKey = [_catalogProduct objectForKey:@"image_key"];
    }
}


- (void)setProduct:(NSString *)_pName :(NSString *)_pBrand :(NSString *)_pPrice :(NSString *)_pImageKey :(NSMutableArray *)_pAvailableSizes :(NSString *)_pDescription {
    pName = _pName;
    pBrand = _pBrand;
    pPrice = _pPrice;
    pImageKey = _pImageKey;
    pAvailableSizes = _pAvailableSizes;
    pDescription = _pDescription;
}


- (NSString *)getProductName {
    
    return pName;
}


- (NSString *)getBrandName {
    
    return pBrand;
}


- (NSString *)getProductPrice {
    
    return pPrice;
}


- (NSString *)getProductImageKey {
    
    return pImageKey;
}


- (NSMutableArray *)getProductAvailableSizes {
    
    return pAvailableSizes;
}


- (NSString *)getProductDescription {
    
    return pDescription;
}

@end
