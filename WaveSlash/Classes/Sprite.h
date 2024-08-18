//
//  Sprite.h
//  WaveSlash
//
//  Created by Tevz Basaj on 02/11/2022.
//


#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.h"

@interface Sprite : NSObject {
    Texture2D *texture;
    Rectangle *sourceRectangle;
    Vector2 *origin;
}

@property (nonatomic, retain) Texture2D *texture;
@property (nonatomic, retain) Rectangle *sourceRectangle;
@property (nonatomic, retain) Vector2 *origin;

@end
