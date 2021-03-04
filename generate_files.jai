// This generates all the files in the `src-autogen` folder.  If the Steamworks version has changed,
// it's very likely this will break.  A manual edit after running is almost guaranteed to be necessary.

// @TODO
// [x] Inject SteamGameServer_RunCallbacks into SteamGameServer


#import "Basic";
#import "File";
#import "File_Utilities";
#import "String";
#import "Hash_Table";

#load "src/string.jai";
#load "src/json.jai";
#load "src/singletons_v150.jai";


steam_api_flat :: "sdk/public/steam/steam_api_flat.h";
steam_api_json :: "sdk/public/steam/steam_api.json";

output_autogen_folder       :: "src-autogen";
output_flat_filename        :: "src-autogen/api_flat.jai";
output_procs_filename       :: "src-autogen/api_flat_procs_internal.jai";
output_types_filename       :: "src-autogen/api_flat_types_internal.jai";
output_steam_api_filename   :: "src-autogen/steam_api.jai";  // for misc procs not attached to singletons
output_assignments_filename :: "src-autogen/partial_steam_assignments.jai";
output_loads_filename       :: "src-autogen/partial_steam_loads.jai";
output_callbacks_filename   :: "src-autogen/partial_steam_callbacks.jai";

files_appended_to_flat :: string.[
    "src/steam_types.jai",
];


singletons_to_ignore :: string.[
    "ISteamController", // deprecated and conflicts with `ISteamInput`
    "ISteamAppList",    // undocumented and conflicts with `ISteamApps`
];

procs_to_ignore :: string.[
    "SteamClient_GetIPCCallCount",       // duplicate of the proc in SteamUtils
    "SteamClient_SetWarningMessageHook", // duplicate of the proc in SteamUtils
];

attach_server_prefix :: string.[

];

Replacement :: struct {
    before : string;
    after  : string;
}

replacements :: Replacement.[
    .{"const ", ""},
    .{"unsigned short", "u16"},
    .{"unsigned int", "u32"},
    .{"ISteamHTMLSurface::", ""},
];

type_replacements :: Replacement.[
    .{"const ", ""},
    .{"unsigned ", "u"},
];

typedef_replacements :: Replacement.[
    .{"char [1024]", "[1024] char"},
    .{"int", "s32"},
    .{"short", "s16"},
    .{"unsigned char [8]", "[8] u8"},
    .{"unsigned char", "u8"},
    .{"unsigned int", "uint"},
    .{"unsigned long long", "u64"},
    .{"unsigned short", "u16"},
    .{"signed char", "s8"},
    .{"long long", "s64"},
    .{"void *", "*void"},
];

const_val_replacements :: Replacement.[
    .{"0xffffffffffffffffull", "0xffffffffffffffff"},
    .{" 16U ", " 16 "},
    .{" 8U ", " 8 "},
    .{" ( uint32 ) ", " cast(uint32) "},
    .{"'d'", "#char \"d\""},
    .{"'e'", "#char \"e\""},
    .{"'v'", "#char \"v\""},
    .{"( SteamItemInstanceID_t )", "cast(SteamItemInstanceID_t)"},
];


procs_builder            : String_Builder;
types_builder            : String_Builder;
steam_api_builder        : String_Builder;
singleton_top_builder    : String_Builder;
singleton_bottom_builder : String_Builder;
header_assigns_builder   : String_Builder;
header_loads_builder     : String_Builder;

callbacks_builder      : String_Builder;
callbacks_callresults : String_Builder;
callbacks_callbacks   : String_Builder;
callbacks_enum        : String_Builder;
callbacks_struct      : String_Builder;
callbacks_types       : String_Builder;
callbacks_procs       : String_Builder;

procs_out             :: #bake_arguments print_to_builder(builder = *procs_builder);
types_out             :: #bake_arguments print_to_builder(builder = *types_builder);
steam_api_out         :: #bake_arguments print_to_builder(builder = *steam_api_builder);
singleton_top_out     :: #bake_arguments print_to_builder(builder = *singleton_top_builder);
singleton_bottom_out  :: #bake_arguments print_to_builder(builder = *singleton_bottom_builder);
header_assign_out     :: #bake_arguments print_to_builder(builder = *header_assigns_builder);
header_load_out       :: #bake_arguments print_to_builder(builder = *header_loads_builder);

output :: print_to_builder;

callback_structnames : Table(string, s32);
callresult_structnames : Table(string, bool);

current_namespace := "";


main :: () {
    init_string_builder(*procs_builder);
    init_string_builder(*types_builder);

    clear_output_folder();

    // flat procs
    file_data, success := read_entire_file(steam_api_flat);
    if !success {
        print("Failed to read %", steam_api_flat);
        exit(1);
    }

    print("Generating %...\n", output_procs_filename);
    convert_steam_api_flat(file_data);

    file_builder : String_Builder;
    init_string_builder(*file_builder);
    append(*file_builder, "#scope_module\n\n\n");
    append(*file_builder, builder_to_string(*procs_builder));
    write_entire_file(output_procs_filename, builder_to_string(*file_builder));

    init_string_builder(*callbacks_builder);
    init_string_builder(*callbacks_callresults);
    init_string_builder(*callbacks_callbacks);
    init_string_builder(*callbacks_enum);
    init_string_builder(*callbacks_struct);
    init_string_builder(*callbacks_types);
    init_string_builder(*callbacks_procs);

    // flat types
    file_data, success = read_entire_file(steam_api_json);
    if !success {
        print("Failed to read %", steam_api_json);
        exit(1);
    }

    print("Generating %...\n", output_types_filename);
    convert_steam_api_json(file_data);

    reset(*file_builder);
    // append(*file_builder, "#scope_module\n\n\n"); // @TODO namespace types?
    append(*file_builder, builder_to_string(*types_builder));
    write_entire_file(output_types_filename, builder_to_string(*file_builder));


    output(*callbacks_builder, callbacks_header, builder_to_string(*callbacks_callresults), builder_to_string(*callbacks_callbacks));
    output(*callbacks_builder, "\n\n%", builder_to_string(*callbacks_enum));
    output(*callbacks_builder, "\n\n%", builder_to_string(*callbacks_struct));
    output(*callbacks_builder, "\n\n%", builder_to_string(*callbacks_types));
    output(*callbacks_builder, "\n%", builder_to_string(*callbacks_procs));
    write_entire_file(output_callbacks_filename, builder_to_string(*callbacks_builder));

    // singletones
    init_string_builder(*steam_api_builder);
    init_string_builder(*singleton_top_builder);
    init_string_builder(*singleton_bottom_builder);
    init_string_builder(*header_assigns_builder);
    init_string_builder(*header_loads_builder);

    file_data, success = read_entire_file(output_procs_filename);
    if !success {
        print("Failed to read %", output_procs_filename);
        exit(1);
    }

    generate_classes(file_data);

    write_entire_file(output_assignments_filename, builder_to_string(*header_assigns_builder));
    write_entire_file(output_loads_filename, builder_to_string(*header_loads_builder));

    reset(*file_builder);
    append(*file_builder, #string ___JAI
STEAMCLIENT_INTERFACE_VERSION :: "SteamClient020";

#scope_module
SteamInternal_CreateInterface :: (version: *u8) -> *ISteamClient #foreign steam;
#scope_export

SteamClient :: () -> *ISteamClient {
    return SteamInternal_CreateInterface(STEAMCLIENT_INTERFACE_VERSION);
}
___JAI);
    procs_data := builder_to_string(*procs_builder);
    for row: split(procs_data, "\n") {
        end_of_name := index_of_string(row, " :: (");
        if end_of_name >= 0 {
            underscore := end_of_name;
            backward_til(row, #char "_", #code underscore);
            if !is_letter(row[underscore + 1]) {
                underscore -= 1;
                backward_til(row, #char "_", #code underscore);
            }
            if row[underscore + 1] == #char "v" {
                append(*file_builder, slice(row, 0, underscore));
                append(*file_builder, slice(row, end_of_name));
            }
            else if mid(row, underscore - 2, end_of_name) == "_c_str"
                append(*file_builder, slice(row, underscore - 1));
            else
                append(*file_builder, slice(row, underscore + 1));
        }
        else
            append(*file_builder, row);
        append(*file_builder, "\n");
    }
    append(*file_builder, builder_to_string(*types_builder));
    output(*file_builder, "\n%\n\n", builder_to_string(*callbacks_enum));
    for files_appended_to_flat {
        file_data, success := read_entire_file(it);
        if !success {
            print("Failed to read %", it);
            exit(1);
        }
        file_data = lstrip(file_data);
        if starts_with(file_data, "#scope_module")
            file_data = slice(file_data, 13);
        append(*file_builder, file_data);
    }
    write_entire_file(output_flat_filename, builder_to_string(*file_builder));
}


convert_steam_api_flat :: (file_data: string) {
    out :: procs_out;

    rows := split(file_data, "\n");

    in_header := true;
    just_emit_newline := false;

    // steam_api_flat.h is autogenerated, therefor we make some assumptions
    // about parsing it.
    // a) Spaces only appear singly
    // b) Each comment section header is a singleton name
    // c) & and ** in parameters are always fully spaced

    for row, row_index: rows {
        line_number := row_index + 1;
        if in_header {
            if starts_with(row, "//")
                continue;
            else
                in_header = false;
        }

        if starts_with(row, "#") continue;

        line := strip(row);

        if line == "" {
            if !just_emit_newline  out("\n");
            just_emit_newline = true;
            continue;
        }
        else
            just_emit_newline = false;

        if starts_with(line, "typedef") {
            // typedef old new; // comment
            parts := split(line, ";");
            types := split(parts[0], " ");
            types_out("% :: %;%\n", types[2], types[1], parts[1]);
        }
        else if starts_with(line, "//") {
            // // ClassName
            out("%\n", line);
            //out("% :: void;\n", split(line, " ")[1]);
        }
        else if starts_with(line, "S_API") {
            for replacements  line = replace(line, it.before, it.after);
            sections := split(line, "(");
            header := split(sections[0], " ");
            if header.count == 4 && header[2] != "*" || header.count > 4 {
                print("WTF on line %\n", line_number);
            }
            return_type := header[1];
            return_is_pointer := false;
            proc_name := header[2];
            if proc_name == "*" {
                return_is_pointer = true;
                proc_name = header[3];
            }
            else if starts_with(proc_name, "*") {
                return_is_pointer = true;
                proc_name = slice(proc_name, 1, proc_name.count - 1);
            }

            return_char := ifx return_is_pointer  "*" else "";
            if return_type == "int"  return_type = "s32";

            parameters := split(split(sections[1], ")")[0], ",");

            link_name := proc_name;
            if starts_with(proc_name, "SteamAPI_") {
                proc_name = slice(proc_name, 9);
                if starts_with(proc_name, "I")
                    proc_name = slice(proc_name, 1);
            }

            class_end := 1;
            forward_til(row, #char "_", #code class_end);
            class_name := slice(proc_name, class_end);
            belongs_to_singleton := contains(singletons_v150, class_name);

            out("% :: (", proc_name);

            for parameter, index: parameters {
                if index != 0  out(", ");
                parts := split(strip(parameter), " ");
                parameter_type := parts[0];
                parameter_name := parts[parts.count-1];
                pointer_char := "";
                if ends_with(parameter_type, "*") {
                    parameter_type = slice(parameter_type, 0, parameter_type.count-1);
                    pointer_char = "*";
                }
                else if parts.count == 3 {
                    if parts[1] == "*" || parts[1] == "&"
                        pointer_char = "*";
                    else if parts[1] == "**"
                        pointer_char = "**";
                    else
                        print("WTF on line %\n", line_number);
                }
                if parameter_type == "int"  parameter_type = "s32";

                out("%1: %2%3", parameter_name, pointer_char, parameter_type);
            }

            if return_type == "void"
                out(") #foreign steam \"%\";\n", link_name);
            else if return_type == "SteamAPICall_t"
                out(") -> %1%2 #must #foreign steam \"%3\";\n", return_char, return_type, link_name);
            else
                out(") -> %1%2 #foreign steam \"%3\";\n", return_char, return_type, link_name);
        }

    }

    out("\n"); // make sure we have a blank line at bottom so that `generate_classes` has a sentinel
}


convert_steam_api_json :: (file_data: string) {
    root, success := json_parse_string(file_data);

    out :: types_out;


    traverse_node :: (key: string, node: JSON_Value, depth: int = 0) {
        const_name : JSON_Value;
        const_type : JSON_Value;
        const_val  : JSON_Value;
        success : bool;

        if node.type == {
        case .BOOLEAN;

        case .NUMBER;

        case .STRING;
            if key == {
                case "classname";
                out("% :: void;\n", node.value.str);
            }

        case .OBJECT;
            for node.value.object {
                traverse_node(it_index, it, depth + 1);
            }

        case .ARRAY;
            for node.value.array {
                traverse_node(key, it, depth + 1);
            }
            if key == {
                case "consts";
                if depth == 1 {
                    out("\n");
                    for node.value.array {
                        object := it.value.object;
                        const_name := get_str(object, "constname");
                        const_type := get_str(object, "consttype", type_replacements);
                        const_val  := get_str(object, "constval", const_val_replacements);
                        out("% : % : %;\n", const_name, const_type, const_val);
                    }
                }

                case "typedefs";
                if depth == 1 {
                    out("\n");
                    for node.value.array {
                        object := it.value.object;
                        typedef_before := get_str(object, "type");
                        typedef_after  := get_str(object, "typedef");
                        if contains(typedef_before, "(*)")
                            typedef_before = "*void";
                        else {
                            for typedef_replacements {
                                if typedef_before == it.before {
                                    typedef_before = it.after;
                                }
                            }
                        }
                        out("% :: %;\n", typedef_after, typedef_before);
                    }
                }

                case "enums";
                //if depth == 1 {
                    for node.value.array {
                        object := it.value.object;
                        enum_name := get_str(object, "enumname");
                        enum_values := get_array(object, "values");
                        //print("%\n", enum_values);
                        //print("A");
                        out("\n% :: enum s32 {\n", enum_name);
                        for enum_values {
                            object := it.value.object;
                            name := get_str(object, "name");
                            value := get_str(object, "value");
                            out("    % :: %;\n", name, value);
                        }
                        out("}\n");
                    }
                //}

                case "structs";
                if depth == 1 {
                    for node.value.array {
                        object := it.value.object;
                        struct_name := get_str(object, "struct");
                        struct_fields := get_array(object, "fields");
                        out("\n% :: struct {\n", struct_name);
                        for struct_fields {
                            object := it.value.object;
                            field_name := get_str(object, "fieldname");
                            field_type := get_str(object, "fieldtype", type_replacements);
                            if field_type == "int"  field_type = "s32";
                            if ends_with(field_type, "**")
                                field_type = sprint("**%", slice(field_type, 0, field_type.count - 2));
                            else if ends_with(field_type, "*")
                                field_type = sprint("*%", slice(field_type, 0, field_type.count - 1));
                            else if contains(field_type, "(*)")
                                field_type = "*void";
                            bracket := index_of_string(field_type, "[");
                            if bracket == -1
                                out("    % : %;\n", field_name, field_type);
                            else
                                out("    % : % %;\n", field_name,
                                                        slice(field_type, bracket, field_type.count - bracket),
                                                        slice(field_type, 0, bracket));
                        }
                        out("}\n");
                    }
                }

                case "methods";
                for node.value.array {
                    object := it.value.object;
                    struct_name := get_str(object, "callresult");
                    if struct_name  table_set(*callresult_structnames, struct_name, true);
                }

                case "callback_structs";
                if depth == 1 {
                    for node.value.array {
                        object := it.value.object;
                        struct_name := get_str(object, "struct");
                        struct_fields := get_array(object, "fields");
                        out("\n% :: struct {\n", struct_name);

                        callback_id := cast(s32) get_int(object, "callback_id");
                        out("    k_iCallback : s32 : %;\n", callback_id);

                        table_set(*callback_structnames, struct_name, callback_id);

                        for struct_fields {
                            object := it.value.object;
                            field_name := get_str(object, "fieldname");
                            field_type := get_str(object, "fieldtype", type_replacements);
                            if field_type == "int"  field_type = "s32";
                            coloncolon := index_of_string(field_type, "::");
                            if coloncolon != -1  field_type = slice(field_type, coloncolon + 2, field_type.count - (coloncolon + 2));
                            if ends_with(field_type, "**")
                                field_type = sprint("**%", slice(field_type, 0, field_type.count - 2));
                            else if ends_with(field_type, "*")
                                field_type = sprint("*%", slice(field_type, 0, field_type.count - 1));
                            else if contains(field_type, "(*)")
                                field_type = "*void";
                            bracket := index_of_string(field_type, "[");
                            if bracket == -1
                                out("    % : %;\n", field_name, field_type);
                            else
                                out("    % : % %;\n", field_name,
                                                        slice(field_type, bracket, field_type.count - bracket),
                                                        slice(field_type, 0, bracket));
                        }
                        out("}\n");
                    }
                }
            }
        }
    }


    root_value : JSON_Value;
    traverse_node("", root);


    output(*callbacks_enum, "CallbackID :: enum s32 {\n");
    output(*callbacks_struct, "Callbacks : struct {\n");
    output(*callbacks_procs, "\n#scope_export\n\n\n");

    for callback_id, struct_name: callback_structnames {
        _, found := table_find(callresult_structnames, struct_name);
        if found  continue;

        // @Note We special case UserStatsUnloaded_t / GSStatsUnloaded_t because they share their enum ID.
        //       We also skip PS3TrophiesInstalled_t entirely (because it shares ID with GlobalStatsReceived_t,
        //       and is presumably useless at this stage)

        if struct_name != "UserStatsUnloaded_t" && struct_name != "GSStatsUnloaded_t" && struct_name != "PS3TrophiesInstalled_t"
            output(*callbacks_callbacks, "                case .%1;  for Callbacks.%1  it(<<cast(*%1) callback.m_pubParam);\n", struct_name);
        if struct_name != "GSStatsUnloaded_t" && struct_name != "PS3TrophiesInstalled_t"
            output(*callbacks_enum, "    % :: %;\n", struct_name, callback_id);
        output(*callbacks_struct, "    %1 : [..] %1_Callback;\n", struct_name);
        output(*callbacks_types, "%1_Callback :: #type(%1);\n", struct_name);
        output(*callbacks_procs, #string ___JAI
SteamAPI_RegisterCallback :: (callback: (%1) -> ()) {
	array_add(*Callbacks.%1, callback);
}

        ___JAI, struct_name);
    }

    output(*callbacks_enum, "}\n\nCallResultID :: enum s32 {\n");
    output(*callbacks_struct, "}\n\nCallResults : struct {\n");
    callresult_internal_procs : String_Builder;
    init_string_builder(*callresult_internal_procs);
    append(*callresult_internal_procs, "\n#scope_module\n\n\n");

    for callback_id, struct_name: callresult_structnames {
        call_result_id, found := table_find(callback_structnames, struct_name);
        assert(found, sprint("Can't find callback ID for %", struct_name));
        output(*callbacks_callresults, "                    case .%1;  run_call_results(CallResults.%1, completed_call_result.m_hAsyncCall, cast(*%1) call_result, io_failure);\n", struct_name);
        output(*callbacks_enum, "    % :: %;\n", struct_name, call_result_id);
        output(*callbacks_struct, "    %1 : Table(SteamAPICall_t, [..] %1_CallResult);\n", struct_name);
        output(*callbacks_types, "%1_CallResult :: #type(%1, bool);\n", struct_name);
        output(*callbacks_procs, #string ___JAI
SteamAPI_RegisterCallResult :: (callback: (%1, bool) -> (), call_result_id: SteamAPICall_t) {
    procs, found := table_find(CallResults.%1, call_result_id);
    if !found {
        array : [..] %1_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.%1, call_result_id, procs);
}

        ___JAI, struct_name);
        output(*callresult_internal_procs, #string ___JAI
run_call_results :: (callbacks: Table(SteamAPICall_t, [..] %1_CallResult), call_id: SteamAPICall_t, call_result: *%1, io_failure: bool) {
    procs, found := table_find(callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

        ___JAI, struct_name);
    }

    output(*callbacks_struct, "}");
    output(*callbacks_enum, "}");
    output(*callbacks_procs, builder_to_string(*callresult_internal_procs));
}


// @TODO callresults
// Dispatch the call result to the registered handler(s) for the
// call identified by completed_call_result->m_hAsyncCall
//if completed_call_result.m_iCallback == NumberOfCurrentPlayers_t.k_iCallback
//	print("%% %%\n", formatStruct(<<cast(*NumberOfCurrentPlayers_t) call_result, use_long_form_if_more_than_this_many_members=-1, use_newlines_if_long_form=true), io_failure);
//else if completed_call_result.m_iCallback == GlobalStatsReceived_t.k_iCallback
//	print("%% %%\n", formatStruct(<<cast(*GlobalStatsReceived_t) call_result, use_long_form_if_more_than_this_many_members=-1, use_newlines_if_long_form=true), io_failure);

// @TODO callbacks
// Look at callback.m_iCallback to see what kind of callback it is,
// and dispatch to appropriate handler(s)
//print("%\n", callback);



callbacks_header :: #string ___JAI
#scope_module


run_callbacks :: (steam_pipe: HSteamPipe, is_server: bool) {
	SteamAPI_ManualDispatch_RunFrame(steam_pipe);

	callback: CallbackMsg_t;
	while SteamAPI_ManualDispatch_GetNextCallback(steam_pipe, *callback) {
		defer SteamAPI_ManualDispatch_FreeLastCallback(steam_pipe);

		if callback.m_iCallback == SteamAPICallCompleted_t.k_iCallback { // is a call result
			completed_call_result := cast(*SteamAPICallCompleted_t) callback.m_pubParam;
			call_result : *void;
			#if use_temporary_storage
				call_result = temporary_alloc(completed_call_result.m_cubParam);
			else
				call_result = alloc(completed_call_result.m_cubParam);

			io_failure := false;
			if SteamAPI_ManualDispatch_GetAPICallResult(
				steam_pipe, completed_call_result.m_hAsyncCall, call_result, completed_call_result.m_cubParam, completed_call_result.m_iCallback, *io_failure)
			{
                call_result_id := cast(CallResultID) completed_call_result.m_iCallback;
                if #complete call_result_id == {
%                }
			}

			#if !use_temporary_storage  free(call_result);
		}
		else {
            callback_id := cast(CallbackID) callback.m_iCallback;
			if #complete callback_id == {
                case .UserStatsUnloaded_t;
                if is_server  for Callbacks.GSStatsUnloaded_t    it(<<cast(*GSStatsUnloaded_t) callback.m_pubParam);
                else          for Callbacks.UserStatsUnloaded_t  it(<<cast(*UserStatsUnloaded_t) callback.m_pubParam);

%			 }
		}
	}
}


SteamAPI_RunCallbacks :: () {
	steam_pipe := SteamAPI_GetHSteamPipe();
	run_callbacks(steam_pipe, false);
}


SteamGameServer_RunCallbacks :: () {
	steam_pipe := SteamGameServer_GetHSteamPipe();
	run_callbacks(steam_pipe, true);
}
___JAI


get_str :: (object: *JSON_Object, key: string) -> string {
    value, success := table_find(<<object, key);
    if success  return value.value.str;
    else        return "";
}


get_str :: (object: *JSON_Object, key: string, replacements: [] Replacement) -> string {
    value, success := table_find(<<object, key);
    if success  {
        s := value.value.str;
        for replacements  s = replace(s, it.before, it.after);
        return s;
    }
    else
        return "";
}


get_int :: (object: *JSON_Object, key: string) -> int {
    value, success := table_find(<<object, key);
    if success  return cast(int) value.value.number;
    else        return 0;
}


get_obj :: (object: *JSON_Object, key: string) -> *JSON_Object {
    value, success := table_find(<<object, key);
    if success  return value.value.object;
    else        return null;
}


get_array :: (object: *JSON_Object, key: string) -> [..]JSON_Value {
    value, success := table_find(<<object, key);
    return value.value.array;
}


generate_classes :: (file_data: string) {
    rows := split(file_data, "\n");

    in_section              := false;
    section_name            := "";
    in_singleton            := false;
    past_singleton_header   := false;
    current_singleton_row   := -1;
    singleton_instance      := "";
    class_name_override     := "";
    namespace               := "";
    singleton_count         := 0;

    header_assign_out("#scope_module\n\n\nassign_all_singletons :: () {\n");

    steam_api_current_type := "";

    steam_api_header :: #string ___JAI

    ___JAI

    steam_api_out(steam_api_header);

    row_index := 0;
    while row_index < rows.count {
        defer row_index += 1;

        row := strip(rows[row_index]);

        if !in_section {
            if starts_with(row, "//") {
                in_section = true;
                section_name = strip(mid(row, 3));
                if section_name == "ISteamClient" {
                    in_singleton = true;
                    past_singleton_header = true;
                    current_singleton_row = -1;
                    singleton_instance, namespace = write_header(section_name, class_name_override);
                    print("Generating %.jai...\n", singleton_instance);
                }
            }
        }
        else {
            if row == "" {
                if in_singleton && !contains(singletons_to_ignore, section_name) {
                    //singleton_top_out("}\n");
                    singleton_count += 1;
                    append(*singleton_top_builder, builder_to_string(*singleton_bottom_builder));
                    write_entire_file(sprint("%/%.jai", output_autogen_folder, singleton_instance), builder_to_string(*singleton_top_builder));
                }

                if current_singleton_row != -1 {
                    row_index = current_singleton_row;
                    section_name = section_name_from_instance_row(rows[row_index + 1]);
                }
                else {
                    class_name_override = "";
                    in_section = false;
                }

                in_singleton = false;
                past_singleton_header = false;
                reset(*singleton_top_builder);
                reset(*singleton_bottom_builder);

                continue;
            }

            if !past_singleton_header {
                i := index_of_string(row, "_v");
                if i >= 0 {
                    c := row[i + 2];
                    if c >= #char "0" || c <= #char "9" {
                        if !in_singleton {
                            in_singleton = true;
                            current_singleton_row = -1;
                            if class_name_override == ""
                                class_name_override = section_name;
                            singleton_instance, namespace = write_header(section_name, class_name_override);
                            print("Generating %.jai...\n", singleton_instance);

                            name := mid(row, 0, i);
                            name = snake_from_camel(name);
                            defer free(name);

                            if !contains(singletons_to_ignore, section_name) {
                                space_at := index_of_string(row, " ");
                                call := mid(row, 0, space_at);
                                header_assign_out("    %", name);
                                for name.count..40  header_assign_out(" ");
                                header_assign_out("= %();\n", call);
                                header_load_out("#load \"%.jai\";\n", singleton_instance);
                            }
                        }
                        else if current_singleton_row == -1 {
                            current_singleton_row = row_index - 1;
                        }

                        continue;
                    }
                }
            }

            past_singleton_header = true;

            if in_singleton {
                short_name, long_name, parameters, returns, return_is_string := singleton_parts_from_flat(row);
                flat_name := long_name;

                //singleton_top_out("    %", short_name);
                //for short_name.count..50  singleton_top_out(" ");
                //singleton_top_out(":: %;\n", long_name);

                singleton_bottom_out("\n\n");
                if returns == "" {
                    singleton_bottom_out("% :: inline (%) {\n", long_name, parameters);
                    if parameters == ""
                        singleton_bottom_out("    %(%);\n", flat_name, singleton_instance);
                    else
                        singleton_bottom_out("    %(%, %);\n", flat_name, singleton_instance, strip_types(parameters));
                }
                else {
                    singleton_bottom_out("% :: inline (%) -> % {\n", long_name, parameters, returns);
                    prefix, postfix : string;
                    if return_is_string {
                        prefix = "to_string(";
                        postfix = ")";
                    }
                    if parameters == ""
                        singleton_bottom_out("    return %1%2(%3)%4;\n", prefix, flat_name, singleton_instance, postfix);
                    else
                        singleton_bottom_out("    return %1%2(%3, %4)%5;\n", prefix, flat_name, singleton_instance, strip_types(parameters), postfix);
                }
                singleton_bottom_out("}\n");
            }
            else {
                method_name, steam_api_type, flat_name, parameters, returns, return_is_string := steam_api_parts_from_flat(row);

                if steam_api_type != steam_api_current_type {
                    if steam_api_current_type != "" {
                        steam_api_out("    };\n\n");
                    }

                    steam_api_current_type = steam_api_type;
                    steam_api_out("    % : struct {\n", steam_api_type);
                }

                steam_api_out("        %", method_name);
                for method_name.count..30  steam_api_out(" ");
                steam_api_out(":: %;\n", flat_name);
            }
        }
    }

    header_assign_out("}\n");
    steam_api_out("    };\n}\n");

    write_entire_file(output_steam_api_filename, builder_to_string(*steam_api_builder));

    // @TODO assert(singleton_count == N)  make sure new versions don't add singletones that we don't know about it `steam.jai`
    // @TODO assert version in `steam_client_header.jai` matches version in `isteamclient.h`
}


write_header :: (class_name: string, class_name_override: string) -> string, string {
    namespace := mid(class_name, 1);
    instance  := snake_from_camel(namespace);
    type_name := ifx class_name_override != "" then class_name_override else class_name;

    header :: #string ___JAI
%1 : *%2;


%3_Namespace :: struct {
    // procs
    ___JAI

    singleton_top_out(header, instance, type_name, namespace);
    if instance == "steam_game_server"
        singleton_top_out("    RunCallbacks                                       :: SteamGameServer_RunCallbacks;\n");
    return instance, namespace;
}


section_name_from_instance_row :: (row: string) -> string {
    return sprint("I%", split(row, "_")[0]);
}


strip_types :: (str: string) -> string {
    builder: String_Builder;
    init_string_builder(*builder);
    defer reset(*builder);

    skip_next := false;
    skipping := false;
    for i: 0..str.count - 1 {
        if skip_next {
            skip_next = false;
            continue;
        }

        if skipping {
            if str[i] == #char "," {
                skipping = false;
                append(*builder, str[i]);
            }
        }
        else {
            if str[i] == #char ":" {
                skipping = true;
                skip_next = true;
            }
            else {
                append(*builder, str[i]);
            }
        }
    }

    return builder_to_string(*builder);
}


singleton_parts_from_flat :: (row: string) -> short_name: string, long_name: string, parameters: string, returns: string, return_is_string: bool {
    return_is_string := false;

    short_start := 0;
    forward_til(row, #char "_", #code short_start);
    short_start += 1;

    i := short_start + 1;
    forward_til(row, #char " ", #code i);

    short_name := mid(row, short_start, i);
    long_name  := mid(row, 0, i);

    forward_til(row, #char "(", #code i);
    forward_til(row, #char ",", #char ")", #code i);

    parameters : string = ---;
    returns : string = ---;

    if row[i] == #char ")" {
        parameters = "";
        returns_at := last_index_of_string(row, "->");
        if returns_at == -1
            returns = "";
        else {
            returns_at += 3;
            returns = mid(row, returns_at, row.count - 16);
        }
    }
    else {
        parameters_start := i + 1;
        if row[parameters_start] == #char " "  parameters_start += 1;
        last_char := last_index_of_string(row, "->");
        if last_char == -1 {
            last_char = last_index_of_string(row, ")");
            parameters = mid(row, parameters_start, last_char);
            returns = "";
        }
        else {
            last_char -= 2;
            parameters = mid(row, parameters_start, last_char);
            returns = mid(row, last_char + 5, row.count - 16);
        }
    }

    if returns == "*char" {
        return_is_string = true;
        returns = "string";
    }

    return short_name, long_name, parameters, returns, return_is_string;
}


steam_api_parts_from_flat :: (row: string) -> method_name: string, type_name: string, flat_name: string, parameters: string, returns: string, return_is_string: bool {
    return_is_string := false;

    _1 :: 9;
    _2 := _1 + 1;

    forward_til(row, #char "_", #code _2);

    i := _2 + 1;
    forward_til(row, #char " ", #code i);

    short_name := mid(row, _2 + 1, i);
    long_name  := mid(row, _1, i);
    if starts_with(long_name, "ISteam") {
        long_name.data += 1;
        long_name.count -= 1;
    }
    flat_name  := mid(row,  0,     i);

    forward_til(row, #char "(", #code i);
    forward_til(row, #char ",", #char ")", #code i);

    parameters : string = ---;
    returns : string = ---;

    if row[i] == #char ")" {
        parameters = "";
        returns_at := last_index_of_string(row, "->");
        if returns_at == -1
            returns = "";
        else {
            returns_at += 3;
            returns = mid(row, returns_at, row.count - 16);
        }
    }
    else {
        parameters_start := i + 1;
        if row[parameters_start] == #char " "  parameters_start += 1;
        last_char := last_index_of_string(row, "->");
        if last_char == -1 {
            last_char = last_index_of_string(row, ")");
            parameters = mid(row, parameters_start, last_char);
            returns = "";
        }
        else {
            last_char -= 2;
            parameters = mid(row, parameters_start, last_char);
            returns = mid(row, last_char + 5, row.count - 16);
        }
    }

    last_underscore : int = ---;
    if ends_with(long_name, "_c_str")
        last_underscore = long_name.count - 6;
    else
        last_underscore = last_index_of_char(long_name, #char "_");
    type_name := slice(long_name, 0, last_underscore);
    method_name := slice(long_name, last_underscore + 1, long_name.count - (last_underscore + 1));

    if returns == "*char" {
        return_is_string = true;
        returns = "string";
    }

    return method_name, type_name, flat_name, parameters, returns, return_is_string;
}



clear_output_folder :: () {
    proc :: (info: *File_Visit_Info, user_data: *void) {
        file_delete(info.full_name);
    }

    visit_files(output_autogen_folder, recursive=false, null, proc, visit_files=true, visit_directories=false);
}
