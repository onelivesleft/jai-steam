#import "Steam"(building = true, verbose = false);
#import "Compiler";

src :: "spacewar.jai";
exe :: "spacewar";
path_to_exe :: "./";

#run {
    build_options := get_build_options();
    set_build_options_dc(.{do_output=false});

    build_options.output_type = .EXECUTABLE;
    build_options.output_executable_name = exe;
    build_options.output_path = path_to_exe;

    workspace := compiler_create_workspace();
    set_build_options(build_options, workspace);

    compiler_begin_intercept(workspace);

    add_build_file(src, workspace);

    while true {
        message := compiler_wait_for_message();
        if !message || message.workspace != workspace continue;
        if message.kind == .COMPLETE break;

        steam_build_step(message);
    }

    compiler_end_intercept(workspace);
}
