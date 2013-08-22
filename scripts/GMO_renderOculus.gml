// Calculate positions
r = GMO_getIPD()/2
hdir = argument3+90;
vdir = argument5;

xadd = r*cos(degtorad(hdir))*cos(degtorad(vdir));
yadd = -r*sin(degtorad(hdir))*cos(degtorad(vdir));
zadd = r*sin(degtorad(vdir));

//move the eyes forward
r = GMO_getIPD()*.75;
hdir = argument3;
vdir = argument4;

xadd2 = r*cos(degtorad(hdir))*cos(degtorad(vdir));
yadd2 = -r*sin(degtorad(hdir))*cos(degtorad(vdir));
zadd2 = r*sin(degtorad(vdir));

/*
//now move the eyes up, so they pivot around an artificial neck joint
//this following code doesnt work right. The eyes need to move straight up, and then to the left or right if you tilt your head, so far tilting your head moves the eyes forward or backwards instead.
r = GMO_getIPD()*2;
hdir = argument4;
vdir = argument5;

xadd2 += r*cos(degtorad(hdir))*cos(degtorad(vdir));
yadd2 += -r*sin(degtorad(hdir))*cos(degtorad(vdir));
zadd2 += r*sin(degtorad(vdir));*/


aspect = (GMO_getResolutionWidth()/2) / GMO_getResolutionHeight();

//Draw all the 3D instances for the left eye
surface_set_target(GMO_getSurface(SURF_LEFT));
    draw_clear(c_white);
    //draw_clear_alpha(c_black,0);
    d3d_set_lighting(true);
    d3d_set_projection_simple(argument0+xadd+xadd2,argument1+yadd+yadd2,argument2+zadd+zadd2, argument3,argument4,argument5, argument6, aspect, argument8, argument9);
    GMO_draw3DInstances(); // Take a look at this function.
    d3d_transform_set_identity();
    
//Draw all the 3D instances for the right eye
surface_set_target(GMO_getSurface(SURF_RIGHT));
    draw_clear(c_white);
    //draw_clear_alpha(c_black,0);
    d3d_set_lighting(true);
    d3d_set_projection_simple(argument0-xadd+xadd2,argument1-yadd+yadd2,argument2-zadd+zadd2,argument3,argument4,argument5, argument6, aspect, argument8, argument9);
    GMO_draw3DInstances(); // Take a look at this function.
    d3d_transform_set_identity();
    
//Reset some settings
//d3d_set_projection_ortho(0,0,window_get_width(),window_get_height(),0);
d3d_set_lighting(false);
draw_set_alpha(1);
    

//Draw both surfaces on the regular surface
surface_set_target(GMO_getSurface(SURF_REGULAR));
draw_clear(c_black);
    w = GMO_getResolutionWidth()
    h = GMO_getResolutionHeight()

    // Make textures from the surfaces
    spr_TextureLeft = surface_get_texture(GMO_getSurface(SURF_RIGHT));
    spr_TextureRight = surface_get_texture(GMO_getSurface(SURF_LEFT));

    // Apply shader
    shader_set(hmdwarp_shader);
        texture_set_stage(global._GMO_passedTextureLeft, spr_TextureLeft);
        texture_set_stage(global._GMO_passedTextureRight, spr_TextureRight);
        draw_sprite_stretched(blank_spr,0,0,0,w,h)
    shader_reset();


//Reset some settings, just in case
surface_reset_target();
d3d_transform_set_identity();
d3d_set_lighting(false);
draw_set_alpha(1);
d3d_set_projection_ortho(0,0,window_get_width(),window_get_height(),0);
