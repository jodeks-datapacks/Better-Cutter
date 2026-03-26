scoreboard objectives add jodek.config dummy
execute unless score &better_cutter_load_message jodek.config = &better_cutter_load_message jodek.config run scoreboard players set &better_cutter_load_message jodek.config 1
execute unless score &better_cutter_advancements jodek.config = &better_cutter_advancements jodek.config run scoreboard players set &better_cutter_advancements jodek.config 1

scoreboard objectives add better_cutter.image dummy

function better_cutter:config/image