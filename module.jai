// Jai wrapper for `Steamworks SDK v1.50`

// `use_flat_api` gives direct access to the equivalent of steam_api_flat.h,
// if you want direct control over everything.


#module_parameters(use_flat_api := false);

#if use_flat_api
    #load "steam_flat.jai";
else
    #load "steam.jai";


// TODO
// [ ] Callbacks
// [ ] Hide types inside module scope and/or Steam namespace
// [x] Non-constructed "classes"
// [x] Additional instances of singletons
