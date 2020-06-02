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
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/KodeyThomas/rainbowcctoggles"]];
}

-(void)twitter {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://twitter.com/ThomasKodey"]
	options:@{}
	completionHandler:nil];
		}


@end
