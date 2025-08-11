SMODS.Joker{ --Dorito.
    key = "dorito",
    config = {
        extra = {
            hands = 3,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Dorito.',
        ['text'] = {
            [1] = 'It\'s a Triangle...',
            [2] = 'I Think...',
            [3] = '',
            [4] = '{C:green}Must do something...{}',
            [5] = '',
            [6] = 'i made it always',
            [7] = '{C:dark_edition}negative {}so you can',
            [8] = 'keep it either way.',
            [9] = '',
            [10] = '{C:red}Treasure the Triangle.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_left <= 0 then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Dorito...", colour = G.C.GREEN})
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                return true
            end
                }
            end
        end
    end
}