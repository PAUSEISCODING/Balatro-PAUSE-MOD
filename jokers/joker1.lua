SMODS.Joker{ --Joker :)
    key = "joker1",
    config = {
        extra = {
            perkgiven = 0,
            blinds = 0,
            respect = 0,
            Spectral = 0
        }
    },
    loc_txt = {
        ['name'] = 'Joker :)',
        ['text'] = {
            [1] = 'After leaving the shop',
            [2] = 'this card was purchased',
            [3] = 'from, gain a {C:dark_edition}Negative{}',
            [4] = '{C:legendary}Perkeo{}',
            [5] = '',
            [6] = '',
            [7] = 'Every 5 blinds selected',
            [8] = 'you will gain a {C:dark_edition}Negative{}',
            [9] = 'Pause Consumable once',
            [10] = 'the round ends.',
            [11] = '',
            [12] = '({C:inactive}#2#/5 blinds selected{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.perkgiven, card.ability.extra.blinds}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  then
            if (card.ability.extra.perkgiven or 0) == 0 then
                return {
                    func = function()
                    card.ability.extra.perkgiven = (card.ability.extra.perkgiven) + 1
                    return true
                end,
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_perkeo' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Perkeo!", colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
        if context.setting_blind  then
            if (card.ability.extra.blinds or 0) < 5 then
                return {
                    func = function()
                    card.ability.extra.blinds = (card.ability.extra.blinds) + 1
                    return true
                end
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (card.ability.extra.blinds or 0) == 5 then
                return {
                    func = function()
                    card.ability.extra.blinds = 0
                    return true
                end,
                    extra = {
                        func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Spectral', key = 'c_pausespack_pauseasecond', edition = 'e_negative', key_append = 'joker_forge_spectral'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end,
                        colour = G.C.SECONDARY_SET.Spectral
                        }
                }
            end
        end
    end
}