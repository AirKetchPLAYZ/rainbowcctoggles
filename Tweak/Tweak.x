#import <UIKit/UIKit.h>
#import <UIKit/UIView.h>
#import "SBControlCenterWindow.h"
#import "CCUIContentModuleContentContainerView.h"
#import <Cephei/HBPreferences.h>


@class UIView, UIImpactFeedbackGenerator;

@interface CCUIContinuousSliderView
@end

@interface MediaControlsVolumeSliderView : CCUIContinuousSliderView {
}
@end

BOOL sliders;
BOOL ccOpen = NO;
BOOL _en;
NSTimeInterval timeg;
NSMutableArray *timers;


// gather user defined settings from the tweak settings
// this section of code gets the values from our PreferenceBundle to check if the tweak is enabled and other settings
%ctor {
	// create HBPreferences instance
	HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"tech.kodeycodesstuff.rainbowccprefs"];

	// registers preference variables, naming the preference key and variable the same thing reduces confusion for me

	// checks if our tweak is enabled and assigns our variable 'isEnabled' to the value of that.
	[preferences registerBool:&_en default:YES forKey:@"isEnabled"];
	[preferences registerBool:&sliders default:YES forKey:@"sliders"];
	[preferences registerFloat:&timeg default:2.0 forKey:@"colorChangeInterval"];

	timers = [[NSMutableArray alloc] init];
}

static void updateTimers(BOOL opened) {
	for (NSTimer *timer in timers) {
		if (opened) {
			// fire immediately after opening CC
			[timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:timeg]];
			[timer fire];
		} else {
			[timer setFireDate:[NSDate distantFuture]];
		}
	}
}


@interface SBControlCenterController
- (BOOL)isPresented;
- (void)_didPresent;
- (void)_didDismiss;
- (void)_willBeginTransition; // gets called
- (void)_didEndTransition;
- (void)presentAnimated:(BOOL)arg1;
- (void)presentAnimated:(BOOL)arg1 completion:(/*^block*/id)arg2;
- (void)_willPresent; // gets called
- (void)grabberTongueWillPresent:(id)arg1;
- (void)_presentWithDuration:(double)arg1 completion:(/*^block*/id)arg2 ;
@end

@interface CCUIRoundButton : UIControl
@property (nonatomic, assign) BOOL wasEnabled;
@property (nonatomic, retain) UIView* selectedStateBackgroundView;
@end

@interface MTMaterialView : UIView
@property (nonatomic, assign) BOOL wasEnabled;
@property UIColor* backgroundColor;
@property (nonatomic, assign) NSString* recipeName;
- (id)init;
- (void)setBackgroundColor:(UIColor *)arg1;
@end



%hook SBControlCenterController
- (void)_didPresent {
	%orig;
	ccOpen = YES;
	//updateTimers(YES);
	HBLogDebug(@"ccOpen: %i", ccOpen);
}
- (void)_didDismiss {
	%orig;
	ccOpen = NO;
	updateTimers(NO);
	HBLogDebug(@"ccOpen: %i", ccOpen);
}
- (void)_willPresent {
	%orig;
	ccOpen = YES; // we can do this, because _didDismiss will still be called if we don't fully open the CC
	updateTimers(YES);
	HBLogDebug(@"%@", @"_willPresent");
}
%end

%hook CCUIRoundButton
%property(nonatomic, assign) BOOL wasEnabled;

- (id)initWithHighlightColor:(id)arg1 useLightStyle:(BOOL)arg2 {

	[timers addObject:
		[NSTimer scheduledTimerWithTimeInterval:timeg
		target: self
		selector:@selector(targetMethod:)
		userInfo:[NSDictionary dictionaryWithObject:self forKey:@"name"]
		repeats:YES]
	];
	return %orig;
}



%new
- (void)targetMethod: (NSTimer *)timer {

	if (_en && ccOpen) {
		self.wasEnabled = YES;
		CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
		CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
		CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
		UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
		[UIView animateWithDuration:timeg animations:^{
			self.selectedStateBackgroundView.backgroundColor = color;
		} completion:NULL];
	} else if (self.wasEnabled && ccOpen) {
		self.selectedStateBackgroundView.backgroundColor = [UIColor colorWithRed:0.04 green:0.47 blue:0.98 alpha:1.0];
		self.wasEnabled = NO;
	}
}

%end

%hook MTMaterialView
%property(nonatomic, assign) BOOL wasEnabled;

- (id)init {
	self = %orig;
	[timers addObject:
		[NSTimer scheduledTimerWithTimeInterval:timeg
		target: self
		selector:@selector(targetMethod:)
		userInfo:[NSDictionary dictionaryWithObject:self 
					forKey:@"name"]
		repeats:YES]
	];
	return self;
}


%new
- (void)targetMethod: (NSTimer *)timer {
	
	if (_en && ccOpen && sliders && ([self.superview.superview isKindOfClass: [%c(CCUIContinuousSliderView) class]])) {
		self.wasEnabled = YES;
		CGFloat hue = ( arc4random() % 256 / 256.0 );  // 0.0 to 1.0
		CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
		CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
		UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
		[UIView animateWithDuration:timeg animations:^{
			self.backgroundColor = color;
		} completion:NULL];
	}
	else if (_en && ccOpen && [self.recipeName isEqual: @"modules"] && ![self.superview.superview isKindOfClass: [%c(SBControlCenterWindow) class]] && ![self.superview isKindOfClass: [%c(CCUIContentModuleContentContainerView) class]] && ![self.superview isKindOfClass: [%c(CCUIRoundButton) class]] && ![self.superview isKindOfClass: [%c(MediaControlsVolumeSliderView) class]] && ![self.superview.superview isKindOfClass: [%c(CCUIContinuousSliderView) class]] && ![self.superview isKindOfClass: [%c(MediaControlsMaterialView) class]] && ![self.superview isKindOfClass: [%c(CCUIHeaderPocketView) class]])  {
		//HBLogDebug(@"aaaaa it works but it doesnt");
		self.wasEnabled = YES;	
		CGFloat hue = ( arc4random() % 256 / 256.0 );  // 0.0 to 1.0
		CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
		CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
		UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
		[UIView animateWithDuration:timeg animations:^{
			self.backgroundColor = color;
		} completion:NULL];
	}
	else if (self.wasEnabled && ccOpen) {
		self.backgroundColor = [UIColor whiteColor];
		self.wasEnabled = NO;
	}
}

%end
