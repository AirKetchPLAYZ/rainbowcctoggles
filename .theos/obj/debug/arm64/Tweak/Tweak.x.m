#line 1 "Tweak/Tweak.x"
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

BOOL sliders = false;
BOOL tsliders = false;
BOOL ccOpen = false;
BOOL Enabled = false;
float timesl = 2;
NSTimeInterval timeg;





#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBControlCenterWindow; @class SBControlCenterController; @class MTMaterialView; @class CCUIContentModuleContentContainerView; @class MediaControlsVolumeSliderView; @class CCUIContinuousSliderView; @class CCUIRoundButton; @class HBForceCepheiPrefs; @class MediaControlsMaterialView; 
static BOOL (*_logos_meta_orig$_ungrouped$HBForceCepheiPrefs$forceCepheiPrefsWhichIReallyNeedToAccessAndIKnowWhatImDoingISwear)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$HBForceCepheiPrefs$forceCepheiPrefsWhichIReallyNeedToAccessAndIKnowWhatImDoingISwear(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBControlCenterController$targetMethod$(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST, SEL, NSTimer *); static SBControlCenterController* (*_logos_orig$_ungrouped$SBControlCenterController$init)(_LOGOS_SELF_TYPE_INIT SBControlCenterController*, SEL) _LOGOS_RETURN_RETAINED; static SBControlCenterController* _logos_method$_ungrouped$SBControlCenterController$init(_LOGOS_SELF_TYPE_INIT SBControlCenterController*, SEL) _LOGOS_RETURN_RETAINED; static CCUIRoundButton* (*_logos_orig$_ungrouped$CCUIRoundButton$initWithHighlightColor$useLightStyle$)(_LOGOS_SELF_TYPE_INIT CCUIRoundButton*, SEL, id, BOOL) _LOGOS_RETURN_RETAINED; static CCUIRoundButton* _logos_method$_ungrouped$CCUIRoundButton$initWithHighlightColor$useLightStyle$(_LOGOS_SELF_TYPE_INIT CCUIRoundButton*, SEL, id, BOOL) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$CCUIRoundButton$targetMethod$(_LOGOS_SELF_TYPE_NORMAL CCUIRoundButton* _LOGOS_SELF_CONST, SEL, NSTimer *); static MTMaterialView* (*_logos_orig$_ungrouped$MTMaterialView$init)(_LOGOS_SELF_TYPE_INIT MTMaterialView*, SEL) _LOGOS_RETURN_RETAINED; static MTMaterialView* _logos_method$_ungrouped$MTMaterialView$init(_LOGOS_SELF_TYPE_INIT MTMaterialView*, SEL) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$MTMaterialView$targetMethod$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL, NSTimer *); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MediaControlsMaterialView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MediaControlsMaterialView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CCUIContentModuleContentContainerView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CCUIContentModuleContentContainerView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MediaControlsVolumeSliderView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MediaControlsVolumeSliderView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CCUIContinuousSliderView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CCUIContinuousSliderView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CCUIRoundButton(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CCUIRoundButton"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBControlCenterWindow(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBControlCenterWindow"); } return _klass; }
#line 29 "Tweak/Tweak.x"


static BOOL _logos_meta_method$_ungrouped$HBForceCepheiPrefs$forceCepheiPrefsWhichIReallyNeedToAccessAndIKnowWhatImDoingISwear(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}





static __attribute__((constructor)) void _logosLocalCtor_fbcb3dcb(int __unused argc, char __unused **argv, char __unused **envp) {
	
	HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"tech.kodeycodesstuff.rainbowccprefs"];


	

	
	[preferences registerBool:&Enabled default:YES forKey:@"isEnabled"];
	[preferences registerBool:&tsliders default:YES forKey:@"sliders"];
}

static __attribute__((constructor)) void _logosLocalCtor_c0c7c76d(int __unused argc, char __unused **argv, char __unused **envp)
{
	timeg = timesl;
	sliders = tsliders;
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
-(void)setBackgroundColor:(UIColor *)arg1 ;
@end








static void _logos_method$_ungrouped$SBControlCenterController$targetMethod$(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSTimer * timer) {

	if (Enabled) {
		ccOpen = [self isPresented];
	}
}


static SBControlCenterController* _logos_method$_ungrouped$SBControlCenterController$init(_LOGOS_SELF_TYPE_INIT SBControlCenterController* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

	[NSTimer scheduledTimerWithTimeInterval:timeg
	target: self
	selector:@selector(targetMethod:)
	userInfo:[NSDictionary dictionaryWithObject:self
				forKey:@"name"]
	repeats:YES];
	return _logos_orig$_ungrouped$SBControlCenterController$init(self, _cmd);
}




__attribute__((used)) static BOOL _logos_method$_ungrouped$CCUIRoundButton$running(CCUIRoundButton * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$CCUIRoundButton$running); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$_ungrouped$CCUIRoundButton$setRunning(CCUIRoundButton * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$CCUIRoundButton$running, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static CCUIRoundButton* _logos_method$_ungrouped$CCUIRoundButton$initWithHighlightColor$useLightStyle$(_LOGOS_SELF_TYPE_INIT CCUIRoundButton* __unused self, SEL __unused _cmd, id arg1, BOOL arg2) _LOGOS_RETURN_RETAINED {

	[NSTimer scheduledTimerWithTimeInterval:timeg
	target: self
	selector:@selector(targetMethod:)
	userInfo:[NSDictionary dictionaryWithObject:self
				forKey:@"name"]
	repeats:YES];
	return _logos_orig$_ungrouped$CCUIRoundButton$initWithHighlightColor$useLightStyle$(self, _cmd, arg1, arg2);
}




static void _logos_method$_ungrouped$CCUIRoundButton$targetMethod$(_LOGOS_SELF_TYPE_NORMAL CCUIRoundButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSTimer * timer) {

	if (Enabled && ccOpen) {
		CGFloat hue = ( arc4random() % 256 / 256.0 );  
		CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; 
		CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; 
		UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
		[UIView animateWithDuration:timeg animations:^{
			self.selectedStateBackgroundView.backgroundColor = color;
		} completion:NULL];
	}
}






static MTMaterialView* _logos_method$_ungrouped$MTMaterialView$init(_LOGOS_SELF_TYPE_INIT MTMaterialView* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
	self = _logos_orig$_ungrouped$MTMaterialView$init(self, _cmd);
	[NSTimer scheduledTimerWithTimeInterval:timeg
	target: self
	selector:@selector(targetMethod:)
	userInfo:[NSDictionary dictionaryWithObject:self 
				forKey:@"name"]
	repeats:YES];
	return self;
}



static void _logos_method$_ungrouped$MTMaterialView$targetMethod$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSTimer * timer) {
	
	if (sliders && ([self.superview.superview isKindOfClass: [_logos_static_class_lookup$CCUIContinuousSliderView() class]])) {
		CGFloat hue = ( arc4random() % 256 / 256.0 );  
		CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; 
		CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; 
		UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
		[UIView animateWithDuration:timeg animations:^{
			self.backgroundColor = color;
		} completion:NULL];
	}
	else if (Enabled && ccOpen && [self.recipeName isEqual: @"modules"] && ![self.superview.superview isKindOfClass: [_logos_static_class_lookup$SBControlCenterWindow() class]] && ![self.superview isKindOfClass: [_logos_static_class_lookup$CCUIContentModuleContentContainerView() class]] && ![self.superview isKindOfClass: [_logos_static_class_lookup$CCUIRoundButton() class]] && ![self.superview isKindOfClass: [_logos_static_class_lookup$MediaControlsVolumeSliderView() class]] && ![self.superview.superview isKindOfClass: [_logos_static_class_lookup$CCUIContinuousSliderView() class]] && ![self.superview isKindOfClass: [_logos_static_class_lookup$MediaControlsMaterialView() class]])  {
		NSLog(@"aaaaa it works but it doesnt");
		CGFloat hue = ( arc4random() % 256 / 256.0 );  
		CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; 
		CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; 
		UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
		[UIView animateWithDuration:timeg animations:^{
			self.backgroundColor = color;
		} completion:NULL];
	}
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$HBForceCepheiPrefs = objc_getClass("HBForceCepheiPrefs"); Class _logos_metaclass$_ungrouped$HBForceCepheiPrefs = object_getClass(_logos_class$_ungrouped$HBForceCepheiPrefs); MSHookMessageEx(_logos_metaclass$_ungrouped$HBForceCepheiPrefs, @selector(forceCepheiPrefsWhichIReallyNeedToAccessAndIKnowWhatImDoingISwear), (IMP)&_logos_meta_method$_ungrouped$HBForceCepheiPrefs$forceCepheiPrefsWhichIReallyNeedToAccessAndIKnowWhatImDoingISwear, (IMP*)&_logos_meta_orig$_ungrouped$HBForceCepheiPrefs$forceCepheiPrefsWhichIReallyNeedToAccessAndIKnowWhatImDoingISwear);Class _logos_class$_ungrouped$SBControlCenterController = objc_getClass("SBControlCenterController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSTimer *), strlen(@encode(NSTimer *))); i += strlen(@encode(NSTimer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBControlCenterController, @selector(targetMethod:), (IMP)&_logos_method$_ungrouped$SBControlCenterController$targetMethod$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$SBControlCenterController, @selector(init), (IMP)&_logos_method$_ungrouped$SBControlCenterController$init, (IMP*)&_logos_orig$_ungrouped$SBControlCenterController$init);Class _logos_class$_ungrouped$CCUIRoundButton = objc_getClass("CCUIRoundButton"); MSHookMessageEx(_logos_class$_ungrouped$CCUIRoundButton, @selector(initWithHighlightColor:useLightStyle:), (IMP)&_logos_method$_ungrouped$CCUIRoundButton$initWithHighlightColor$useLightStyle$, (IMP*)&_logos_orig$_ungrouped$CCUIRoundButton$initWithHighlightColor$useLightStyle$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSTimer *), strlen(@encode(NSTimer *))); i += strlen(@encode(NSTimer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CCUIRoundButton, @selector(targetMethod:), (IMP)&_logos_method$_ungrouped$CCUIRoundButton$targetMethod$, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$CCUIRoundButton, @selector(running), (IMP)&_logos_method$_ungrouped$CCUIRoundButton$running, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$CCUIRoundButton, @selector(setRunning:), (IMP)&_logos_method$_ungrouped$CCUIRoundButton$setRunning, _typeEncoding); } Class _logos_class$_ungrouped$MTMaterialView = objc_getClass("MTMaterialView"); MSHookMessageEx(_logos_class$_ungrouped$MTMaterialView, @selector(init), (IMP)&_logos_method$_ungrouped$MTMaterialView$init, (IMP*)&_logos_orig$_ungrouped$MTMaterialView$init);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSTimer *), strlen(@encode(NSTimer *))); i += strlen(@encode(NSTimer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$MTMaterialView, @selector(targetMethod:), (IMP)&_logos_method$_ungrouped$MTMaterialView$targetMethod$, _typeEncoding); }} }
#line 171 "Tweak/Tweak.x"
