SMODS.Joker{ --Placeholder
    key = "placeholder",
    config = {
        extra = {
            reroll_amount = 10000000000000000,
            chipsadded = 2,
            chipstoadd = 2
        }
    },
    loc_txt = {
        ['name'] = 'Placeholder',
        ['text'] = {
            [1] = 'Free {C:green}Rerolls{} Forever.',
            [2] = 'Each {C:green}Reroll{} adds {X:blue,C:white}#2#{} Chips',
            [3] = 'to this card.',
            [4] = '',
            [5] = 'Buying any {C:attention}card{} from',
            [6] = 'the shop adds to the',
            [7] = 'amount of {C:blue}Chips{} added',
            [8] = 'per {C:green}Reroll {}',
            [9] = '',
            [10] = '{X:blue,C:white}+#1#{} Chips',
            [11] = '',
            [12] = '{C:inactive}(Not Applying to Booster Packs){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chipsadded, card.ability.extra.chipstoadd}}
    end,

    calculate = function(self, card, context)
        if context.reroll_shop  then
                return {
                    func = function()
                    card.ability.extra.chipsadded = (card.ability.extra.chipsadded) + card.ability.extra.chipstoadd
                    return true
                end,
                    message = "$chipsadded"
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chipsadded
                }
        end
        if context.buying_card  then
                return {
                    func = function()
                    card.ability.extra.chipstoadd = (card.ability.extra.chipstoadd) + 1
                    return true
                end,
                    message = "+1"
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.reroll_amount)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-(card.ability.extra.reroll_amount))
    end
}