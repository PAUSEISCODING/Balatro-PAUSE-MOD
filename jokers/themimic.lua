SMODS.Joker{ --The Mimic
    key = "themimic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Mimic',
        ['text'] = {
            [1] = 'Copies ability of',
            [2] = 'the {C:attention}Joker{} to the left.',
            [3] = '',
            [4] = '{C:green}1 in 3 {}chance to',
            [5] = '{C:red}Disable {}boss blind.',
            [6] = '',
            [7] = '{C:attention}+1{} playable cards.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-1)
    end,

    calculate = function(self, card, context)
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
        
        return SMODS.blueprint_effect(card, target_joker, context)
    end
}