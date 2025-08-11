SMODS.Joker{ --Counterfeit Joker
    key = "counterfeitjoker",
    config = {
        extra = {
            chips = 30,
            odds = 100,
            odds2 = 1000
        }
    },
    loc_txt = {
        ['name'] = 'Counterfeit Joker',
        ['text'] = {
            [1] = '{C:blue}+30{} Chips',
            [2] = '{C:green}1 in 100{} chance',
            [3] = 'to destroy {C:attention}self{}',
            [4] = '',
            [5] = '{C:green}1 in 1000{} chance to',
            [6] = '{C:red}lose{} this run'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_13c9aa3c', 1, card.ability.extra.odds, 'j_pausespack_counterfeitjoker') then
                      SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_23b70c8d', 1, card.ability.extra.odds2, 'j_pausespack_counterfeitjoker') then
                      SMODS.calculate_effect({func = function()
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end}, card)
                  end
            end
        end
    end
}