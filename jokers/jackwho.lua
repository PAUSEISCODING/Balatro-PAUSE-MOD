SMODS.Joker{ --Jack who?
    key = "jackwho",
    config = {
        extra = {
            played = 0,
            Planet = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jack who?',
        ['text'] = {
            [1] = 'Creates a {C:dark_edition}Negative{}',
            [2] = '{C:blue}Crafting Table{} per',
            [3] = '2 blinds played.',
            [4] = '',
            [5] = '{C:inactive}Blinds Played: #1#/2{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.played}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.played = (card.ability.extra.played) + 1
                    return true
                end,
                    message = "+1"
                }
        end
        if context.setting_blind  then
            if (card.ability.extra.played or 0) == 2 then
                return {
                    func = function()
                    card.ability.extra.played = 0
                    return true
                end,
                    message = "Reset!",
                    extra = {
                        func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Planet', key = 'c_pausespack_craftingtable', edition = 'e_negative', key_append = 'joker_forge_planet'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Created", colour = G.C.SECONDARY_SET.Planet})
                    end
                    return true
                end,
                        colour = G.C.SECONDARY_SET.Planet
                        }
                }
            end
        end
    end
}