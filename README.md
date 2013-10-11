## MRSubtleButton
A subtle gradient button, derived from NSView.  No images involved.

Example buttons with custom colours:

![Button preview](http://www.fidgetbox.co.uk/mrsubtlebutton2.png)

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
- (void)MRSubtleButtonEvent:(NSEvent *)event with:(id)sender;
```

Set the button's delegate to your controller object: `[button setDelegate:self]`.

Determine the type of event that occured by inspecting the `event` object's `type` in your delegate method and respond accordingly:

```objc
- (void)MRSubtleButtonEvent:(NSEvent *)event with:(id)sender
{
  if ([event type] == NSLeftMouseDown) {
    // the left mouse button was pressed
  }
  else if ([event type] == NSLeftMouseUp) {
    // the left mouse button was released
  }
}
```

If you have more than one button with the same delegate you can determine which button generated the event by inspecting its title:

```objc
if ([[sender title] isEqualToString:@"Hello World!"])
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

An example using the preceding code:

![Customised button](http://fidgetbox.co.uk/example_button.png)

## Caveats
Please note that the source code uses ARC (Automatic Reference Counting) and has only been tested against 10.7 and 10.8 deployment targets.

## License
`MRSubtleButton` is provided under the terms of the [MIT License](http://opensource.org/licenses/mit-license.php).

## Contact
Email me at [marc.ransome@fidgetbox.co.uk](mailto:marc.ransome@fidgetbox.co.uk) or tweet [@marcransome](http://www.twitter.com/marcransome).
