# MFExpandableMenu

MFExpandableMenu is an expandable menu for iOS 7 with transitions and styling.

- Automatically lighten menu items given base color
- Simple delegation leveraging UICollectionView under the hood
- Customizable fonts and colors
- Render any UIView as the menu item "detail view"

## Installation

**Note: Currently not yet pushed to CocoaPods repo**

MFExpandableMenu is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "MFExpandableMenu", "~> 0.0.1"

## Demo

You can find the sample project in **Example/Demo**

![DemoGif](https://dl.dropboxusercontent.com/u/1803181/ExpandableMenuGif.gif)

## Usage

Displaying menu containing 4 items

- `MFExpandableMenuDataSource` - Used to determine amount and content of items in the menu
- `MFExpandableMenuDelegate` - Provides callbacks when menu items are selected

```objective-c
#import <MFExpandableMenu/MFExpandableMenuViewController.h>

@interface ViewController : UIViewController <MFExpandableMenuDataSource, MFExpandableMenuDelegate>
```

In the implementation:

```objective-c
MFExpandableMenuViewController *menuViewController = [[MFExpandableMenuViewController alloc] init];

// Custom background fade color
menuViewController.customBackgroundFadeColor = [UIColor purpleColor];

// Assign dataSource and delegate properties
menuViewController.dataSource = self;
menuViewController.delegate = self;

// Show the menu
[self presentViewController:menuViewController animated:YES completion:nil];
```

Required `dataSource` methods:

```objective-c
- (NSInteger)numberOfItemsInMenuViewController:(MFExpandableMenuViewController *)menuViewController {
  return 4;
}

- (NSString *)menuViewController:(MFExpandableMenuViewController *)menuViewController
         titleForMenuItemAtIndex:(NSInteger)index1 {
  return [NSString stringWithFormat:@"Menu Item %d", index1 + 1];
}

- (UIView *)menuViewController:(MFExpandableMenuViewController *)menuViewController
  detailViewForMenuItemAtIndex:(NSInteger)index1 {
  return someUIView;
}
```

Optional `delegate` methods:

```objective-c
- (void)          menuViewController:(MFExpandableMenuViewController *)menuViewController
willShowDetailViewForMenuItemAtIndex:(NSInteger)index {
  NSLog(@"Showing detail view for menu item at index: %i", index);
}

- (void)          menuViewController:(MFExpandableMenuViewController *)menuViewController
willHideDetailViewForMenuItemAtIndex:(NSInteger)index {
  NSLog(@"Hiding detail view for menu item at index: %i", index);
}
```

## Customization

The following `MFExpandableMenuViewController` properties can be customized:

- `UIFont *customMenuItemFont` - The font to use for the menu item labels
- `UIColor *customMenuItemTextColor` - The color to use for the menu item labels
- `UIColor *customBackgroundFadeColor` - The color to use for the initial menu item background color that will automatically lighten across subsequent items

## Testing

To run the unit test suite:

    $ cd Example
    $ make install
    $ make ci

## Author

Mark Fayngersh, phunny.phacts@gmail.com

## License

MFExpandableMenu is available under the MIT license. See the LICENSE file for more info.

