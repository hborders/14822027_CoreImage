//
//  HJBAppDelegate.m
//  14822027_CoreImage
//
//  Created by Heath Borders on 8/29/13.
//  Copyright (c) 2013 Heath Borders. All rights reserved.
//

#import "HJBAppDelegate.h"
#import <CoreImage/CoreImage.h>

@implementation HJBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [UIViewController new];
    
    {
        CIVector *inputPoint0 = [CIVector vectorWithCGPoint:CGPointZero];
        CIVector *inputPoint1 = [CIVector vectorWithCGPoint:CGPointZero];
        
        UIColor *fromColor = [UIColor blackColor];
        UIColor *toColor = [UIColor whiteColor];
        
        CIColor *inputColor0 = [CIColor colorWithCGColor:fromColor.CGColor];
        CIColor *inputColor1 = [CIColor colorWithCGColor:toColor.CGColor];
        
        CIFilter *gradientFilter = [CIFilter filterWithName:@"CILinearGradient"];
        
        [gradientFilter setValue:inputPoint0 forKey:@"inputPoint0"];
        [gradientFilter setValue:inputColor0 forKey:@"inputColor0"];
        [gradientFilter setValue:inputPoint1 forKey:@"inputPoint1"];
        [gradientFilter setValue:inputColor1 forKey:@"inputColor1"];
        
        CIContext *context = [CIContext contextWithOptions:nil];
        CIImage *gradientFilterOutputImage = [gradientFilter valueForKey: @"outputImage"];
        
        // Crashes on iOS7, returns NULL on iOS6
        CGImageRef gradientRef = [context createCGImage:gradientFilterOutputImage
                                               fromRect:CGRectZero];
        NSLog(@"gradientRef: %p", gradientRef);
        CGImageRelease(gradientRef);
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
