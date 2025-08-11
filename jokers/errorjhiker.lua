SMODS.Joker{ --ERROR-j_hiker
    key = "errorjhiker",
    config = {
        extra = {
            pb_bonus_f1540954_min = 1,
            pb_bonus_f1540954_max = 50,
            perma_bonus = 0
        }
    },
    loc_txt = {
        ['name'] = 'ERROR-j_hiker',
        ['text'] = {
            [1] = 'Every played {C:attention}Card{}',
            [2] = 'permanently gains',
            [3] = '{C:blue}+?{} Chips when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + pseudorandom('pb_bonus_f1540954_seed', card.ability.extra.pb_bonus_f1540954_min, card.ability.extra.pb_bonus_f1540954_max)
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
        end
    end
}