## MRSubtleButton

[![Version](https://img.shields.io/cocoapods/v/MRSubtleButton.svg?style=flat)](http://cocoadocs.org/docsets/MRSubtleButton) [![Platform](https://img.shields.io/cocoapods/p/MRSubtleButton.svg?style=flat)](http://cocoadocs.org/docsets/MRSubtleButton)

A subtle gradient button derived from NSView.

Here are some examples using custom fonts and gradients:

<img src="https://www.fidgetbox.co.uk/github/mrsubtlebutton.png" alt="Button preview" width="442">

## Usage
MRSubtleButton can be integrated into an existing project using [CocoaPods](http://cocoapods.org). Simply add the necessary dependency to your `Podfile` as follows:

```ruby
platform :osx, '10.7'
pod 'MRSubtleButton'
...
```

Run `pod install` to install.

Next, drag a custom view from the object library in Xcode into your UI, and change its class to `MRSubtleButton`.

Create an outlet for the button and give the button a title: `[button setTitle:@"Hello World!"]`.


## Responding to events
Implement the `MRSubtleButtonDelegate` protocol in your controller with the following method (don't forget to `#import <MRSubtleButton.h>` in your controller):

```objc
- (void)subtleButtonEvent:(NSEvent *)event with:(id)sender;
```

Set the button's delegate to your controller object: `[button setDelegate:self]`.

Determine the type of event that occured by inspecting the `event` object's `type` in your delegate method and respond accordingly:

```objc
- (void)subtleButtonEvent:(NSEvent *)event with:(id)sender
{
  if ([event type] == NSLeftMouseDown) {
    // the left mouse button was pressed
  }
  else if ([event type] == NSLeftMouseUp) {
    // the left mouse button was released
  }
}
```

If you have more than one button with the same delegate you can determine which button generated the event by pointer comparison:

```objc
if (sender == [self button])
{
  // your button event implementation
}
```

## Custom colours and fonts
The button's gradient and font attributes (both colour and size) can be adjusted.  Setting the button's gradient is as easy as specifying a start and end colour (the gradient starts at the bottom edge of the button):

```objc
NSColor *start = [NSColor colorWithCalibratedRed:205.0f/255.0f green:183.0f/255.0f blue:158.0f/255.0f alpha:1.0f];
NSColor *end = [NSColor colorWithCalibratedRed:255.0f/255.0f green:239.0f/255.0f blue:213.0f/255.0f alpha:1.0f];

[[self button] setGradientWithStartColor:start endColor:end];
```

A subtle gradient works best, with an end colour that is just a few shades lighter than the start colour.

The button's highlight gradient&mdash;shown momentarily when the button is clicked&mdash; can be adjusted using the following method:

```objc
(void)setHighlightGradientWithStartColor:(NSColor *)startColor endColor:(NSColor *)endColor;
```
 
Adjusting a button's font attributes is just as easy:

```objc
NSFont *buttonFont = [NSFont fontWithName:@"Helvetica" size:18.0f];
NSColor *buttonFontColor = [NSColor colorWithCalibratedRed:139.0f/255.0f green:136.0f/255.0f blue:120.0f/255.0f alpha:1.0f]; 
    
[[self button] setFontAttributesWithFont:buttonFont color:buttonFontColor];

[[self button] setTitle:@"Customised button"];
```

## Title alignment

Control the title text alignment using `setTitleAlignment:` and one of the three constants `MRLeftTitleAlignment`, `MRRightTitleAlignment` and `MRCenterTitleAlignment`:

```objc
[[self button] setTitleAlignment:MRCenterTitleAlignment];
```

## Caveats
The source code for `MRSubtleButton` uses Automatic Reference Counting and has been tested against 10.7 through 10.10 deployment targets.

## License
`MRSubtleButton` is provided under the terms of the [MIT License](http://opensource.org/licenses/mit-license.php).

## Contact
Email me at [marc.ransome@fidgetbox.co.uk](mailto:marc.ransome@fidgetbox.co.uk) or [create an issue](https://github.com/marcransome/MRSubtleButton/issues).
