//
//  Product.h
//  JSONDemoApp
//
//  Created by Sania Zafar on 12/12/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Product : NSObject {
    NSString *sku;
    NSString *pName;
    NSString *pBrand;
    NSString *pPrice;
    NSString *pImageKey;
    NSMutableArray *pAvailableSizes;
    NSString *pDescription;
}

- (void)setCatalogProductWithName:(NSDictionary *)_catalogProduct;
- (void)setProduct:(NSString *)_pName :(NSString *)_pBrand :(NSString *)_pPrice :(NSString *)_pImageKey :(NSMutableArray *)_pAvailableSizes :(NSString *)_pDescription;
- (NSString *)getProductName;
- (NSString *)getBrandName;
- (NSString *)getProductPrice;
- (NSString *)getProductImageKey;
- (NSMutableArray *)getProductAvailableSizes;
- (NSString *)getProductDescription;

@end

