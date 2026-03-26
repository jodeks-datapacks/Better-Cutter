# Copy current pixel
data modify storage better_cutter:image data.current.pixel_color set \
  from storage better_cutter:image data.current.image_data[0]
data modify storage better_cutter:image data.current.description_text set \
  from storage better_cutter:image data.current.description[0]

scoreboard players add $index.image_data better_cutter.image 1

# Calculate column
scoreboard players operation $index.column better_cutter.image = $index.image_data better_cutter.image
scoreboard players operation $index.column better_cutter.image %= $width better_cutter.image

# Calculate row
scoreboard players operation $index.row better_cutter.image = $index.image_data better_cutter.image
scoreboard players operation $index.row better_cutter.image /= $width better_cutter.image

# Append start spacing
execute if score $index.column better_cutter.image matches 1 run \
  function better_cutter:image/process/append/blank

# Append colored pixel
execute unless data storage better_cutter:image data.current{pixel_color: ''} run \
  function better_cutter:image/process/append/pixel
# Append background pixel
execute if data storage better_cutter:image data.current{pixel_color: ''} run \
  function better_cutter:image/process/append/background

# Append description
execute if score $index.column better_cutter.image matches 0 run \
    function better_cutter:image/process/image_end/description

# Remove first element from the image_data array
data remove storage better_cutter:image data.current.image_data[0]
# Loop over rows
execute if score $index.row better_cutter.image < $height better_cutter.image run \
  function better_cutter:image/process/loop_over_image_data
 