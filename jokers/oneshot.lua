SMODS.Joker{ --One Shot
    key = "oneshot",
    config = {
        extra = {
            hands = 1,
            discards = 6,
            dollars = 500,
            sell_value = 20,
            round = 0,
            all_jokers = 0
        }
    },
    loc_txt = {
        ['name'] = 'One Shot',
        ['text'] = {
            [1] = 'You get {C:red}One Shot.{}',
            [2] = 'dont mess it up.',
            [3] = '',
            [4] = '{C:red}1 Hand{} on boss blinds',
            [5] = '{C:blue}6 Discards{} on boss blinds',
            [6] = '',
            [7] = '{C:attention}$300{} if boss blind {C:red}defeated{}',
            [8] = '',
            [9] = '{C:money}+$20{} sell value of each {C:blue}joker{}',
            [10] = 'after every boss defeated'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    cost = 14,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return true
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.hands).." Hands", colour = G.C.BLUE})
                G.GAME.current_round.hands_left = card.ability.extra.hands
                return true
            end,
                    extra = {
                        func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards).." Discard", colour = G.C.ORANGE})
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + card.ability.extra.discards
                return true
            end,
                        colour = G.C.ORANGE
                        }
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    dollars = card.ability.extra.dollars,
                    extra = {
                        func = function()
            for i, other_card in ipairs(G.jokers.cards) do
                if other_card.set_cost then
                    other_card.ability.extra_value = (other_card.ability.extra_value or 0) + card.ability.extra.sell_value
                    other_card:set_cost()
                end
            end
                    return true
                end,
                            message = "All Jokers +"..tostring(card.ability.extra.sell_value).." Sell Value",
                        colour = G.C.MONEY
                        }
                }
        end
    end
}