SMODS.Joker{ --Neon Joker
    key = "neonjoker",
    config = {
        extra = {
            SixthOfChips = 0,
            dollars = 20,
            hands = 1,
            discards = 1,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Neon Joker',
        ['text'] = {
            [1] = 'When a {C:attention}Jack{}',
            [2] = 'scores:',
            [3] = '',
            [4] = 'Gain {C:attention}$20{}',
            [5] = 'Gain {C:red}1 Discard{}',
            [6] = 'Gain {C:blue}1 Hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 11 then
                return {
                    dollars = card.ability.extra.dollars,
                    extra = {
                        func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hands).." Hand", colour = G.C.GREEN})
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                return true
            end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards).." Discard", colour = G.C.ORANGE})
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + card.ability.extra.discards
                return true
            end,
                            colour = G.C.ORANGE
                        }
                        }
                }
            end
        end
    end
}