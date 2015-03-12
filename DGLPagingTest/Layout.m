//
//  Layout.m
//  DGLPagingTest
//
//  Created by Daniel Tull on 12.03.2015.
//  Copyright (c) 2015 Duncan Lowrie. All rights reserved.
//

#import "Layout.h"

static CGFloat const LayoutLeftInset = 150.0f;
static CGFloat const LayoutRightInset = 150.0f;

@implementation Layout

- (void)prepareLayout {

	UIEdgeInsets insets = self.collectionView.contentInset;
	insets.left = LayoutLeftInset;
	insets.right = LayoutRightInset;
	self.collectionView.contentInset = insets;

	insets = self.collectionView.scrollIndicatorInsets;
	insets.left = LayoutLeftInset;
	insets.right = LayoutRightInset;
	self.collectionView.scrollIndicatorInsets = insets;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {

	NSMutableArray *attributes = [NSMutableArray new];

	UICollectionView *collectionView = self.collectionView;
	id<UICollectionViewDataSource> dataSource = collectionView.dataSource;

	NSInteger numberOfSections = [dataSource numberOfSectionsInCollectionView:collectionView];
	for (NSInteger section = 0; section < numberOfSections; section++) {
		NSInteger numberOfItems = [dataSource collectionView:self.collectionView numberOfItemsInSection:section];
		for (NSInteger item = 0; item < numberOfItems; item++) {
			NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
			UICollectionViewLayoutAttributes *layoutAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
			[attributes addObject:layoutAttributes];
		}
	}

	return attributes;

}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {

	UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];

	CGSize size = self.collectionView.bounds.size;
	size.width -= (LayoutLeftInset + LayoutRightInset);
	size.width /= 2;
	attributes.size = size;

	NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), NSStringFromCGSize(size));

	return attributes;
}

//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
//	return proposedContentOffset;
//}

@end
