if (instance_number(oPlayer) > 1) {
    instance_destroy();
    exit;
}

window_set_size(1280,720)

xsp = 1;
ysp = 0;

dialogue_cooldown = 0;