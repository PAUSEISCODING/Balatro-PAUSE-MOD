SMODS.Joker{ --THE JOKER
    key = "thejoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'THE JOKER',
        ['text'] = {
            [1] = 'If {C:money}scored{} card has',
            [2] = 'no {C:enhanced}Enhancement{}.',
            [3] = '',
            [4] = 'Gives {C:money}scored{} card',
            [5] = 'a random {C:enhanced}Enhancement{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
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
            if (function()
        local enhancements = SMODS.get_enhancements(context.other_card)
        for k, v in pairs(enhancements) do
            if v then
                return true
            end
        end
        return false
    end)() then
                local enhancement_pool = {}
                for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                    if enhancement.key ~= 'm_stone' then
                        enhancement_pool[#enhancement_pool + 1] = enhancement
                    end
                end
                local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                context.other_card:set_ability(random_enhancement)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}