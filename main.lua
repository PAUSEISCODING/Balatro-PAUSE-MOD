--- STEAMODDED HEADER
--- MOD_NAME: Pause's Jokers
--- MOD_ID: PAUSESJOKERJOKER
--- MOD_AUTHOR: [PAUSE]
--- MOD_DESCRIPTION: A simple joker, doing joker things...
--- PREFIX: jker
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = 'Joker1',
    path = 'Joker1.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}


SMODS.Joker{
    key = 'DNACopier',
    loc_txt = {
        name = 'DNA Printing Press',
        text = {
            'When Blind is selected,',
            'create a {C:blue}DNA{} Joker',
            '{X:mult,C:white}X#1#{} Mult',
            'Gain {C:money}25${} at end of round'
        }
    },
    atlas = 'Joker1',
    rarity = 3,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {
        extra = {
            Xmult = 1.5
        }
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.j_joker
        return {vars = {center.ability.extra.Xmult}}
    end,
    check_for_unlock = function(self, args)
        unlock_card(self)
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end

        if context.setting_blind then
            local new_card1 = create_card('Joker', G.jokers, nil,nil,nil,nil,'j_dna')
            new_card1:add_to_deck()
            G.jokers:emplace(new_card1)
        end
    end,
    in_pool = function(self,wawa,wawa2)
        return true
    end,
    calc_dollar_bonus = function(self,card)
        return 25
    end,
}

SMODS.Joker{
    key = 'BlueprintCopier',
    loc_txt = {
        name = 'Blueprint Printing Press',
        text = {
            'When Blind is selected,',
            'create a {C:blue}Blueprint{} Joker',
            '{X:mult,C:white}X#1#{} Mult',
            'Gain {C:money}25${} at end of round'
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {
        extra = {
            Xmult = 1.5
        }
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.j_joker
        return {vars = {center.ability.extra.Xmult}}
    end,
    check_for_unlock = function(self, args)
        unlock_card(self)
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end

        if context.setting_blind then
            local new_card = create_card('Joker', G.jokers, nil,nil,nil,nil,'j_blueprint')
            new_card:add_to_deck()
            G.jokers:emplace(new_card)
        end
    end,
    in_pool = function(self,wawa,wawa2)
        return true
    end,
    calc_dollar_bonus = function(self,card)
        return 25
    end,
}

----------------------------------------------
------------MOD CODE END----------------------