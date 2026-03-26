#> better_cutter:image/process/generate
#
# This function generates the image data.

data modify storage better_cutter:image data.current.image_data set from storage better_cutter:image data.image_data
data modify storage better_cutter:image data.current.description set from storage better_cutter:image data.description
data modify storage better_cutter:image data.current.pixel_character set from storage better_cutter:image data.pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data better_cutter.image 0
# Set width
execute store result score $width better_cutter.image run data get storage better_cutter:image data.width
# Set height
execute store result score $height better_cutter.image run data get storage better_cutter:image data.height
# Set length
scoreboard players operation $length better_cutter.image = $width better_cutter.image
scoreboard players operation $length better_cutter.image *= $height better_cutter.image
# Clear remaining entries in tellraw
data remove storage better_cutter:image data.tellraw

# Add spacing on top
function better_cutter:image/process/append/line_break
# Loop over image data
function better_cutter:image/process/loop_over_image_data
# Add spacing on bottom
function better_cutter:image/process/append/line_break