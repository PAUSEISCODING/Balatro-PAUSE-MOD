SMODS.Joker{ --Zesty Shae
    key = "zestyshae",
    config = {
        extra = {
            Xmult = 1.5,
            odds = 6,
            dollars = 25,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Zesty Shae',
        ['text'] = {
            [1] = 'When {C:attention}Blind {}is selected',
            [2] = '{C:green}1 in 6{} chance to',
            [3] = 'create a {C:attention}Negative{} {C:blue}Blueprint Joker{}',
            [4] = '',
            [5] = '{X:mult,C:white}X1.5{} Mult',
            [6] = 'Gain {C:money}25${} at end of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
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
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_4e72d0c8', 1, card.ability.extra.odds, 'j_pausespack_zestyshae') then
                      SMODS.calculate_effect({func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_blueprint' })
                    if joker_card then
                        
                        
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end}, card)
                  end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = card.ability.extra.dollars,
                    message = "Zesty Shae"
                }
        end
    end
}