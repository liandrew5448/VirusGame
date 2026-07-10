if (!instance_exists(oPlayer))
{
    if (global.is_loading_from_file)
    {
        instance_create_layer(global.statData.save_x, global.statData.save_y, "Player", oPlayer);

        LoadRoom();
        global.is_loading_from_file = false;
    }
    else
    {
        instance_create_layer(464, 288, "Player", oPlayer);
    }
}