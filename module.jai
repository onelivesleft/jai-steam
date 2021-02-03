// Jai wrapper for Steamworks SDK v1.50

// use_flat_api gives direct access to the equivalent of steam_api_flat.h,
// if you want direct control over everything.
#module_parameters(use_flat_api := false);

#if use_flat_api
    #load "module_flat.jai";
else
    #load "module_nested.jai";
