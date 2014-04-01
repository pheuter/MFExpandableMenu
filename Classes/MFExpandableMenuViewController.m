//
//  MFExpandableMenuViewController.m
//  MFExpandableMenu
//
//  Created by Mark Fayngersh on 3/30/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "MFExpandableMenuViewController.h"
#import "CellView.h"
#import "UIColor+Colors.h"

@interface MFExpandableMenuViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
  UICollectionViewFlowLayout *_listFlowLayout;
  UICollectionViewFlowLayout *_detailFlowLayout;
  UICollectionView *_collectionView;
}

@property(readonly) UICollectionViewFlowLayout *listFlowLayout;
@property(readonly) UICollectionViewFlowLayout *detailFlowLayout;
@property(readonly) UICollectionView *collectionView;
@property NSInteger selectedCellIndex;

@end

@implementation MFExpandableMenuViewController

- (id)init {
  self = [super init];

  if (self) {
    if (!self.customBackgroundFadeColor) {
      self.customBackgroundFadeColor = [UIColor grayColor];
    }
  }

  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.selectedCellIndex = -1;
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.navigationController.navigationBarHidden = YES;

  [self.view addSubview:self.collectionView];

  [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.view);
  }];
}

#pragma mark - Getters

- (UICollectionViewFlowLayout *)listFlowLayout {
  if (!_listFlowLayout) {
    _listFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    _listFlowLayout.minimumLineSpacing = 0;
  }

  return _listFlowLayout;
}

- (UICollectionViewFlowLayout *)detailFlowLayout {
  if (!_detailFlowLayout) {
    _detailFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    _detailFlowLayout.minimumLineSpacing = 0;
  }

  return _detailFlowLayout;
}

- (UICollectionView *)collectionView {
  if (!_collectionView) {
    _collectionView = [[UICollectionView alloc]
                                         initWithFrame:CGRectZero
                                  collectionViewLayout:self.listFlowLayout];
    [_collectionView registerClass:[CellView class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
  }

  return _collectionView;
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return [self.dataSource numberOfItemsInMenuViewController:self];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                             forIndexPath:indexPath];

  if (self.customMenuItemFont)
    cell.titleLabel.font = self.customMenuItemFont;

  if (self.customMenuItemTextColor)
    cell.titleLabel.textColor = self.customMenuItemTextColor;

  NSInteger numItems = [self.dataSource numberOfItemsInMenuViewController:self];
  NSInteger inc;

  if (numItems < 5) {
    inc = 2;
  } else {
    inc = 1;
  }

  CGFloat amount = [[NSString stringWithFormat:@"1.%d", (indexPath.row * inc)] floatValue];
  cell.backgroundColor = [UIColor changeBrightness:self.customBackgroundFadeColor amount:amount];
  cell.title = [self.dataSource menuViewController:self
                           titleForMenuItemAtIndex:indexPath.row];

  return cell;
}

#pragma mark - UICollectionViewDelegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  CellView *cell = (CellView *) [self.collectionView cellForItemAtIndexPath:indexPath];

  if (self.selectedCellIndex == indexPath.row) {
    self.selectedCellIndex = -1;
    [cell unfocus];
    [collectionView setCollectionViewLayout:self.listFlowLayout animated:YES];
    return;
  }

  self.selectedCellIndex = indexPath.row;

  [cell focusWithView:[self.dataSource menuViewController:self
                             detailViewForMenuItemAtIndex:self.selectedCellIndex]];
  [collectionView setCollectionViewLayout:self.detailFlowLayout animated:YES];
  collectionView.scrollEnabled = NO;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  if ([collectionViewLayout isEqual:self.listFlowLayout]) {
    NSInteger numberOfItems = [self.dataSource numberOfItemsInMenuViewController:self];
    return CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / numberOfItems);
  } else {
    return CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
  }
}

@end