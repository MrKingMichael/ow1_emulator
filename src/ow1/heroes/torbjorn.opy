#!mainFile "../../main.opy"

subroutine initTorbjorn

rule "[torbjorn.opy]: Detect Torbjorn initialization":
    @Event eachPlayer
    @Hero torbjorn
    @Condition eventPlayer.initialized == false # without this flag, the reset code in generic.opy executes after initialization

    initTorbjorn()
    eventPlayer.initialized = true


def initTorbjorn():
    @Name "[torbjorn.opy]: initTorbjorn()"

    while (eventPlayer.getMaxHealth() != OW1_TORBJORN_HEALTH + OW1_TORBJORN_ARMOR):
        clearCustomHealth()
        setCustomHealth(OW1_TORBJORN_HEALTH, OW1_TORBJORN_ARMOR, 0)
        wait(1)


rule "[torbjorn.opy]: Correct overload hp":
    @Event eachPlayer
    @Hero torbjorn
    @Condition eventPlayer.isUsingAbility2()

    damage(eventPlayer, null, OW1_TORBJORN_OVERLOAD_OVERHEALTH*(OW1_TORBJORN_TURRET_HEALTH/OW2_TORBJORN_TURRET_HEALTH) - OW1_TORBJORN_OVERLOAD_OVERHEALTH)
