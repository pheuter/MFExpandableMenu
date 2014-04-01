//
//  CellView.m
//  MFExpandableMenu
//
//  Created by Mark Fayngersh on 3/30/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "CellView.h"

@interface CellView () {
  UILabel *_titleLabel;
}

@property(nonatomic) MASConstraint *titleConstraint;

@end

@implementation CellView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];

  if (self) {
    [self.contentView addSubview:self.titleLabel];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      self.titleConstraint = make.center.equalTo(self.contentView);
      make.width.lessThanOrEqualTo(self);
    }];
  }

  return self;
}

#pragma mark - Getters

- (UILabel *)titleLabel {
  if (!_titleLabel) {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    _titleLabel.font = [UIFont systemFontOfSize:32];
    _titleLabel.textColor = [UIColor whiteColor];
  }

  return _titleLabel;
}

#pragma mark - Setters

- (void)setTitle:(NSString *)title {
  _title = title;
  self.titleLabel.text = title;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
  _backgroundColor = backgroundColor;
  self.contentView.backgroundColor = backgroundColor;
}

#pragma mark - Methods

- (void)focusWithView:(UIView *)view {
  [self.titleConstraint uninstall];

  [self addSubview:view];
  [view mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self).insets(UIEdgeInsetsMake(CGRectGetMaxY(self.titleLabel.frame), 0, 0, 0));
  }];

  view.alpha = 0;
  view.frame = CGRectMake(0,
                          CGRectGetMaxY(self.titleLabel.frame),
                          CGRectGetWidth(self.frame),
                          CGRectGetHeight(self.frame));

  [UIView animateWithDuration:0.3f animations:^{
    view.alpha = 1;
    CGRect frame = view.frame;
    frame.origin.y *= 2;
    view.frame = frame;
  }];
}

- (void)unfocus {
  UIView *view = self.subviews.lastObject;

  [UIView animateWithDuration:0.3f
                   animations:^{
                     CGRect frame = view.frame;
                     frame.origin.y -= frame.origin.y;

                     view.alpha = 0;
                     view.frame = frame;
                   }
                   completion:^(BOOL finished) {
                     [view removeFromSuperview];
                   }];
}

@end