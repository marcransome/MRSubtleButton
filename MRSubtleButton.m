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

#import "MRSubtleButton.h"

@implementation MRSubtleButton

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:@""];
    }
    
    return self;
}

- (void)setTitle:(NSString *)title
{
    if (_title != title)
    {
        _title = title;
        [self setNeedsDisplay:YES];
    }
}

- (void)drawRect:(NSRect)dirtyRect
{
    CGFloat opaque = 1.0f;
    
    // outline fill
    CGFloat startOutlineRed = 195.0f/255.0f;
    CGFloat startOutlineGreen = 195.0f/255.0f;
    CGFloat startOutlineBlue = 195.0f/255.0f;
    
    CGFloat endOutlineRed = 210.0f/255.0f;
    CGFloat endOutlineGreen = 210.0f/255.0f;
    CGFloat endOutlineBlue = 210.0f/255.0f;
    
    NSColor *outlineStartColor = [NSColor colorWithCalibratedRed:startOutlineRed green:startOutlineGreen blue:startOutlineBlue alpha:opaque];
    NSColor *outlineEndColor = [NSColor colorWithCalibratedRed:endOutlineRed green:endOutlineGreen blue:endOutlineBlue alpha:opaque];
    
    NSGradient *outlineGradient = [[NSGradient alloc] initWithColorsAndLocations:outlineStartColor, 0.0, outlineEndColor, 1.0, nil];
    
    NSBezierPath *outlinePath = [NSBezierPath bezierPathWithRoundedRect:[self bounds] xRadius:5 yRadius:5];
    
    [outlineGradient drawInBezierPath:outlinePath angle:90];
    
    NSRect topLineRect = NSInsetRect([self bounds], 1, 1);
    
    // inline top white highlight
    NSBezierPath *whiteLine = [NSBezierPath bezierPathWithRoundedRect:topLineRect xRadius:5 yRadius:5];
    
    [[NSColor whiteColor] set];
    [whiteLine fill];

    // inline fill
    CGFloat startInlineRed = 233.0f/255.0f;
    CGFloat startInlineGreen = 233.0f/255.0f;
    CGFloat startInlineBlue = 233.0f/255.0f;
    
    CGFloat endInlineRed = 246.0f/255.0f;
    CGFloat endInlineGreen = 246.0f/255.0f;
    CGFloat endInlineBlue = 246.0f/255.0f;
    
    NSColor *inlineStartColor = [NSColor colorWithCalibratedRed:startInlineRed green:startInlineGreen blue:startInlineBlue alpha:opaque];
    NSColor *inlineEndColor = [NSColor colorWithCalibratedRed:endInlineRed green:endInlineGreen blue:endInlineBlue alpha:opaque];
    
    NSRect inlineInsetRect = topLineRect;
    inlineInsetRect.size.height -= 1;
    
    NSGradient *inlineGradient = [[NSGradient alloc] initWithColorsAndLocations:inlineStartColor, 0.0, inlineEndColor, 1.0, nil];
    
    NSBezierPath *inlinePath = [NSBezierPath bezierPathWithRoundedRect:inlineInsetRect xRadius:4 yRadius:4];
    
    [inlineGradient drawInBezierPath:inlinePath angle:90];
    
    // title
    NSMutableDictionary *titleAttributes = [[NSMutableDictionary alloc] init];
	[titleAttributes setValue:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
	[titleAttributes setValue:[NSFont fontWithName:@"Helvetica" size:17] forKey:NSFontAttributeName];
    
    NSSize titleSize = [[self title] sizeWithAttributes:titleAttributes];
    CGFloat verticalPoint = ([self bounds].size.height / 2) - (titleSize.height / 2);
    CGFloat horizontalPoint = 15.0f;
    
    [[self title] drawAtPoint:NSMakePoint(horizontalPoint, verticalPoint) withAttributes:titleAttributes];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    if ([_delegate respondsToSelector:@selector(subtleButtonEvent:from:)]) {
        [_delegate subtleButtonEvent:theEvent from:self];
    }
}

@end
