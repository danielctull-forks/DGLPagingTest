//
//  ViewController.m
//  DGLPagingTest
//
//  Created by Duncan Lowrie on 12/03/2015.
//  Copyright (c) 2015 Duncan Lowrie. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController

#pragma mark - Collection View Delegate / Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

	if (section == 2) {
		return 1;
	}

	return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
	cell.text = [NSString stringWithFormat:@"(%@, %@)", @(indexPath.section), @(indexPath.item)];
	return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"selected section: %@, item: %@", @(indexPath.section), @(indexPath.item));
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//	CGSize size = collectionView.bounds.size;
//	size.width /= 2;
//	return size;
//}

//
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    
//    CGFloat cellWidth = 300.0;
//    CGFloat cellSpacing = 10.0;
//    CGFloat sectionWidth = 2 * cellWidth + cellSpacing;
//    CGFloat margin = (collectionView.frame.size.width * 0.5)-(sectionWidth * 0.5);
//    
//    UIEdgeInsets insets;
//    if(section == 0){ //first
//        insets = UIEdgeInsetsMake(0.0, margin, 0.0, 0.0);
//    }else if(section == 2){  //last
//        insets = UIEdgeInsetsMake(0.0, cellSpacing, 0.0, margin);
//    }else{
//        insets = UIEdgeInsetsMake(0.0, cellSpacing, 0.0, 0.0);
//    }
//    return insets;
//}



@end
