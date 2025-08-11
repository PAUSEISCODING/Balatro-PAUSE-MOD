SMODS.Joker{ --Img.png
    key = "imgpng",
    config = {
        extra = {
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Img.png',
        ['text'] = {
            [1] = 'Over the hill and',
            [2] = 'far away,',
            [3] = '',
            [4] = 'Sell me for a copy of',
            [5] = '{C:legendary}Triboulet{}',
            [6] = '{C:inactive}(Negative){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        if context.selling_self  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_triboulet' })
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