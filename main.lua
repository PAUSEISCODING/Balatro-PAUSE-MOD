--- STEAMODDED HEADER
--- MOD_NAME: Pause's Jokers
--- MOD_ID: PAUSESJOKERPACK
--- MOD_AUTHOR: [PAUSE]
--- MOD_DESCRIPTION: Some Custom Jokers. Mwhehehehe.
--- PREFIX: jker_pack
----------------------------------------------
------------MOD CODE -------------------------

-- SMODS.Atlas{
--     key = 'pause_pack_sprite',
--     path = 'Jokers.png',
--     px = 71,
--     py = 95
-- }

SMODS.Atlas{
    key = 'Joker1',
    path = 'Joker1.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'Shae',
    path = 'shae.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'Joker2',
    path = 'Joker2.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'Josh',
    path = 'Josh.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'JoshJoker',
    loc_txt = {
        name = '{C:attention}Josh...{}',
        text = {
            'When Blind is selected,',
            '{C:green}1 in 4{} chance to',
            'create a {C:attention}Negative{} {C:blue}Stencil{} Joker',
            '{X:mult,C:white}X#1#{} Mult',
            'Gain {C:money}6${} at end of round'
        }
    },
    atlas = 'Josh',
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
            Xmult = 4.2
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
            local random_num = math.random(1, 4)

            if random_num == 1 then
                -- Success: Create the card
                local new_card1 = create_card('Joker', G.jokers, nil,nil,nil,nil,'j_stencil')
                new_card1:set_edition('e_negative')
                new_card1:add_to_deck()
                G.jokers:emplace(new_card1)
                -- Optionally, you could add a success message here too if desired, e.g.,
                return { card = card, message = 'Created!', colour = G.C.BLUE }
            else
                -- Failure: Card is not created, display a message
                return {
                    card = card,
                    message = 'Nope!',
                    colour = G.C.ATTENTION -- Assuming 'ATTENTION' is the correct key for red/orange
                }
            end
        end
    end,
    in_pool = function(self,wawa,wawa2)
        return true
    end,
    calc_dollar_bonus = function(self,card)
        return 6
    end,
}

SMODS.Joker{
    key = 'JokerCopier',
    loc_txt = {
        name = '{C:blue}Onyxiian{}',
        text = {
            'When Blind is selected,',
            '{C:green}1 in 4{} chance to',
            'create a {C:attention}Negative{} {C:blue}Brainstorm{} Joker',
            '{X:mult,C:white}X#1#{} Mult',
            'Gain {C:money}25${} at end of round'
        }
    },
    atlas = 'Joker2',
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
            local random_num = math.random(1, 4)

            if random_num == 1 then
                -- Success: Create the card
                local new_card1 = create_card('Joker', G.jokers, nil,nil,nil,nil,'j_brainstorm')
                new_card1:set_edition('e_negative')
                new_card1:add_to_deck()
                G.jokers:emplace(new_card1)
                -- Optionally, you could add a success message here too if desired, e.g.,
                return { card = card, message = 'Created!', colour = G.C.BLUE }
            else
                -- Failure: Card is not created, display a message
                return {
                    card = card,
                    message = 'Nope!',
                    colour = G.C.ATTENTION -- Assuming 'ATTENTION' is the correct key for red/orange
                }
            end
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
    key = 'DNACopier',
    loc_txt = {
        name = '{C:red}CARRUM{}',
        text = {
            'When Blind is selected,',
            '{C:green}1 in 4{} chance to',
            'create a {C:attention}Negative{} {C:blue}DNA{} Joker',
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
            local random_num = math.random(1, 4)

            if random_num == 1 then
                -- Success: Create the card
                local new_card1 = create_card('Joker', G.jokers, nil,nil,nil,nil,'j_dna')
                new_card1:set_edition('e_negative')
                new_card1:add_to_deck()
                G.jokers:emplace(new_card1)
                -- Optionally, you could add a success message here too if desired, e.g.,
                return { card = card, message = 'Created!', colour = G.C.BLUE }
            else
                -- Failure: Card is not created, display a message
                return {
                    card = card,
                    message = 'Nope!',
                    colour = G.C.ATTENTION -- Assuming 'ATTENTION' is the correct key for red/orange
                }
            end
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
    key = 'ZestyShae',
    loc_txt = {
        name = '{C:blue}Z{}{C:red}e{}{C:attention}s{}{C:blue}t{}{C:red}y{} Shae',
        text = {
            'When Blind is selected,',
            '{C:green}1 in 6{} chance to',
            'create a {C:attention}Negative{} {C:blue}Blueprint{} Joker',
            '{X:mult,C:white}X#1#{} Mult',
            'Gain {C:money}25${} at end of round'
        }
    },
    atlas = 'Shae',
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
            local random_num = math.random(1, 6)

            if random_num == 1 then
                -- Success: Create the card
                local new_card1 = create_card('Joker', G.jokers, nil,nil,nil,nil,'j_blueprint')
                new_card1:set_edition('e_negative')
                new_card1:add_to_deck()
                G.jokers:emplace(new_card1)
                -- Optionally, you could add a success message here too if desired, e.g.,
                return { card = card, message = 'Created!', colour = G.C.BLUE }
            else
                -- Failure: Card is not created, display a message
                return {
                    card = card,
                    message = 'Nope!',
                    colour = G.C.ATTENTION -- Assuming 'ATTENTION' is the correct key for red/orange
                }
            end
        end
    end,
    in_pool = function(self,wawa,wawa2)
        return true
    end,
    calc_dollar_bonus = function(self,card)
        return 25
    end,
}

-- SMODS.Booster{
--     key = 'PauseJokerPack',
--     loc_txt = {
--         name = "Pause's Joker Pack",
--         text = {
--             "Choose 1 of up to 4 {C:joker}Joker{} cards from {C:attention}PAUSE's Mod{}"
--         }
--     },
--     atlas = 'pause_pack_sprite', -- Reusing the sprite defined earlier for the pack itself
--     rarity = 1,
--     cost = 5,
--     pack_type = 'joker', -- This specifies it's a Joker pack
--     config = {
--         num_cards = 4, -- How many cards are offered from the pool
--         choices = 1, -- How many cards the player can select
--         jokers = { -- Defines the pool of jokers this pack can offer
--             'jker_JoshJoker', -- Using the full SMODS key (prefix_key) for the custom jokers
--             'jker_JokerCopier',
--             'jker_DNACopier',
--             'jker_ZestyShae',
--             -- You can also include vanilla jokers here if you want:
--             -- 'j_joker',
--             -- 'j_blueprint',
--         }
--     },
--     unlocked = true,
--     discovered = true,
--     eternal_compat = false,
--     perishable_compat = false,
--     calculate = function(self, card, context)
--         -- No special calculation needed for a basic Joker booster pack
--     end,
--     check_for_unlock = function(self, args)
--         unlock_card(self)
--     end,
--     in_pool = function(self, wawa, wawa2)
--         return true
--     end,
-- }


----------------------------------------------
------------MOD CODE END----------------------
