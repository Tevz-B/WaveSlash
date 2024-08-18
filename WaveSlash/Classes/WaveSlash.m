//
//  WaveSlash.m
//  WaveSlash
//
//  Created by Tevz Basaj on 26/10/2022.
//

#import "WaveSlash.h"

#import "Sprite.h"
#import "AnimatedSprite.h"
#import "AnimatedSpriteFrame.h"

#define D_HEIGHT self.graphicsDevice.viewport.height
#define D_WIDTH self.graphicsDevice.viewport.width

@implementation WaveSlash

 -(id)init
{
    self = [super init];
    if (self) {
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
    }
    return self;
}

-(void)initialize{
    spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
    center = [[Vector2 vectorWithX:self.graphicsDevice.viewport.width/2
                                 y:self.graphicsDevice.viewport.height/2] retain];
    [super initialize];
    NSLog(@"%@", center);
}

-(void)loadContent{
    // static sprite
    backgroundSprite = [[Sprite alloc] init];
    backgroundSprite.texture = [self.content load:@"test-background"];
    backgroundSprite.origin = [Vector2 vectorWithX:0 y:backgroundSprite.texture.height];
    backgroundSprite.sourceRectangle = [[Rectangle alloc] initWithX:0 y:0 width:256 height:256];
    
    monsterSprite = [[Sprite alloc] init];
    monsterSprite.texture = [self.content load:@"monster"];
    monsterSprite.origin = [Vector2 vectorWithX:monsterSprite.texture.width / 2 y:monsterSprite.texture.height];
    
    playerSprite = [[Sprite alloc] init];
    playerSprite.texture = [self.content load:@"player"];
    playerSprite.origin = [Vector2 vectorWithX:playerSprite.texture.width / 2 y:playerSprite.texture.height];
    
    // active sprite
    // monster
    Texture2D* monsterTex = [[self.content load:@"Monster1Walk"] autorelease];
    monster = [[AnimatedSprite alloc] initWithDuration:0.2f];
    monster.looping = YES;
    int monster_frame_num = 10;
    int monster_dim = 32;
    for (int i = 0; i < monster_frame_num; i++) {
        int row = 0;
        int column = i;
        Sprite *sprite = [[[Sprite alloc] init] autorelease];
        sprite.texture = monsterTex;
        sprite.sourceRectangle = [Rectangle rectangleWithX:column * monster_dim y:row * monster_dim width:monster_dim height:monster_dim];
        sprite.origin = [Vector2 vectorWithX:monster_dim/2 y:monster_dim];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:monster.duration * (float)i / monster_frame_num];
        [monster addFrame:frame];
    }
    
    // soldier
    Texture2D* soldierTex = [[self.content load:@"Soldier1Walk"] autorelease];
    soldier = [[AnimatedSprite alloc] initWithDuration:0.15f];
    soldier.looping = YES;
    int soldier_frames = 4;
    int soldier_dim = 32;
    for (int i = 0; i < soldier_frames; i++) {
        int row = 0;
        int column = i;
        Sprite *sprite = [[[Sprite alloc] init] autorelease];
        sprite.texture = soldierTex;
        sprite.sourceRectangle = [Rectangle rectangleWithX:column * soldier_dim y:row * soldier_dim width:soldier_dim height:soldier_dim];
        sprite.origin = [Vector2 vectorWithX:soldier_dim/2 y:soldier_dim];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:soldier.duration * (float)i / soldier_frames];
        [soldier addFrame:frame];
    }
    
}

-(void)drawWithGameTime:(GameTime *)gameTime {
    [self.graphicsDevice clearWithColor:[Color black]];
    [spriteBatch begin];
    
    // background
    [spriteBatch draw:backgroundSprite.texture to:[Vector2 vectorWithX:0 y:self.D_HEIGHT] fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:backgroundSprite.origin scaleUniform:2 effects:SpriteEffectsFlipHorizontally layerDepth:0];
    // monster
    [spriteBatch draw:monsterSprite.texture to:[Vector2 vectorWithX:center.x y:self.D_HEIGHT] fromRectangle:monsterSprite.sourceRectangle tintWithColor:[Color lightYellow] rotation:0 origin:monsterSprite.origin scaleUniform:10 effects:SpriteEffectsFlipHorizontally layerDepth:0];
    // player
    [spriteBatch draw:playerSprite.texture to:[Vector2 vectorWithX:center.x - 2*playerSprite.texture.width y:self.D_HEIGHT - 4*playerSprite.texture.height] fromRectangle:playerSprite.sourceRectangle tintWithColor:[Color white] rotation:0 origin:playerSprite.origin scaleUniform:10 effects:SpriteEffectsNone layerDepth:0];
    
    
 
//    [spriteBatch draw:background to:[Vector2 zero] fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:[Vector2 zero] scaleUniform:2 effects:SpriteEffectsNone layerDepth:0];
    // monster
//    [spriteBatch draw:monster to:center fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:[Vector2 zero] scaleUniform:10 effects:SpriteEffectsNone layerDepth:0];
    
    [spriteBatch end];
    [spriteBatch beginWithSortMode:SpriteSortModeDeffered BlendState:[BlendState alphaBlend]];
    // animated monster

    // get the appropriate sprite from animation
    Sprite *sprite = [monster spriteAtTime:gameTime.totalGameTime];
    
    [spriteBatch draw:sprite.texture to:[Vector2 vectorWithX:center.x + sprite.texture.width y:D_HEIGHT] fromRectangle:sprite.sourceRectangle tintWithColor:[Color white]
             rotation:0 origin:sprite.origin scaleUniform:10 effects:SpriteEffectsNone layerDepth:0];
    // animated soldier

    // get the appropriate sprite from animation
    Sprite *sprite2 = [soldier spriteAtTime:gameTime.totalGameTime];
    
    [spriteBatch draw:sprite2.texture to:[Vector2 vectorWithX:center.x - 3 * sprite2.texture.width y:D_HEIGHT] fromRectangle:sprite2.sourceRectangle tintWithColor:[Color white]
             rotation:0 origin:sprite2.origin scaleUniform:10 effects:SpriteEffectsNone layerDepth:0];
    
    [spriteBatch end];
    
    [super drawWithGameTime:gameTime];
}


@end
