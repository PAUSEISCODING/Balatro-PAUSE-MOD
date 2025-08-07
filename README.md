# Pause's Pack

This is a first attempt at a modpack. I've never used LUA. This currently has 4 jokers in it. soon to have a booster pack containing them but as of right now the booster pack crashes the game under a false null value that isn't null, probably a stupid syntax error.

# ENJOY THE MOD


----------------------------------------------------------------------------------------------------------------------------


# Making Your Own Mod/Jokers

either make a folder in your mods or use this one.

make an assets folder,a "main.lua" file. then make two folders inside of assets and name them "1x" and "2x". this is for images.

this is basic setup for a mod.

to make your own mods:

--------------------From Below This Line All Code Required------------------------------
```
--- STEAMODDED HEADER
--- MOD_NAME: MOD NAME HERE
--- MOD_ID: YOURJOKERPACK
--- MOD_AUTHOR: [YOURNAME]
--- MOD_DESCRIPTION: PACK DESCRIPTION GOES HERE
--- PREFIX: jker_pack
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{ 
    --  This line indicates that a new image atlas (a collection of sprites) is being defined within the Steamodded framework.
    key = 'Joker', 
    -- This is a unique identifier for this particular atlas. 
    path = 'Joker.png', 
    -- This specifies the file path of the image containing the spritesheet for this atlas.
    -- For example, this would be located at your_mod_folder/assets/1x/Joker.png and your_mod_folder/assets/2x/Joker2.png.
    px = 71, 
    -- This defines the width (in pixels) of a single sprite within the atlas, at single resolution.
    -- This is important for the game to correctly slice the larger image into individual sprites for display.
    py = 95 
    -- This defines the height (in pixels) of a single sprite within the atlas, at single resolution.
    -- Similar to `px`, this ensures correct sprite extraction.
}

SMODS.Joker{
    -- Defines a new Joker card within the Steamodded framework.
    key = 'Joker1', 
    -- Unique identifier for this Joker.
    loc_txt = { 
        -- Text displayed on the Joker card.
        name = '{C:blue}CARD NAME GOES HERE{}', 
        --  The Joker's name, styled blue.
        text = { 
            -- Array of strings forming the Joker's ability description.
            'When Blind is selected,', 
            --  First line of description.
            '{C:green}1 in 4{} chance to', 
            -- Second line, including green text for "1 in 4".
            'create a {C:attention}Negative{} {C:blue}Joker{}', 
            -- Third line, with attention (red/orange) and blue text.
            '{X:mult,C:white}X#1#{} Mult', 
            --  Multiplier display (X#1# references the 'Xmult' variable defined in config).
            'Gain {C:money}25${} at end of round' 
            -- Money gain at the end of the round, styled as money.
        } 
    }, 
    atlas = 'Joker', 
    -- The visual atlas for the Joker's sprite.
    rarity = 3, 
    -- The Joker's rarity (e.g., 3 for Rare).
    cost = 5, 
    --  The selling price of the Joker.
    unlocked = true, 
    --  Whether the Joker is unlocked by default.
    discovered = true, 
    -- Whether the Joker has been "discovered" in the collection.
    blueprint_compat = true, 
    -- If the Joker is compatible with the Blueprint voucher.
    eternal_compat = false, 
    -- Whether this Joker can be Eternal.
    perishable_compat = false, 
    -- Whether this Joker can be Perishable.
    pos = {x = 0, y = 0}, 
    --  Default position (likely overridden by game logic).
    config = { 
        --  Configuration options for the Joker.
        extra = { 
            --  Extra data specific to this Joker.
            Xmult = 1.5 
            --  The multiplier value for the Joker (used in 'X#1#' in loc_txt).
        } 
    }, 
    loc_vars = function(self, info_queue, center) 
        -- Function to populate variables for localized text.
        info_queue[#info_queue+1] = G.P_CENTERS.j_joker 
        -- Adds this Joker to the information queue (related to displaying the card).
        return {vars = {center.ability.extra.Xmult}} 
        --  Returns the 'Xmult' value for localization purposes.
    end, 
    check_for_unlock = function(self, args) 
        --  Function for defining unlock conditions (if unlocked=false).
        unlock_card(self) 
        --  Unlocks the card (in this case, it's always true).
    end, 
    calculate = function(self,card,context) 
        --  This function defines the Joker's main effects.
        if context.joker_main then 
            -- Checks if this is the primary Joker being calculated.
            return { 
                -- Returns a table containing the calculation results.
                card = card, 
                -- The Joker card itself.
                Xmult_mod = card.ability.extra.Xmult, 
                -- Modifies the X-multiplier of the hand.
                message = 'X' .. card.ability.extra.Xmult, 
                --  Message displayed, e.g., "X1.5".
                colour = G.C.MULT 
                -- Color of the message (G.C.MULT likely red).
            } 
        end 

        if context.setting_blind then 
            -- Checks if a Blind is being selected (context for the effect).
            local random_num = math.random(1, 4) 
            -- Generates a random number between 1 and 4.

            if random_num == 1 then 
                -- If the random number is 1 (1 in 4 chance).
                -- Success: Create the card 
                local new_card1 = create_card('Joker', G.jokers, nil,nil,nil,nil,'j_joker') 
                -- Creates a new Joker card (of type 'j_joker').
                new_card1:set_edition('e_negative') 
                -- Sets the edition of the new card to Negative.
                new_card1:add_to_deck() 
                -- Adds the new Joker to the player's deck (likely adding to the hand area or similar).
                G.jokers:emplace(new_card1) 
                -- Places the new Joker into the active Joker area.
                -- Optionally, you could add a success message here too if desired, e.g., 
                return { card = card, message = 'Created!', colour = G.C.BLUE } 
                -- Returns a message indicating success.
            else 
                -- Failure: Card is not created, display a message 
                return { 
                    card = card, 
                    message = 'Nope!', 
                    colour = G.C.ATTENTION -- 'ATTENTION' is the key for orange 
                    -- Returns a message indicating failure.
                } 
            end 
        end 
    end, 
    in_pool = function(self,wawa,wawa2) 
        -- Defines if the Joker can appear in shops/pools.
        return true 
        --  Always returns true, meaning it can always appear.
    end, 
    calc_dollar_bonus = function(self,card) 
        -- Calculates the dollar bonus at the end of the round.
        return 25 
        --  Returns 25 (presumably representing $25).
    }, 
}

----------------------------------------------
------------MOD CODE END----------------------

```
Add a png to assets, in 1x this image should be 71x95px
scale this up to 142x190px and place it in the 2x folder as well.

change j_joker to a card of your choice. some examples:

j_blueprint
j_brainstorm
j_perkeo
j_yorick

so on and so forth.

replace the j_joker with one of those and test your mod!

Have fun!

message me on discord if u want some help:

PAUSE#0321 or Pause_Is_Online

:D
