//
//  UIColor+Colors.m
//  MFExpandableMenu
//
//  Created by Mark Fayngersh on 3/30/14.
//  Copyright (c) 2014 Mark Fayngersh. All rights reserved.
//

#import "UIColor+Colors.h"

@implementation UIColor (Colors)

+ (UIColor *)changeBrightness:(UIColor *)color amount:(CGFloat)amount {
  CGFloat hue, saturation, brightness, alpha;
  if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
    brightness += (amount - 1.0);
    brightness = MAX(MIN(brightness, 1.0), 0.0);
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
  }

  CGFloat white;
  if ([color getWhite:&white alpha:&alpha]) {
    white += (amount - 1.0);
    white = MAX(MIN(white, 1.0), 0.0);
    return [UIColor colorWithWhite:white alpha:alpha];
  }

  return nil;
}

@end
