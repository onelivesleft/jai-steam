#scope_module


mid :: inline (str: string, index: int) -> string #must {
    return slice(str, index, str.count - index);
}


mid :: inline (str: string, first_index: int, last_index: int) -> string #must {
    return slice(str, first_index, last_index - first_index);
}


is_letter :: inline (char: u8) -> bool #must {
    return !(char < #char "A" || char > #char "z" || char > #char "Z" && char < #char "a");
}


strip :: inline (str: string) -> string #must {
    return trim(str, " \t\n\r");
}


lstrip :: inline (str: string) -> string #must {
    return trim_left(str, " \t\n\r");
}


forward_til :: (str: string, sentinel: u8, index: Code) #expand {
    while (#insert index) < str.count && str[(#insert index)] != sentinel {
        (#insert index) += 1;
    }
}


forward_til :: (str: string, sentinel1: u8, sentinel2: u8, index: Code) #expand {
    while (#insert index) < str.count && str[(#insert index)] != sentinel1 && str[(#insert index)] != sentinel2 {
        (#insert index) += 1;
    }
}


backward_til :: (str: string, sentinel: u8, index: Code) #expand {
    while (#insert index) > 0 && str[(#insert index)] != sentinel {
        (#insert index) -= 1;
    }
}


contains :: (haystack: [] string, needle: string) -> bool #must {
    for haystack  if it == needle  return true;
    return false;
}


is_lower :: inline (c: u8) -> bool {
    return c >= #char "a" && c <= #char "z";
}


is_upper :: inline (c: u8) -> bool {
    return c >= #char "A" && c <= #char "Z";
}


snake_from_camel :: inline (str: string, preserve_caps := false) -> string #must {
    if str == ""  return "";

    builder : String_Builder;
    init_string_builder(*builder);
    defer reset(*builder);

    inside_caps := false;

    for i: 0..str.count - 1 {
        c := str[i];
        if is_upper(c) {
            if !inside_caps || i < str.count - 1 && is_lower(str[i + 1]) {
                inside_caps = true;
                if i > 0  append(*builder, "_");
                if preserve_caps
                    append(*builder, c);
                else
                    append(*builder, to_lower(c));
            }
            else
                append(*builder, to_lower(c));
        }
        else {
            inside_caps = false;
            append(*builder, c);
        }
    }

    return builder_to_string(*builder);
}


parse_unicode :: (str: string) -> result: u16, success: bool #must {
	val, success, remainder := string_to_int(str, base = 16);
	if !success || val > 0xFFFF || remainder.count  return 0, false;

	return cast(u16) val, true;
}


encode_utf8 :: (val: u16, result: *u8) -> len: u8 {
	if val & 0xF800 {
		result[0] = xx (0xE0 | ((val & 0xF000) >> 12));
		result[1] = xx (0x80 | ((val & 0x0FC0) >> 6));
		result[2] = xx (0x80 | (val & 0x003F));
		return 3;
	} else if val & 0x0F80 {
		result[0] = xx (0xC0 | ((val & 0x0FC0) >> 6));
		result[1] = xx (0x80 | (val & 0x003F));
		return 2;
	} else {
		result[0] = xx (val & 0x7F);
		return 1;
	}
}


append_file :: (builder: *String_Builder, filepath: string) {
    file_data, success := read_entire_file(filepath);
    if !success {
        print("Failed to read %", filepath);
        exit(1);
    }
    file_data = lstrip(file_data);
    append(builder, file_data);
}
