#import "Compiler";
#import "Basic";
#import "Hash_Table";
#import "String";


steam_build_step :: (message: *Message) {
    if !began_building {
        began_building = true;
        if verbose  print("Steam: began building\n");
    }
    if inserted_generated_code  return;

    if message.kind == {

        case .TYPECHECKED;
        type_checked := cast(*Message_Typechecked) message;

        for decl : type_checked.declarations {
            if decl.filename == "" || contains(decl.filename, "modules")
                continue;

            if decl.kind == .DECLARATION {
                check_decl(decl);
            }
        }

        check_decl :: (decl: *Code_Declaration) {
            table_set(*processed_decls, xx decl, true);

            if has_note(decl.notes, "SteamCallback") {
                declaration := cast(*Code_Declaration) decl;
                if declaration.type.type == .PROCEDURE {
                    if declaration.name {
                        table_set(*callback_procs, declaration.name, true);
                        if verbose  print("Steam: found callback: %\n", declaration.name);
                    }
                }
                else {
                    compiler_report("You may only tag procedures with @SteamCallback!", make_location(declaration));
                }
            }

            for expression: decl.expressions {
                if expression.kind == .PROCEDURE_CALL {
                    call := cast(*Code_Procedure_Call) expression;
                    ident := cast(*Code_Ident) call.procedure_expression;
                    if ident.name == "InitSteam"
                        print("Calling %\n", ident.name);
                }
                else if expression.kind == .DECLARATION {
                    _, found := table_find(processed_decls, xx expression);
                    if !found {
                        check_decl(cast(*Code_Declaration) expression);
                    }
                }
            }
        }
/*

    InnerInit :: () -> bool {
        result := InitSteam();
        if result {
            #insert SteamCallbacks;
        }
        return result;
    }
*/

        case .COMPILATION_PHASE;
        phase_message := cast (*Message_Phase) message;
        phase := phase_message.phase;

        if phase == .TYPECHECKED_ALL_WE_CAN {
            inserted_generated_code = true;

            builder: String_Builder;
            init_string_builder(*builder);
            defer reset(*builder);

            append(*builder, "SteamCallbacks :: #string ___JAI\n");
            for _, proc_name: callback_procs
                print_to_builder(*builder, "    RegisterCallback(%);\n", proc_name);
            append(*builder, "___JAI;\n");

            add_build_string(builder_to_string(*builder), message.workspace);
            if verbose  print("Steam: done building\n");
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
