#import <Cordova/CDV.h>

@interface LaunchMyApp : CDVPlugin

- (void)openURL:(CDVInvokedUrlCommand*)command;

@end

@implementation LaunchMyApp

- (void)pluginInitialize {
  // Other initialization code
  // [self.commandDelegate registerPlugin:self];
}

- (void)openURL:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    
    if (command.arguments.count > 0) {
        NSString* url = [command.arguments objectAtIndex:0];
        if (url && [NSURL URLWithString:url]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:url];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Invalid URL"];
        }
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No arguments provided"];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
