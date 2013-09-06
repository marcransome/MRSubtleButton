// Copyright (c) 2013 Marc Ransome <marc.ransome@fidgetbox.co.uk>
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

#import <Cocoa/Cocoa.h>

typedef enum {
    MRLeftTitleAlignment,
    MRRightTitleAlignment,
    MRCenterTitleAlignment
} MRTitleAlignment;

/** The `MRSubtleButtonDelegate` protocol defines the single method
 * subtleButtonEvent:from: for delegates of MRSubtleButton objects.
 */
@protocol MRSubtleButtonDelegate <NSObject>

/** This method is called when a mouse-down or mouse-up event occurs.
 *
 * @param event The event that occured.
 * @param sender The object that sent the event.
*/
- (void)subtleButtonEvent:(NSEvent *)event from:(id)sender;

@end

/** The `MRSubtleButton` class draws a button-like view with a gradient and
 * title.
 */
@interface MRSubtleButton : NSView

/** The button's title. */
@property (nonatomic, strong) NSString *title;

/** The button's delegate object. The delegate must conform to the
 * MRSubtleButtonDelegate Protocol and will receive messages when the button
 * generates mouse-down and mouse-up events.
 */
@property (weak) id<MRSubtleButtonDelegate> delegate;

/** Sets the start and end colour of the button's gradient. The gradient is 
 * linear and starts at the bottom edge of the button.
 *
 * @param startColor The start colour of the button's gradient.
 * @param endColor The end colour of the button's gradient.
 */
- (void)setGradientWithStartColor:(NSColor *)startColor endColor:(NSColor *)endColor;

/** Sets the start and end colour of the button's highlight gradient. The
 * highlight gradient is shown when the button is clicked with the mouse. The
 * gradient is linear and starts at the bottom edge of the button.
 *
 * @param startColor The start colour of the button's highlight gradient.
 * @param endColor The end colour of the button's highlight gradient.
 */
- (void)setHighlightGradientWithStartColor:(NSColor *)startColor endColor:(NSColor *)endColor;

/** Sets the font and colour of the receiver's title using `NSFont` and
 * `NSColor` objects.
 *
 * @param font The font applied to the button's title.
 * @param fontColor The colour applied to the button's title.
 */
- (void)setFontAttributesWithFont:(NSFont *)font color:(NSColor *)fontColor;

/** Sets the button's text alignment.
 *
 * @param alignment The text alignment of the button's title.
 */
- (void)setTitleAlignment:(MRTitleAlignment)alignment;

/** This method resets the button's gradient colours to their defaults. */
- (void)resetGradient;

@end
