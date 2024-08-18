//
//  WaveSlash.h
//  WaveSlash
//
//  Created by Tevz Basaj on 26/10/2022.
//
#import "Game.h"
#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Retronator.Xni.Framework.Graphics.h"

NS_ASSUME_NONNULL_BEGIN

@class Sprite;
@class AnimatedSprite;

@interface WaveSlash : Game {
    GraphicsDeviceManager *graphics;
    SpriteBatch *spriteBatch;
    
    //textures
    Texture2D *gameSprites;
    Texture2D *background;

    // player sprite bounds
    Rectangle *playerBounds;
    
    //Sprites
    NSMutableArray* staticSprites;
    NSMutableArray* animatedSprites;
    Sprite* backgroundSprite;
    Sprite* monsterSprite;
    Sprite* playerSprite;
    AnimatedSprite* monster;
    AnimatedSprite* soldier;

    
    Vector2 *center;
    
}

@end

NS_ASSUME_NONNULL_END
