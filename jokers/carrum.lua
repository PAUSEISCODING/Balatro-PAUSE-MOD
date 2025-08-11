SMODS.Joker{ --CARRUM
    key = "carrum",
    config = {
        extra = {
            Xmult = 2,
            dollars = 25,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'CARRUM',
        ['text'] = {
            [1] = 'When {C:attention}Blind {}is selected',
            [2] = '{C:green}1 in 4{} chance to',
            [3] = 'create a {C:attention}Negative{} {C:blue}DNA Joker{}',
            [4] = '',
            [5] = '{X:mult,C:white}X2{} Mult',
            [6] = 'Gain {C:money}25${} at end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = card.ability.extra.dollars,
                    message = "CARRUM"
                }
        end
        if context.setting_blind  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_dna' })
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
        end
                }
        end
    end
}