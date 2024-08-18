//
//  AnimatedSpriteFrame.h
//  Express
//


#import <Foundation/Foundation.h>

@class Sprite;

@interface AnimatedSpriteFrame : NSObject {
	Sprite *sprite;
	NSTimeInterval start;
}

- (id) initWithSprite:(Sprite*)theSprite start:(NSTimeInterval)theStart;
+ (id) frameWithSprite:(Sprite*)theSprite start:(NSTimeInterval)theStart;

@property (nonatomic, readonly) Sprite *sprite;
@property (nonatomic, readonly) NSTimeInterval start;

@end
