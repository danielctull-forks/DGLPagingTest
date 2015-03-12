//
//  Cell.m
//  DGLPagingTest
//
//  Created by Daniel Tull on 12.03.2015.
//  Copyright (c) 2015 Duncan Lowrie. All rights reserved.
//

#import "Cell.h"

@interface Cell ()
@property (nonatomic, weak) IBOutlet UILabel *label;
@end

@implementation Cell

- (void)setText:(NSString *)text {
	_text = [text copy];
	self.label.text = _text;
}

@end
