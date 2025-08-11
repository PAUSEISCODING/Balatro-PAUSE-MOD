SMODS.Joker{ --THE JOKER
    key = "thejoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'THE JOKER',
        ['text'] = {
            [1] = 'Gives {C:money}scored{} card(s)',
            [2] = '{C:red}Red{} seal(s)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_seal("Red", true)
                return {
                    message = "Card Modified!"
                }
        end
    end
}