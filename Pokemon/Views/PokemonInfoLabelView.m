//
//  UnifiedStyleLabelView.m
//  Pokemon
//
//  Created by Kaijie Yu on 2/22/12.
//  Copyright (c) 2012 Kjuly. All rights reserved.
//

#import "PokemonInfoLabelView.h"

#import "GlobalRender.h"

@implementation PokemonInfoLabelView

@synthesize name  = name_;
@synthesize value = value_;

- (void)dealloc
{
  [name_ release];
  [value_ release];
  
  [super dealloc];
}

- (id)initWithFrame:(CGRect)frame hasValueLabel:(BOOL)hasValueLabel
{
  self = [self initWithFrame:frame];
  if (self) {
    CGFloat const labelHeight = frame.size.height;
    CGFloat labelWidth  = 80.0f;
    
    name_ = [[UILabel alloc] init];
    [name_ setBackgroundColor:[UIColor clearColor]];
    [name_ setTextColor:[GlobalRender textColorBlue]];
    [name_ setFont:[GlobalRender textFontBoldInSizeOf:16.0f]];
    [name_ setTextAlignment:UITextAlignmentRight];
    [self addSubview:name_];
    
    if (hasValueLabel) {
      CGFloat const valueHeight = labelHeight;
      CGFloat const valueWidth  = frame.size.width - labelWidth;
      
      value_ = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth, 0.0f, valueWidth, valueHeight)];
      [value_ setBackgroundColor:[UIColor clearColor]];
      [value_ setFont:[GlobalRender textFontBoldInSizeOf:16.0f]];
      [value_ setTextAlignment:UITextAlignmentLeft];
      [self addSubview:value_];
    }
    else labelWidth = frame.size.width;
    
    [name_ setFrame:CGRectMake(0.0f, 0.0f, labelWidth, labelHeight)];
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame {
  return [super initWithFrame:frame];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)hideValueLabel
{
  [self.name setFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height)];
  self.value = nil;
}

@end
