//
//  UIColor+Colors.h
//  MFExpandableMenu
//
//  Created by Mark Fayngersh on 3/30/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Colors)

/**
* http://stackoverflow.com/a/14534840/137100
*
* @param color  The UIColor to change brightness of
* @param amount 1.1 will increase the brightness by 10%; 0.9 will decrease the brightness by 10%
*/
+ (UIColor *)changeBrightness:(UIColor *)color amount:(CGFloat)amount;

@end
