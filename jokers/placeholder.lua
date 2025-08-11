SMODS.Joker{ --Placeholder
    key = "placeholder",
    config = {
        extra = {
            reroll_amount = 10000000000000000,
            chipsadded = 2
        }
    },
    loc_txt = {
        ['name'] = 'Placeholder',
        ['text'] = {
            [1] = 'Free {C:green}Rerolls{} Forever.',
            [2] = 'Each {C:green}Reroll{} adds 2 Chips',
            [3] = 'to this card.',
            [4] = '',
            [5] = '{X:blue,C:white}+#1#{} Chips'
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chipsadded}}
    end,

    calculate = function(self, card, context)
        if context.reroll_shop  then
                return {
                    func = function()
                    card.ability.extra.chipsadded = (card.ability.extra.chipsadded) + 2
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chipsadded
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