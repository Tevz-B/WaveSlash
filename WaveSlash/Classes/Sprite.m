//
//  EnemySprite.m
//  WaveSlash
//
//  Created by Tevz Basaj on 02/11/2022.
//

#import "Sprite.h"

@implementation Sprite

@synthesize texture;
@synthesize sourceRectangle;
@synthesize origin;

- (void) dealloc
{
    [texture release];
    [sourceRectangle release];
    [origin release];
    [super dealloc];
}

@end


