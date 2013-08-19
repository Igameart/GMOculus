GMO_initDefaults(); //Load default settings

if (OVR_Init()) { //Check wether the oculus can actually be used.
    GMO_initSurfaces(); //Create surfaces
    GMO_initShaders(); //Initialize shaders
    
    show_debug_message("GMOculus initialized!");
    return true;
} else {
    show_debug_message("GMOculus could not be initialized.");
    return false;
}

