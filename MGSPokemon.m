//
//  MGSPokemon.m
//  Pokedex-C
//
//  Created by Moses on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "MGSPokemon.h"

@implementation MGSPokemon

- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *> *)abilities
                         spritePath:(NSString *)spritePath
{
    
    // Create the parent(superclass) vefore we can create the child(sublclass
    self = [super init];
    
    if (self)
    {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
        _spritePath = spritePath;
    }
    return self;
}

@end

@implementation MGSPokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)toplevelDictionary
{
// name, id, abilities, sprite
    NSString *name = toplevelDictionary[@"name"];
    // let id = tld["id"] as? Int
    NSInteger identifier = [toplevelDictionary[@"id"] integerValue];
    // let name = tld["name"]
    NSArray *abilitiesDict = toplevelDictionary[@"abilities"];
    // let abilities:[String] = []
    NSMutableArray<NSString *> *abilities = [NSMutableArray new];
    // let sprite
//    NSDictionary * spriteDict = toplevelDictionary[@"sprites"];
//    NSString * spritePath = spriteDict[@"front_shiny"];
    NSString *spritePath = toplevelDictionary[@"sprites"][@"front_shiny"];
    
    // how to handle potential null api values
    if ([name isKindOfClass:[NSString class]] || ![abilitiesDict isKindOfClass:[NSArray class]])
    for (NSDictionary *dictionary in abilitiesDict)
    {
        NSDictionary *abilityDict = dictionary[@"ability"];
        NSString *name = abilityDict[@"name"];
        [abilities addObject:name];
    }
    
    return [self initWithPokemonName:name identifier:identifier abilities:abilities spritePath:spritePath];
}

@end
