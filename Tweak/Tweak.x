#import <UIKit/UIKit.h>
#import "SBControlCenterWindow.h"

BOOL ccOpen = false;
BOOL Enabled = false;
float timesl = 2;
NSTimeInterval timeg;

static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.github.airketchplayz.rainbowccswitchesprefs.plist"];
    if(prefs)
    {
        Enabled = ( [prefs objectForKey:@"Enabled"] ? [[prefs objectForKey:@"Enabled"] boolValue] : Enabled );
		timesl = ( [prefs objectForKey:@"time"] ? [[prefs objectForKey:@"time"] doubleValue] : 2 );
    }
}

%ctor 
{
    loadPrefs();
	timeg = timesl;
}

@interface SBControlCenterController
-(BOOL)isPresented;
@end

@interface CCUIRoundButton : UIControl
@property(nonatomic, retain)UIView* selectedStateBackgroundView;
@end

@interface MTMaterialView : UIView
@property UIColor* backgroundColor;
@property(nonatomic, assign) NSString* recipeName;
-(id)init;
@end




%hook SBControlCenterController


%new
- (void)targetMethod: (NSTimer *)timer {

	if (Enabled) {
		ccOpen = [self isPresented];
	}
}


-(id)init {
	
	[NSTimer scheduledTimerWithTimeInterval:timeg
	target: self
	selector:@selector(targetMethod:)
	userInfo:[NSDictionary dictionaryWithObject:self 
				forKey:@"name"]
	repeats:YES];
	return %orig;
}

%end

%hook CCUIRoundButton
%property(nonatomic, assign)BOOL running;
-(id)initWithHighlightColor:(id)arg1 useLightStyle:(BOOL)arg2 {

	[NSTimer scheduledTimerWithTimeInterval:timeg
	target: self
	selector:@selector(targetMethod:)
	userInfo:[NSDictionary dictionaryWithObject:self 
				forKey:@"name"]
	repeats:YES];
	return %orig;
}



%new
- (void)targetMethod: (NSTimer *)timer {

	if (Enabled && ccOpen) {
		CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
		CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
		CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
		UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
		[UIView animateWithDuration:timeg animations:^{
			self.selectedStateBackgroundView.backgroundColor = color;
		} completion:NULL];
	}
}

%end

%hook MTMaterialView


-(id) init {
	self = %orig;
	[NSTimer scheduledTimerWithTimeInterval:timeg
	target: self
	selector:@selector(targetMethod:)
	userInfo:[NSDictionary dictionaryWithObject:self 
				forKey:@"name"]
	repeats:YES];
	return self;
}


%new
- (void)targetMethod: (NSTimer *)timer {

	if (Enabled && ccOpen && [self.recipeName isEqual: @"modules"] && ![self.superview.superview isKindOfClass: [SBControlCenterWindow class]]) {
		CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
		CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
		CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
		UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
		[UIView animateWithDuration:timeg animations:^{
			self.backgroundColor = color;
		} completion:NULL];
	}
}

%end
