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
	attributes.size = self.pageSize;
	return attributes;
}

- (CGSize)pageSize {
	CGSize size = self.collectionView.bounds.size;
	size.width -= (LayoutLeftInset + LayoutRightInset);
	size.width /= 2;
	return size;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {

	CGFloat pageWidth = self.pageSize.width;


	CGFloat mod = (NSInteger)proposedContentOffset.x % (NSInteger)pageWidth;
	proposedContentOffset.x -= mod;

	if (mod > pageWidth / 2) {
		proposedContentOffset.x += pageWidth;
	}



	NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), NSStringFromCGPoint(proposedContentOffset));
	return proposedContentOffset;
}

@end
