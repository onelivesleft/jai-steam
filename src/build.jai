#import "Compiler";
#import "Basic";
#import "Hash_Table";
#import "String";


steam_build_step :: (message: *Message) {
    if inserted_generated_code  return;

    if !began_building {
        began_building = true;
        if verbose  print("Steam: Began building\n");
    }

    if message.kind == {
        case .TYPECHECKED;
        type_checked := cast(*Message_Typechecked) message;
        for decl : type_checked.declarations {
//            if decl.enclosing_load && decl.enclosing_load.enclosing_import.module_type != .MAIN_PROGRAM
//                continue;

            if decl.kind == .DECLARATION {
                table_set(*processed_decls, xx decl, true);

                if has_note(decl.notes, "SteamCallback") {
                    declaration := cast(*Code_Declaration) decl;
                    if declaration.type.type == .PROCEDURE {
                        if declaration.name {
                            table_set(*callback_procs, declaration.name, true);
                            if verbose  print("Steam: Found callback: %\n", declaration.name);
                        }
                    }
                    else {
                        compiler_report("You may only tag procedures with @SteamCallback!", make_location(declaration));
                    }
                }
            }
        }

        case .COMPILATION_PHASE;
        phase_message := cast (*Message_Phase) message;
        phase := phase_message.phase;

        if phase == .TYPECHECKED_ALL_WE_CAN {
            inserted_generated_code = true;

            builder: String_Builder;
            init_string_builder(*builder);
            defer reset(*builder);

            append(*builder, "Cannot_Generate_This_Codeblock_Without_A_Build_Script :: #string ___JAI\n");
            for _, proc_name: callback_procs
                print_to_builder(*builder, "    RegisterCallback(`%);\n", proc_name);
            append(*builder, "___JAI;\n");

            add_build_string(builder_to_string(*builder), message.workspace);
            if verbose  print("Steam: Done building\n");
        }
    }
}


#scope_file


callback_procs : Table(string, bool);
began_building := false;
inserted_generated_code := false;
processed_decls : Table(*Code_Node, bool);

has_note :: (notes: [] *Code_Note, note: string) -> bool {
    for notes  if it.text == note  return true;
    return false;
}
