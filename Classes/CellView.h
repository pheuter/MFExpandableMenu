//
//  CellView.h
//  MFExpandableMenu
//
//  Created by Mark Fayngersh on 3/30/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellView : UICollectionViewCell

@property(nonatomic) NSString *title;
@property(nonatomic, copy) UIColor *backgroundColor;
@property(readonly) UILabel *titleLabel;

- (void)focusWithView:(UIView *)view;

- (void)unfocus;

@end