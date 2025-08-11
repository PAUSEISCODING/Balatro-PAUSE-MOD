SMODS.Joker{ --Dorito.
    key = "dorito",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Dorito.',
        ['text'] = {
            [1] = 'It\'s a Triangle...',
            [2] = 'I Think...',
            [3] = '',
            [4] = 'Does nothing but',
            [5] = 'i made it always',
            [6] = 'negative so you can',
            [7] = 'keep it.',
            [8] = '',
            [9] = '{C:red}Treasure the Triangle.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    set_ability = function(self, card, initial)
        card:set_edition("e_negative", true)
    end
}