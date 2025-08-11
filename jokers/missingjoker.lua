SMODS.Joker{ --Missing Joker
    key = "missingjoker",
    config = {
        extra = {
            sell_value = 3,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Missing Joker',
        ['text'] = {
            [1] = 'When this {C:clubs}joker{} {C:money}sold{},',
            [2] = 'create a random',
            [3] = '{C:dark_edition}polychrome {}{C:clubs}joker{} in',
            [4] = 'it\'s place.',
            [5] = '',
            [6] = 'Gains {C:money}$3{} of sell',
            [7] = 'value per {C:clubs}hand{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.selling_self  then
                return {
                    func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                    if joker_card then
                        joker_card:set_edition("e_polychrome", true)
                        
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Created!", colour = G.C.BLUE})
            end
            return true
        end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_value
            card:set_cost()
                return {
                    message = "+$3"
                }
        end
    end
}