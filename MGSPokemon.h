//
//  MGSPokemon.h
//  Pokedex-C
//
//  Created by Moses on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGSPokemon : NSObject

// values in the parentheses are property attributes
@property (readonly, nonatomic, copy) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
@property (nonatomic, copy, readonly) NSString *spritePath;
- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *> *)abilities
                         spritePath:(NSString *)spritePath;
@end

// JSONConvertable is the extension name
@interface MGSPokemon (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)toplevelDictionary;

@end

NS_ASSUME_NONNULL_END
