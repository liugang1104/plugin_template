#import "{{project.pascalCase()}}Plugin.h"
#if __has_include(<{{project}}_ios/{{project}}_ios-Swift.h>)
#import <{{project}}_ios/{{project}}_ios-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "{{project}}_ios-Swift.h"
#endif

@implementation {{project.pascalCase()}}Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"my_test_plugin"
                                                                binaryMessenger:[registrar messenger]];
    {{project.pascalCase()}}Plugin* instance = [[{{project.pascalCase()}} alloc] init];
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

@end
