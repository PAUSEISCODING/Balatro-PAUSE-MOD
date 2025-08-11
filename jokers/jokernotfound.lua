SMODS.Joker{ --Joker Not Found
    key = "jokernotfound",
    config = {
        extra = {
            dollars = 50,
            dollars2 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Joker Not Found',
        ['text'] = {
            [1] = 'If {C:attention}Blind Skipped{},',
            [2] = 'gain {C:money}$50{}',
            [3] = '',
            [4] = 'Lose {C:money}$5{} per {C:red}discard{}',
            [5] = 'used.'
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
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.skip_blind  then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
        if context.pre_discard  then
            if G.GAME.dollars > to_big(4) then
                return {
                    dollars = -card.ability.extra.dollars2
                }
            end
        end
    end
}