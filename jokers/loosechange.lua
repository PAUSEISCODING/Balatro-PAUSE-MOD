SMODS.Joker{ --Loose Change
    key = "loosechange",
    config = {
        extra = {
            odds = 4,
            dollars = 5,
            odds2 = 4,
            dollars2_min = 1,
            dollars2_max = 20,
            odds3 = 2,
            dollars3 = 5,
            odds4 = 20,
            dollars4 = 100
        }
    },
    loc_txt = {
        ['name'] = 'Loose Change',
        ['text'] = {
            [1] = 'Gives {C:money}Money{} randomly',
            [2] = 'throughout the run',
            [3] = '',
            [4] = '{C:inactive}(your welcome :D){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_8f89179f', 1, card.ability.extra.odds, 'j_pausespack_loosechange') then
                      SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                  end
            end
        end
        if context.skip_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_09cf65e4', 1, card.ability.extra.odds, 'j_pausespack_loosechange') then
                      SMODS.calculate_effect({dollars = pseudorandom('dollars2_d3d3007e', card.ability.extra.dollars2_min, card.ability.extra.dollars2_max)}, card)
                  end
            end
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_9679dc90', 1, card.ability.extra.odds, 'j_pausespack_loosechange') then
                      SMODS.calculate_effect({dollars = card.ability.extra.dollars3}, card)
                  end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_7a122c3e', 1, card.ability.extra.odds, 'j_pausespack_loosechange') then
                      SMODS.calculate_effect({dollars = card.ability.extra.dollars4}, card)
                  end
            end
        end
    end
}