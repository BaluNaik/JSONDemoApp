//
//  CatalogCollectionViewCell.h
//  JSONDemoApp
//
//  Created by Sania Zafar on 12/16/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CatalogCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *catalogProductImage;
@property (weak, nonatomic) IBOutlet UILabel *catalogProductBrand;
@property (weak, nonatomic) IBOutlet UILabel *catalogProductName;
@property (weak, nonatomic) IBOutlet UILabel *catalogProductPrice;

@end
