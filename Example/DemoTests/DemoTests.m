//
//  DemoTests.m
//  DemoTests
//
//  Created by Mark Fayngersh on 3/31/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <Specta/Specta.h>

#define EXP_SHORTHAND

#import <Expecta/Expecta.h>

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>

#import <MFExpandableMenu/MFExpandableMenuViewController.h>

SpecBegin(MFExpandableMenu)

    describe(@"MFExpandableMenuViewController", ^{
      __block id <MFExpandableMenuDelegate> delegate = mockProtocol(@protocol(MFExpandableMenuDelegate));
      __block id <MFExpandableMenuDataSource> dataSource = mockProtocol(@protocol(MFExpandableMenuDataSource));
      __block MFExpandableMenuViewController *menuViewController;

      beforeEach(^{
        menuViewController = [[MFExpandableMenuViewController alloc] init];
        menuViewController.view;
      });

      it(@"should initialize with default values", ^{
        expect(menuViewController.customBackgroundFadeColor).to.equal([UIColor grayColor]);
      });
    });

    SpecEnd
