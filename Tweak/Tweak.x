#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>

BOOL ccOpen = false;
BOOL Enabled = false;
float timesl = 2;
NSTimeInterval timeg;


// we are accessing Cephei from a tweak and it likes to throw hands if we do this so we
// set this boolean to true and it stops it. this is from the offical cephei docs
%hook HBForceCepheiPrefs

+ (BOOL)forceCepheiPrefsWhichIReallyNeedToAccessAndIKnowWhatImDoingISwear {
    return YES;
}

%end

// gather user defined settings from the tweak settings
// this section of code gets the values from our PreferenceBundle to check if the tweak is enabled and other settings.
%ctor {
  //create HBPreferences instance
  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"tech.kodeycodesstuff.rainbowccprefs"];


  //registers preference variables, naming the preference key and variable the same thing reduces confusion for me.

  // checks if our tweak is enabled and assigns our variable 'isEnabled' to the value of that.
  [preferences registerBool:&Enabled default:YES forKey:@"isEnabled"];

}

%ctor
{
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
	NSLog(@"%@", self.recipeName);
	if ([self.recipeName isEqual: @"modules"]) {
		[NSTimer scheduledTimerWithTimeInterval:timeg
		target: self
		selector:@selector(targetMethod:)
		userInfo:[NSDictionary dictionaryWithObject:self
					forKey:@"name"]
		repeats:YES];
	}
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
			self.backgroundColor = color;
		} completion:NULL];
	}
}

%end
