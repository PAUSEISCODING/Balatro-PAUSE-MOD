SMODS.Joker{ --House MD
    key = "housemd",
    config = {
        extra = {
            dollars = 10,
            chips = 50,
            mult = 25
        }
    },
    loc_txt = {
        ['name'] = 'House MD',
        ['text'] = {
            [1] = '{C:blue}Hugh Laurie{} will give you',
            [2] = '',
            [3] = '{C:money}$10{} per round',
            [4] = '{C:blue}+50{} Chips',
            [5] = '{C:red}+25{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = card.ability.extra.dollars,
                    message = "Medical Bill"
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips,
                    message = "It Could Be",
                    extra = {
                        mult = card.ability.extra.mult,
                            message = "Lupus..."
                        }
                }
        end
    end
}