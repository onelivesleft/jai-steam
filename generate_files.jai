// This generates all the files in the `src-autogen` folder.  If the Steamworks version has changed,
// it's very likely this will break.  A manual edit before and/or after running is almost guaranteed
// to be necessary.


#import "Basic";
#import "File";
#import "File_Utilities";
#import "String";
#import "Hash_Table";

#load "src/string.jai";
#load "src/json.jai";
#load "src/singletons_v151.jai";


steam_client_header :: "src/steam_client_header.jai";

steam_api_flat :: "sdk/public/steam/steam_api_flat.h";
steam_api_json :: "sdk/public/steam/steam_api.json";
steam_client_h :: "sdk/public/steam/isteamclient.h";

autogen_folder          :: "src-autogen";
flat_filename           :: "src-autogen/api_flat.jai";
procs_internal_filename :: "src-autogen/api_flat_procs_internal.jai";
procs_exposed_filename  :: "src-autogen/api_flat_procs_exposed.jai";
types_filename          :: "src-autogen/api_flat_types_internal.jai";
steam_api_filename      :: "src-autogen/steam_api.jai";
assignments_filename    :: "src-autogen/partial_steam_assignments.jai";
loads_filename          :: "src-autogen/partial_steam_loads.jai";
callbacks_filename      :: "src-autogen/partial_steam_callbacks.jai";


// There doesn't seem to be definitions for these in Valve's flat files
kludges :: string.[
    "ISteamNetworkingConnectionSignaling",  // introduced in v1.51
    "ISteamNetworkingSignalingRecvContext", // introduced in v1.51
];


files_appended_to_flat :: string.[
    "src/steam_types.jai",
];


singletons_to_ignore :: string.[
    "ISteamController", // deprecated and conflicts with `ISteamInput`
    "ISteamNetworking", // deprecated
    "ISteamAppList",    // undocumented and conflicts with `ISteamApps`
];

server_singletons :: string.[
    "ISteamGameServer",
    "ISteamGameServerApps",
    "ISteamGameServerHTTP",
    "ISteamGameServerInventory",
    "ISteamGameServerNetworking",
    "ISteamGameServerNetworkingMessages",
    "ISteamGameServerNetworkingSockets",
    "ISteamGameServerStats",
    "ISteamGameServerUGC",
    "ISteamGameServerUtils",
    "ISteamGameServerNetworkingSockets",
];

procs_to_ignore :: string.[
    "SteamAPI_ISteamClient_GetIPCCallCount",                               // duplicate of the proc in SteamUtils
    "SteamAPI_ISteamClient_SetWarningMessageHook",                         // duplicate of the proc in SteamUtils
    "SteamAPI_ISteamNetworkingSockets_RunCallbacks",                       // handled by our own callback system
    "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString",       // duplicate of the proc in SteamNetworkingIPAddr
    "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ParseString",    // duplicate of the proc in SteamNetworkingIPAddr
    "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString",     // duplicate of the proc in SteamNetworkingIdentity
    "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ParseString",  // duplicate of the proc in SteamNetworkingIdentity
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
    .{"int iFriendFlags", "EFriendFlags iFriendFlags"},
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

enums_which_are_flags :: string.[
    "EAppOwnershipFlags",
    "EAppType",
    "EMarketingMessageFlags",
    "EChatSteamIDInstanceFlags",
    "EMarketNotAllowedReasonFlags",
    "EFriendFlags",
    "EUserRestriction",
    "ERemoteStoragePlatform",
    "EItemState",
    "EHTMLKeyModifiers",
    "EChatMemberStateChange",
    "EPersonaChange",
];

enum_type_from_sane_name : Table(string, string);


procs_builder          : String_Builder;
types_builder          : String_Builder;
steam_api_builder      : String_Builder;
singleton_builder      : String_Builder;
header_assigns_builder : String_Builder;
header_loads_builder   : String_Builder;

callbacks_builder                    : String_Builder;
callbacks_callresults                : String_Builder;
callbacks_awaiting_callresults_count : String_Builder;
callbacks_awaiting_callresults_index : String_Builder;
callbacks_callbacks                  : String_Builder;
callbacks_enum                       : String_Builder;
callbacks_struct                     : String_Builder;
callbacks_types                      : String_Builder;
callbacks_procs                      : String_Builder;

procs_out         :: #bake_arguments print_to_builder(builder = *procs_builder);
types_out         :: #bake_arguments print_to_builder(builder = *types_builder);
steam_api_out     :: #bake_arguments print_to_builder(builder = *steam_api_builder);
singleton_out     :: #bake_arguments print_to_builder(builder = *singleton_builder);
header_assign_out :: #bake_arguments print_to_builder(builder = *header_assigns_builder);
header_load_out   :: #bake_arguments print_to_builder(builder = *header_loads_builder);

output :: print_to_builder;

callback_structnames : Table(string, s32);
callresult_structnames : Table(string, bool);
callresult_procnames : Table(string, string);

current_namespace := "";


main :: () {
    if !interface_version_matches() {
        print("\e[1;31m\nVersion mismatch between steam_client_header.jai and isteamclient.h\n\e[m");
        exit(1);
    }

    init_string_builder(*procs_builder);
    init_string_builder(*types_builder);

    clear_folder();

    // flat procs
    file_data, success := read_entire_file(steam_api_flat);
    if !success {
        print("Failed to read %", steam_api_flat);
        exit(1);
    }

    print("Generating %...\n", procs_internal_filename);
    convert_steam_api_flat(file_data);

    procs := builder_to_string(*procs_builder);
    write_entire_file(procs_exposed_filename, procs);

    file_builder : String_Builder;
    init_string_builder(*file_builder);
    append(*file_builder, "#scope_module\n");
    append(*file_builder, procs);
    write_entire_file(procs_internal_filename, builder_to_string(*file_builder));


    init_string_builder(*callbacks_builder);
    init_string_builder(*callbacks_callresults);
    init_string_builder(*callbacks_awaiting_callresults_count);
    init_string_builder(*callbacks_awaiting_callresults_index);
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

    print("Generating %...\n", types_filename);
    convert_steam_api_json(file_data);

    reset(*file_builder);
    append(*file_builder, builder_to_string(*types_builder));
    write_entire_file(types_filename, builder_to_string(*file_builder));


    output(*callbacks_builder, callbacks_header,
        builder_to_string(*callbacks_callresults),
        builder_to_string(*callbacks_callbacks),
        builder_to_string(*callbacks_awaiting_callresults_count),
        builder_to_string(*callbacks_awaiting_callresults_index)
    );
    output(*callbacks_builder, "\n\n%", builder_to_string(*callbacks_enum));
    output(*callbacks_builder, "\n\n%", builder_to_string(*callbacks_struct));
    output(*callbacks_builder, "\n\n%", builder_to_string(*callbacks_types));
    output(*callbacks_builder, "\n%",   builder_to_string(*callbacks_procs));
    write_entire_file(callbacks_filename, builder_to_string(*callbacks_builder));

    // singletones
    init_string_builder(*steam_api_builder);
    init_string_builder(*singleton_builder);
    init_string_builder(*header_assigns_builder);
    init_string_builder(*header_loads_builder);

    file_data, success = read_entire_file(procs_internal_filename);
    if !success {
        print("Failed to read %", procs_internal_filename);
        exit(1);
    }

    generate_classes(file_data);

    write_entire_file(assignments_filename, builder_to_string(*header_assigns_builder));
    write_entire_file(loads_filename, builder_to_string(*header_loads_builder));

    reset(*file_builder);
    append_file(*file_builder, steam_client_header);
    append(*file_builder, #string ___JAI


#scope_export


SteamClient :: () -> *ISteamClient {
    return SteamInternal_CreateInterface(STEAMCLIENT_INTERFACE_VERSION);
}
___JAI);

    for row: split(procs, "\n") {
        end_of_name := index_of_string(row, " :: (");
        if end_of_name >= 0 {
            underscore := end_of_name;
            backward_til(row, #char "_", #code underscore);
            if !is_letter(row[underscore + 1]) {
                underscore -= 1;
                backward_til(row, #char "_", #code underscore);
            }
            if row[underscore + 1] == #char "v" {
                append(*file_builder, mid(row, 9, underscore));
                append(*file_builder, mid(row, end_of_name));
            }
            else if mid(row, underscore - 2, end_of_name) == "_c_str"
                append(*file_builder, mid(row, underscore - 1));
            else
                append(*file_builder, mid(row, underscore + 1));
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
            file_data = mid(file_data, 13);
        append(*file_builder, file_data);
    }
    write_entire_file(flat_filename, builder_to_string(*file_builder));

    print("Done!\n");
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
            if contains(proc_name, "_SteamAPI_") {
                proc_name = replace(proc_name, "_SteamAPI_", "_");
            }

            class_end := 1;
            forward_til(row, #char "_", #code class_end);
            class_name := mid(proc_name, class_end);
            belongs_to_singleton := contains(singletons_v151, class_name);

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

    output_struct :: (bracket: int, field_name: string, old_field_type: string) {
        sane_field_name := sane_name(field_name);
        field_type := old_field_type;
        if sane_field_name != field_name {

            if bracket == -1 {
                out("    union {\n");
                out("        % : %;\n", field_name, field_type);
                out("        % : %;\n", sane_name(field_name), field_type);
                out("    }\n");
            }
            else {
                out("    union {\n");
                out("        % : % %;\n", field_name,
                                        slice(field_type, bracket, field_type.count - bracket),
                                        slice(field_type, 0, bracket));
                out("        % : % %;\n", sane_name(field_name),
                                        slice(field_type, bracket, field_type.count - bracket),
                                        slice(field_type, 0, bracket));
                out("    }\n");
            }
        }
        else {
            if bracket == -1 {
                out("    % : %;\n", field_name, field_type);
            }
            else {
                out("    % : % %;\n", field_name,
                                        slice(field_type, bracket, field_type.count - bracket),
                                        slice(field_type, 0, bracket));
            }
        }
    }

    gather_enums  :: (key: string, node: JSON_Value, depth: int = 0) {
        if node.type == .ARRAY {
            for node.value.array {
                gather_enums(key, it, depth + 1);
            }
            if key =="enums" {
                for node.value.array {
                    object := it.value.object;
                    enum_name := get_str(object, "enumname");
                    table_set(*enum_type_from_sane_name, mid(enum_name, 1), enum_name);
                }
            }
        }
        else if node.type == .OBJECT {
            for node.value.object {
                gather_enums(it_index, it, depth + 1);
            }
        }
    }

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
                out("% :: struct {};\n", node.value.str);
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
                        is_flags := contains(enums_which_are_flags, enum_name);
                        if is_flags
                            out("\n% :: enum_flags u32 {\n", enum_name);
                        else
                            out("\n% :: enum s32 {\n", enum_name);
                        for enum_values {
                            object := it.value.object;
                            name := get_str(object, "name");
                            value := get_str(object, "value");
                            if is_flags {
                                number := value;
                                i, is_num := parse_int(*number);
                                if is_num && i < 0 {
                                    value = sprint("%", cast,no_check(u32)i);
                                }
                            }
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
                            output_struct(bracket, field_name, field_type);
                        }
                        out("}\n");
                    }
                }

                case "methods";
                for node.value.array {
                    object := it.value.object;
                    struct_name := get_str(object, "callresult");
                    if struct_name  {
                        proc_name := get_str(object, "methodname_flat");
                        table_set(*callresult_procnames, proc_name, struct_name);
                        table_set(*callresult_structnames, struct_name, true);
                    }
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
                            output_struct(bracket, field_name, field_type);
                        }
                        out("}\n");
                    }
                }
            }
        }
    }


    root_value : JSON_Value;
    gather_enums("", root);
    traverse_node("", root);

    for kludges  out("% :: struct {}\n", it);

    output(*callbacks_enum, "CallbackID :: enum s32 {\n");
    output(*callbacks_struct, "Callbacks : struct {\n");
    output(*callbacks_procs, "\n#scope_export\n\n\n");

    for callback_id, struct_name: callback_structnames {
        // @Note The below `table_find` assumed anything that was a CallResult was not a Callback as
        //       well... this is not the case: sometimes a thing can be both.
        //       @TODO Find a way to remove things which are only CallResults from the Callbacks list.

        //_, found := table_find(*callresult_structnames, struct_name);
        //if found  continue;

        // @Note We special case UserStatsUnloaded_t / GSStatsUnloaded_t because they share their enum ID.
        //       We also skip PS3TrophiesInstalled_t entirely (because it shares ID with GlobalStatsReceived_t,
        //       and is presumably useless at this stage)

        if struct_name != "UserStatsUnloaded_t" && struct_name != "GSStatsUnloaded_t" && struct_name != "PS3TrophiesInstalled_t"
            output(*callbacks_callbacks, "                case .%1;  for Callbacks.%1  it(<<cast(*%1) callback.m_pubParam);\n", struct_name);
        if struct_name != "GSStatsUnloaded_t" && struct_name != "PS3TrophiesInstalled_t"
            output(*callbacks_enum, "    % :: %;\n", struct_name, callback_id);
        output(*callbacks_struct, "    %1 : [..] %1_Callback;\n", struct_name);
        output(*callbacks_types, "%1_Callback :: #type (%1);\n", struct_name);
        output(*callbacks_procs, #string ___JAI
RegisterCallback :: (callback: (%1) -> ()) {
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
        call_result_id, found := table_find(*callback_structnames, struct_name);
        assert(found, sprint("Can't find callback ID for %", struct_name));
        output(*callbacks_callresults, "                    case .%1;  run_call_results(CallResults.%1, completed_call_result.m_hAsyncCall, cast(*%1) call_result, io_failure);\n", struct_name);
        output(*callbacks_awaiting_callresults_count, "    for CallResults.%1  result += 1;\n", struct_name);
        output(*callbacks_enum, "    % :: %;\n", struct_name, call_result_id);
        output(*callbacks_struct, "    %1 : Table(SteamAPICall_t, [..] %1_CallResult);\n", struct_name);
        output(*callbacks_types, "%1_CallResult :: #type (%1, bool);\n", struct_name);

        output(*callbacks_procs, #string ___JAI
RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (%1, bool) -> ()) {
    procs, found := table_find(*CallResults.%1, call_result_id);
    if !found {
        array : [..] %1_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.%1, call_result_id, procs);
    #if verbose  log("Registered CallResult: %1 = %%", call_result_id);
}

        ___JAI, struct_name);

        output(*callresult_internal_procs, #string ___JAI
run_call_results :: (callbacks: Table(SteamAPICall_t, [..] %1_CallResult), call_id: SteamAPICall_t, call_result: *%1, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

        ___JAI, struct_name);

        output(*callbacks_awaiting_callresults_index, #string ___JAI
    for CallResults.%1 {
        count += 1;
        if count >= index  return it_index, %1.k_iCallback;
    }
        ___JAI, struct_name);
    }

    output(*callbacks_struct, "}");
    output(*callbacks_enum, "}");
    output(*callbacks_procs, builder_to_string(*callresult_internal_procs));
}


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
            call_result_size := completed_call_result.m_cubParam;
			#if use_temporary_storage
				call_result = talloc(call_result_size);
			else
				call_result = alloc(call_result_size);

            #if verbose
                log("Received CallResult: [%%] %%...", completed_call_result.m_iCallback, completed_call_result.m_hAsyncCall);

			io_failure := false;
			if SteamAPI_ManualDispatch_GetAPICallResult(
				steam_pipe, completed_call_result.m_hAsyncCall, call_result, call_result_size, completed_call_result.m_iCallback, *io_failure)
			{
                #if verbose  log("Successfully got CallResult data");
                call_result_id := cast(CallResultID) completed_call_result.m_iCallback;
                if #complete call_result_id == {
%                }
			}
            else {
                #if verbose  log("Failed to get CallResult data");
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


awaiting_call_results :: (steam_pipe: HSteamPipe) -> int {
    result := 0;
%
    return result;
}


awaiting_call_results :: (steam_pipe: HSteamPipe, index: int) -> handle: SteamAPICall_t, callresult_type: s32 {
    count := -1;
%
    return 0, 0;
}

___JAI


get_str :: (object: *JSON_Object, key: string) -> string {
    value, success := table_find(object, key);
    if success  return value.value.str;
    else        return "";
}


get_str :: (object: *JSON_Object, key: string, replacements: [] Replacement) -> string {
    value, success := table_find(object, key);
    if success  {
        s := value.value.str;
        for replacements  s = replace(s, it.before, it.after);
        return s;
    }
    else
        return "";
}


get_int :: (object: *JSON_Object, key: string) -> int {
    value, success := table_find(object, key);
    if success  return cast(int) value.value.number;
    else        return 0;
}


get_obj :: (object: *JSON_Object, key: string) -> *JSON_Object {
    value, success := table_find(object, key);
    if success  return value.value.object;
    else        return null;
}


get_array :: (object: *JSON_Object, key: string) -> [..]JSON_Value {
    value, success := table_find(object, key);
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
    server_prefix           := "";

    header_assign_out("#scope_module\n\n\nassign_all_singletons :: () {\n");

    steam_api_current_type := "";

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
                    singleton_count += 1;
                    write_entire_file(sprint("%/%.jai", autogen_folder, singleton_instance), builder_to_string(*singleton_builder));
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
                reset(*singleton_builder);

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
                            name := mid(row, 9, i);
                            snake_name := snake_from_camel(name);
                            defer free(snake_name);
                            name = snake_name;
                            if ends_with(name, "__steam_api")
                                name = slice(name, 0, name.count - 11);

                            server_prefix = ifx contains(server_singletons, section_name) then "Server" else "";

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
                if contains(procs_to_ignore, long_name)  continue;

                if short_name == "Init" || short_name == "Shutdown"
                    short_name = sprint("%1%2", short_name, mid(section_name, 6));

                singleton_out("\n\n");
                if returns == "" {
                    singleton_out("%1%2 :: inline (%3) {\n", server_prefix, short_name, parameters);
                    if parameters == ""
                        singleton_out("    %(%);\n", long_name, singleton_instance);
                    else
                        singleton_out("    %(%, %);\n", long_name, singleton_instance, strip_types(parameters));
                }
                else {
                    singleton_out("%1%2 :: inline (%3) -> %4 {\n", server_prefix, short_name, parameters, returns);
                    prefix, postfix : string;
                    if return_is_string {
                        prefix = "to_string(";
                        postfix = ")";
                    }
                    if (parameters == "")
                        singleton_out("    return %1%2(%3)%4;\n", prefix, long_name, singleton_instance, postfix);
                    else
                        singleton_out("    return %1%2(%3, %4)%5;\n", prefix, long_name, singleton_instance, strip_types(parameters), postfix);
                }
                singleton_out("}\n");

                struct_name, found := table_find(*callresult_procnames, long_name);
                if found {
                    singleton_out(#string ___JAI

%1%2 :: inline (%3%4callback: (%6, bool) -> ()) -> SteamAPICall_t {
    call_result_id := %1%2(%5);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

%1%2 :: (%3%4code: Code) -> SteamAPICall_t #expand {
    call_result_id := %1%2(%5);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: %6, io_failure: bool) -> () {
                #insert,scope() code;
            }
        );
    }
    return call_result_id;
}
                    ___JAI, server_prefix, short_name, parameters, ifx parameters then ", " else "", strip_types(parameters), struct_name);
                }
            }
            else {
                method_name, steam_api_type, flat_name, parameters, returns, return_is_string := steam_api_parts_from_flat(row);

                steam_api_out("%", method_name);
                for method_name.count..30  steam_api_out(" ");
                steam_api_out(":: %;\n", flat_name);
            }
        }
    }

    header_assign_out("}\n");

    write_entire_file(steam_api_filename, builder_to_string(*steam_api_builder));

    desired_singleton_count := 38 - singletons_to_ignore.count;
    if singleton_count != desired_singleton_count {
        print("\e[1;31m\nSingleton count should be %! Has the version changed?\n\e[m", desired_singleton_count);
        exit(1);
    }
}


interface_version_matches :: () -> matches: bool {
    steam_version : string;
    jai_version : string;

    file_data, success := read_entire_file(steam_client_h);
    if !success {
        print("Failed to read %", steam_client_h);
        exit(1);
    }

    for row: split(file_data, "\n") {
        if contains(row, "#define STEAMCLIENT_INTERFACE_VERSION") {
            steam_version = split(row, "\"")[1];
            break;
        }
    }

    if steam_version == ""  return false;

    file_data, success = read_entire_file("module.jai");
    if !success {
        print("Failed to read module.jai");
        exit(1);
    }

    for row: split(file_data, "\n") {
        if contains(row, "STEAMCLIENT_INTERFACE_VERSION :: ") {
            jai_version = split(row, "\"")[1];
            break;
        }
    }

    return steam_version == jai_version;
}


write_header :: (class_name: string, class_name_override: string) -> string, string {
    namespace := mid(class_name, 1);
    instance  := snake_from_camel(namespace);
    type_name := ifx class_name_override != "" then class_name_override else class_name;

    header :: #string ___JAI
%1 : *%2;
    ___JAI

    singleton_out(header, instance, type_name);

    return instance, namespace;
}


section_name_from_instance_row :: (row: string) -> string {
    return sprint("I%", split(row, "_")[1]);
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


    i := 0;
    forward_til(row, #char " ", #code i);

    short_start := i;
    backward_til(row, #char "_", #code short_start);
    if !is_letter(row[short_start + 1]) {
        short_start -= 1;
        backward_til(row, #char "_", #code short_start);
    }
    short_start += 1;

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
            foreign_char := last_index_of_string(row, "#foreign");
            returns = mid(row, returns_at, foreign_char - 1);
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
            foreign_char := last_index_of_string(row, "#foreign");
            returns = mid(row, last_char + 5, foreign_char - 1);
        }
    }

    if returns == "SteamAPICall_t #must" {
        returns = "SteamAPICall_t";
    }
    else if returns == "*char" {
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
            foreign_char := last_index_of_string(row, "#foreign");
            returns = mid(row, returns_at, foreign_char - 1);
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
            foreign_char := last_index_of_string(row, "#foreign");
            returns = mid(row, last_char + 5, foreign_char - 1);
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



clear_folder :: () {
    proc :: (info: *File_Visit_Info, user_data: *void) {
        file_delete(info.full_name);
    }

    visit_files(autogen_folder, recursive=false, null, proc, visit_files=true, visit_directories=false);
}
