SMODS.Joker{ --Cheese Toasty
    key = "cheesetoast",
    config = {
        extra = {
            chips = 1000,
            mult = 1000,
            odds = 2,
            levels = 3,
            most = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cheese Toasty',
        ['text'] = {
            [1] = 'A {C:attention}Cheese Toasty.{}',
            [2] = '',
            [3] = '{C:blue}+1000{} Chips',
            [4] = '{C:red}+1000{} Mult',
            [5] = '',
            [6] = '{C:green}1 in 2 Chance{}',
            [7] = 'to {C:red}destroy {}itself',
            [8] = 'at the end of the',
            [9] = 'round.',
            [10] = '',
            [11] = 'When {C:blue}Joker {}is {C:red}destroyed{}',
            [12] = 'gain {C:attention}3 levels{} on most',
            [13] = 'played {C:blue}poker hand{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
                    chips = card.ability.extra.chips,
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_9cbd4328', 1, card.ability.extra.odds, 'j_pausespack_cheesetoast') then
                      temp_played = 0
        temp_order = math.huge
        for hand, value in pairs(G.GAME.hands) do 
          if value.played > temp_played and value.visible then
            temp_played = value.played
            temp_order = value.order
            target_hand = hand
          else if value.played == temp_played and value.visible then
            if value.order < temp_order then
              temp_order = value.order
              target_hand = hand
            end
          end
          end
        end
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Eaten!", colour = G.C.RED})
                        SMODS.calculate_effect({level_up = card.ability.extra.levels,
      level_up_hand = target_hand}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
                  end
            end
        end
    end
}