#include "rainRootListController.h"
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>

@implementation rainRootListController

-(NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
	}

- (void)respring {
	[HBRespringController respring];
}

//Adds a method to open the github link for the sourcecode
- (void)openGithub {
<<<<<<< HEAD
	UIApplication *application = [UIApplication sharedApplication];
	NSURL *URL = [NSURL URLWithString:@"https://github.com/AirKetchPLAYZ/rainbowcctoggles"];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			NSLog(@"Opened url");
		}
	}];
}

-(void)twitter {
	UIApplication *application = [UIApplication sharedApplication];
	NSURL *URL = [NSURL URLWithString:@"https://twitter.com/ThomasKodey"];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			NSLog(@"Opened url");
		}
	}];
}
-(void)twitter2 {
	UIApplication *application = [UIApplication sharedApplication];
	NSURL *URL = [NSURL URLWithString:@"https://twitter.com/JoshuaLausch"];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			NSLog(@"Opened url");
		}
	}];
=======
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/KodeyThomas/SpotifyBlue"]];
}

- (void)openTwitter {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/ThomasKodey"]];
}

- (void)openTwitter2 {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter/JoshuaLausch"]];
>>>>>>> 13d371c5633e1de71065ced5a372250f494df439
}

@end
