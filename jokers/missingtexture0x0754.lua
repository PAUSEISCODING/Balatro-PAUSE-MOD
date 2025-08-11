SMODS.Joker{ --Missing_Texture_0x0754
    key = "missingtexture0x0754",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Missing_Texture_0x0754',
        ['text'] = {
            [1] = 'Copies ability of',
            [2] = '{C:attention}Joker{} in second slot.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        local target_joker = nil
        
        target_joker = G.jokers.cards[2]
        if target_joker == card then
            target_joker = nil
        end
        
        return SMODS.blueprint_effect(card, target_joker, context)
    end
}