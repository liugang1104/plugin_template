#import "{{project.pascalCase()}}Plugin.h"

@implementation {{project.pascalCase()}}Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"io.ambergroup.plugins/{{project}}"
                                                                binaryMessenger:[registrar messenger]];
    {{project.pascalCase()}}Plugin* instance = [[{{project.pascalCase()}}Plugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString *methodName = call.method;
    SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@:result:",methodName]);
    if ([self respondsToSelector:sel]) {
        IMP imp = [self methodForSelector:sel];
        void (*func)(id, SEL, id, FlutterResult) = (void *)imp;
        func(self, sel, call.arguments, result);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)getPlatformVersion:(id)arguments result:(FlutterResult)result {
    result([NSString stringWithFormat:@"iOS: %@", [[UIDevice currentDevice] systemVersion]]);
}

@end
