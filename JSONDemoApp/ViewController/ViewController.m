//
//  ViewController.m
//  JSONDemoApp
//
//  Created by Sania Zafar on 12/12/18.
//  Copyright © 2018 Sania Zafar. All rights reserved.
//

#import "ViewController.h"
#import "CatalogCollectionViewCell.h"
#import "Product.h"
#import "NetworkManager.h"
#import "Constants.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *catalogCollectionView;
@property (nonatomic, retain) NSMutableArray *productArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.catalogCollectionView registerNib:[UINib nibWithNibName:@"CatalogCollectionViewCell" bundle:nil]
                 forCellWithReuseIdentifier:@"catalogCell"];
    self.productArray = [[NSMutableArray alloc] init];
    [[NetworkManager sharedInstance] requestApiData:catalog completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSError *jsonError = nil;
            id responseData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
            if (!jsonError) {
                if ([responseData isKindOfClass:[NSDictionary class]]) {
                    id catalogData = [responseData objectForKey:@"data"];
                    if ([catalogData isKindOfClass:[NSArray class]]) {
                        [self convertProductDictionaryToProductArray:catalogData];
                    }
                }
            }
        }
    }];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CatalogCollectionViewCell *cell = (CatalogCollectionViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"catalogCell" forIndexPath:(NSIndexPath *)indexPath];
    Product *product = [self.productArray objectAtIndex:indexPath.row];
    cell.catalogProductName.text = [product getProductName];
    cell.catalogProductBrand.text = [product getBrandName];
    cell.catalogProductPrice.text = [product getProductPrice];
    cell.catalogProductImage.image = [UIImage imageNamed:@"product1"];
    
    return cell;
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.productArray.count;;
}


- (void)convertProductDictionaryToProductArray:(NSArray *)productDictionary {
    Product *product = [[Product alloc] init];
        for (id obj in productDictionary) {
            if([obj isKindOfClass:[NSDictionary class]]) {
                [product setCatalogProductWithName:obj];
                [_productArray addObject:product];
            }
        }
    dispatch_async(dispatch_get_main_queue(), ^{
         [self.catalogCollectionView reloadData];
    });
}

@end
