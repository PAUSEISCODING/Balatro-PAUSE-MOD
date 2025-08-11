SMODS.Joker{ --John Wayne Gacy
    key = "johnwaynegacy",
    config = {
        extra = {
            chips = 50,
            mult = 10
        }
    },
    loc_txt = {
        ['name'] = 'John Wayne Gacy',
        ['text'] = {
            [1] = 'Scoring cards with a',
            [2] = '{C:red}Red {}Suit gain',
            [3] = '',
            [4] = '{C:blue}+50{} Chips',
            [5] = '{C:red}+10{} Mult',
            [6] = '',
            [7] = '{C:inactive}({}{C:hearts}Hearts{} {C:inactive}or {}{C:diamonds}Diamonds{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
            end
        end
    end
}