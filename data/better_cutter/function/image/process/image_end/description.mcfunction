# Append blank
function better_cutter:image/process/append/blank

data modify storage better_cutter:image data.tellraw append \
  from storage better_cutter:image data.current.description_text

# Append blank
function better_cutter:image/process/append/blank

# Append line_break
execute unless score $index.image_data better_cutter.image = $length better_cutter.image \
  run function better_cutter:image/process/append/line_break

# Remove first element from the description
data remove storage better_cutter:image data.current.description[0]
 