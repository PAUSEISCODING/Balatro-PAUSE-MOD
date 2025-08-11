SMODS.Joker{ --Josh...
    key = "josh",
    config = {
        extra = {
            odds = 4,
            dollars = 6,
            Xmult = 4.2,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Josh...',
        ['text'] = {
            [1] = '{C:green}1 in 4{} chance to',
            [2] = 'create a {C:attention}Negative{}',
            [3] = '{C:blue}Stencil{} Joker',
            [4] = '',
            [5] = '{X:mult,C:white}X4.2{} Mult',
            [6] = 'Gain {C:money}6${} at end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
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
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_19002059', 1, card.ability.extra.odds, 'j_pausespack_josh') then
                      SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_stencil' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end}, card)
                  end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = card.ability.extra.dollars,
                    message = "Josh"
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
    end
}