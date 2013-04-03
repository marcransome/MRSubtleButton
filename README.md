##MRSubtleButton
A subtle gradient button, derived from NSView.  No images involved.

Example buttons with custom colours:

![Button preview](http://www.fidgetbox.co.uk/mrsubtlebutton2.png)

##Usage
MRSubtleButton can be integrated into an existing project using [CocoaPods](http://cocoapods.org). Simply add the necessary dependency to your `Podfile` as follows:

```ruby
platform :osx, '10.7'
pod 'MRSubtleButton'
...
```

Run `pod install` to install.

Next, drag a custom view from the object library in Xcode into your UI, and change its class to MRSubtleButton.

Create an outlet for the button and implement the `<MRSubtleButtonDelegate>` protocol in your controller with the following method (don't forget to `#import <MRSubtleButton.h>` in your controller):

```objc
- (void)MRSubtleButtonEvent:(NSEvent *)event with:(id)sender;
```

Finally, set the button's delegate to your controller object: `[button setDelegate:self]` and give the button a title: `[button setTitle:@"Hello World!"]`.

If you have more than one button with the same delegate you can determine which button was pressed by inspecting its title:

```objc
- (void)MRSubtleButtonEvent:(NSEvent *)event with:(id)sender
{
  // assuming sender is of class MRSubtleButton
  if ([[sender title] isEqualToString:@"Hello World!"])
  {
    // your button event implementation
  }
}
```

##Custom colours and fonts
Each button's gradient colour and font attributes (both colour and size) are adjustable.  Setting the button's colour is as easy as specifying a start and end colour for the gradient (note that the gradient starts at the bottom of the button):

```objc
NSColor *start = [NSColor colorWithCalibratedRed:205.0f/255.0f green:183.0f/255.0f blue:158.0f/255.0f alpha:1.0f];
NSColor *end = [NSColor colorWithCalibratedRed:255.0f/255.0f green:239.0f/255.0f blue:213.0f/255.0f alpha:1.0f];

[[self button] setGradientWithStartColor:start endColor:end];
```

A subtle gradient works best, with an end colour that is just a few shades lighter than the start colour.  To reset a button to the default light grey gradient use: `[button resetGradient]`.
 
Adjusting a button's font attributes is just as easy:


```objc
NSFont *buttonFont = [NSFont fontWithName:@"Helvetica" size:18.0f];
NSColor *buttonFontColor = [NSColor colorWithCalibratedRed:139.0f/255.0f green:136.0f/255.0f blue:120.0f/255.0f alpha:1.0f]; 
    
[[self button] setFontAttributesWithFont:buttonFont color:buttonFontColor];

[[self button] setTitle:@"Customised button"];
```

An example using the preceding code:

![Customised button](http://fidgetbox.co.uk/example_button.png)

##Caveats
Please note that the source code uses ARC (Automatic Reference Counting) and has only been tested against 10.7 and 10.8 deployment targets.

##License
`MRSubtleButton` is provided under the terms of the [MIT License](http://opensource.org/licenses/mit-license.php).

##Comments or suggestions?
Email me at [marc.ransome@fidgetbox.co.uk](mailto://marc.ransome@fidgetbox.co.uk) with bugs, feature requests or general comments and follow [@marcransome](http://www.twitter.com/marcransome) for updates.
