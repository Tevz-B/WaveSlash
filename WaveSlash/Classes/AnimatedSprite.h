//
//  AnimatedSprite.h
//  Express
//


#import <Foundation/Foundation.h>

@class AnimatedSpriteFrame;
@class Sprite;

@interface AnimatedSprite : NSObject {
	NSMutableArray *frames;
	NSTimeInterval duration;
	BOOL looping;
}

- (id) initWithDuration:(NSTimeInterval)theDuration;
				
@property (nonatomic) NSTimeInterval duration;
@property (nonatomic) BOOL looping;

- (void) addFrame:(AnimatedSpriteFrame*)frame;

- (Sprite*) spriteAtTime:(NSTimeInterval)time;

@end
