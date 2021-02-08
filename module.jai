// Jai wrapper for Steamworks SDK v1.50

// `use_flat_api` gives direct access to the equivalent of steam_api_flat.h,
// if you want direct control over everything.
// `include_default_types` @TODO adds all the default type names, which will match up
// exactly with the documentation


#module_parameters(use_flat_api := false);

#if use_flat_api
    #load "steam_flat.jai";
else
    #load "steam.jai";
