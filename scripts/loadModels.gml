global.MODEL[MOD_TREE_LEAVES] = d3d_model_create();
global.MODEL[MOD_TREE_TRUNK] = d3d_model_create();
global.MODEL[MOD_FERN] = d3d_model_create();
global.MODEL[MOD_SKYBALL] = d3d_model_create();
global.MODEL[MOD_ARROW] = d3d_model_create();

size=10
d3d_model_floor(global.MODEL[MOD_ARROW],-size/2,-size/2,0,size/2,size/2,0,1,1);

range = CAM_ZFAR*2
d3d_model_ellipsoid(global.MODEL[MOD_SKYBALL],-range/2,-range/2,-range/2,range/2,range/2,range/2,1,1,16);

d3d_model_load(global.MODEL[MOD_TREE_LEAVES],working_directory + "\models\tree_leaves.d3d");
d3d_model_load(global.MODEL[MOD_TREE_TRUNK],working_directory + "\models\tree_trunk.d3d");
d3d_model_load(global.MODEL[MOD_FERN],working_directory + "\models\fern.d3d");


global.MODEL[MOD_FIRE] = d3d_model_create();
global.MODEL[MOD_FIREHAY] = d3d_model_create();
global.MODEL[MOD_FIREWOOD] = d3d_model_create();

d3d_model_cone(global.MODEL[MOD_FIRE],-12,-12,0,12,12,30,1,1,1,18);

//d3d_model_load(global.MODEL[MOD_FIRE],working_directory + "\models\fire.d3d");
d3d_model_load(global.MODEL[MOD_FIREHAY],working_directory + "\models\firehay.d3d");
d3d_model_load(global.MODEL[MOD_FIREWOOD],working_directory + "\models\firewood.d3d");

