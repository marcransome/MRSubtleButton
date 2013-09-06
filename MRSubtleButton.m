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

static NSColor *defaultStartColor;
static NSColor *defaultEndColor;
static NSColor *defaultHighlightStartColor;
static NSColor *defaultHighlightEndColor;

@interface MRSubtleButton ()

@property (strong) NSColor *startColor;
@property (strong) NSColor *endColor;
@property (strong) NSColor *highlightStartColor;
@property (strong) NSColor *highlightEndColor;
@property (assign) BOOL selected;
@property (strong) NSFont *font;
@property (strong) NSColor *fontColor;
@property (assign) MRTitleAlignment alignment;

@end

@implementation MRSubtleButton

+ (void)initialize
{
    defaultStartColor = [NSColor colorWithCalibratedRed:233.0f/255.0f green:233.0f/255.0f blue:233.0f/255.0f alpha:1.0f];
    defaultEndColor = [NSColor colorWithCalibratedRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:1.0f];
    defaultHighlightStartColor = [NSColor colorWithCalibratedRed:184.0f/255.0f green:184.0f/255.0f blue:184.0f/255.0f alpha:1.0f];
    defaultHighlightEndColor = [NSColor colorWithCalibratedRed:228.0f/255.0f green:228.0f/255.0f blue:228.0f/255.0f alpha:1.0f];
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _title = @"";
        _alignment = MRLeftTitleAlignment;
        _startColor = defaultStartColor;
        _endColor = defaultEndColor;
        _highlightStartColor = defaultHighlightStartColor;
        _highlightEndColor = defaultHighlightEndColor;
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
    NSColor *startColorForDrawing;
    NSColor *endColorForDrawing;
    
    if (!_selected) {
        startColorForDrawing = [self startColor];
        endColorForDrawing = [self endColor];
    }
    else {
        startColorForDrawing = [self highlightStartColor];
        endColorForDrawing = [self highlightEndColor];
    }
    
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
    
    NSRect inlineInsetRect = topLineRect;
    inlineInsetRect.size.height -= 1;
    
    // inline fill
    NSGradient *inlineGradient = [[NSGradient alloc] initWithColorsAndLocations:startColorForDrawing, 0.0, endColorForDrawing, 1.0, nil];
    
    NSBezierPath *inlinePath = [NSBezierPath bezierPathWithRoundedRect:inlineInsetRect xRadius:4 yRadius:4];
    
    [inlineGradient drawInBezierPath:inlinePath angle:90];
    
    // title
    NSMutableDictionary *titleAttributes = [[NSMutableDictionary alloc] init];
    
    if (_font) {
        [titleAttributes setValue:[self font] forKey:NSFontAttributeName];
    }
    else
    {
        [titleAttributes setValue:[NSFont fontWithName:@"Helvetica" size:17] forKey:NSFontAttributeName];
    }
    
    if (_fontColor) {
        [titleAttributes setValue:[self fontColor] forKey:NSForegroundColorAttributeName];
    }
    else {
        [titleAttributes setValue:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
    }
    
    NSSize titleSize = [[self title] sizeWithAttributes:titleAttributes];
    CGFloat verticalPoint = ([self bounds].size.height / 2) - (titleSize.height / 2);
    
    CGFloat horizontalPoint;
    switch (_alignment) {
        case MRLeftTitleAlignment:
            horizontalPoint = 15.0f;
            break;
            
        case MRRightTitleAlignment:
            horizontalPoint = [self bounds].size.width - titleSize.width - 15.0f;
            break;
            
        case MRCenterTitleAlignment:
            horizontalPoint = ([self bounds].size.width / 2) - (titleSize.width / 2);
            break;
    }
    
    [[self title] drawAtPoint:NSMakePoint(horizontalPoint, verticalPoint) withAttributes:titleAttributes];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    [self setSelected:YES];
    [self setNeedsDisplay:YES];
    
    if ([_delegate respondsToSelector:@selector(subtleButtonEvent:from:)]) {
        [_delegate subtleButtonEvent:theEvent from:self];
    }
}

- (void)mouseUp:(NSEvent *)theEvent
{
    [self setSelected:NO];
    [self setNeedsDisplay:YES];
    
    if ([_delegate respondsToSelector:@selector(subtleButtonEvent:from:)]) {
        [_delegate subtleButtonEvent:theEvent from:self];
    }
}

- (void)setGradientWithStartColor:(NSColor *)startColor endColor:(NSColor *)endColor
{
    [self setStartColor:startColor];
    [self setEndColor:endColor];
    [self setNeedsDisplay:YES];
}

- (void)setHighlightGradientWithStartColor:(NSColor *)startColor endColor:(NSColor *)endColor
{
    [self setHighlightStartColor:startColor];
    [self setHighlightEndColor:endColor];
}

- (void)setFontAttributesWithFont:(NSFont *)font color:(NSColor *)fontColor
{
    [self setFont:font];
    [self setFontColor:fontColor];
    [self setNeedsDisplay:YES];
}

- (void)setTitleAlignment:(MRTitleAlignment)alignment
{
    [self setAlignment:alignment];
}

- (void)resetGradient
{
    [self setStartColor:defaultStartColor];
    [self setEndColor:defaultEndColor];
    [self setHighlightStartColor:defaultHighlightStartColor];
    [self setHighlightEndColor:defaultHighlightEndColor];    
    [self setNeedsDisplay:YES];
}

@end
