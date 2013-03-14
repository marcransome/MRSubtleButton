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

Finally, create an outlet for the button and set its title by sending it a message such as `[button setTitle:@"hello world"]`.

##Caveats
Please note that the source code uses ARC (Automatic Reference Counting) and has only been tested against 10.7 and 10.8 deployment targets.

##License
`MRSubtleButton` is provided under the terms of the [MIT License](http://opensource.org/licenses/mit-license.php).

##Comments or suggestions?
Email me at [marc.ransome@fidgetbox.co.uk](mailto://marc.ransome@fidgetbox.co.uk) with bugs, feature requests or general comments and follow [@marcransome](http://www.twitter.com/marcransome) for updates.
