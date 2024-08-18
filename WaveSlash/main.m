//
//  main.m
//  WaveSlash
//
//  Created by Tevz Basaj on 25/10/2022.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Retronator.Xni.Framework.h"
#import <Foundation/Foundation.h>

int main(int argc, char * argv[]) {
    [GameHost load];
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, @"GameHost", @"WaveSlash");
    [pool release];
    return retVal;
    
}
