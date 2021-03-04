// based on https://github.com/rluba/jason


#scope_module


JSON_Type :: enum u8 {
    NULL    :: 0;
    BOOLEAN :: 1;
    NUMBER  :: 3;
    STRING  :: 2;
    ARRAY   :: 5;
    OBJECT  :: 4;
}


JSON_Value :: struct {
    type : JSON_Type;
    value: union {
        boolean: bool;
        number : float64;
        str    : string;
        array  : [..] JSON_Value;
        object : *JSON_Object;
    };
}


JSON_Object :: Table(string, JSON_Value);


json_parse_string :: (content: string) -> JSON_Value, success: bool {
    result, remainder, success := parse_value(content);
    return result, success;
}


json_value :: (str: string) -> JSON_Value {
    val: JSON_Value;
    val.type = JSON_Type.STRING;
    val.value.str = str;
    return val;
}


json_value :: (obj: *JSON_Object) -> JSON_Value {
    val: JSON_Value;
    val.type = JSON_Type.OBJECT;
    val.value.object = obj;
    return val;
}


#scope_file


expect_and_slice :: (str: string, expected: string) -> remainder: string, success: bool {
    if str.count < expected.count || slice(str, 0, expected.count) != expected {
        print("Unexpected token. Expected \"%\" but got: %", expected, str);
        return str, false;
    }

    remainder := advance(str, expected.count);
    return remainder, true;
}


parse_value :: (to_parse: string) -> JSON_Value, remainder: string, success: bool {
    result: JSON_Value;
    remainder := lstrip(to_parse);
    success := false;
    if remainder[0] == {
        case #char "n";
        remainder, success = expect_and_slice(remainder, "null");
        result.type = .NULL;

        case #char "t";
        remainder, success = expect_and_slice(remainder, "true");
        result.type = .BOOLEAN;
        result.value.boolean = true;

        case #char "f";
        remainder, success = expect_and_slice(remainder, "false");
        result.type = .BOOLEAN;

        case #char "\"";
        str: string;
        str, remainder, success = parse_string(remainder);
        result = json_value(str);

        case #char "[";
        result.type = .ARRAY;
        result.value.array, remainder, success = parse_array(remainder);

        case #char "{";
        obj := cast(*JSON_Object) alloc(size_of(JSON_Object));
        <<obj, remainder, success = parse_object(remainder);
        result = json_value(obj);

        case;
        result.type = .NUMBER;
        result.value.number, success, remainder = string_to_float64(remainder);
    }

    return result, remainder, success;
}


parse_array:: (str: string) -> result: [..] JSON_Value, remainder: string, success: bool {
    assert(str[0] == #char "[", "Invalid object start %", str);
    remainder := advance(str);
    result: [..] JSON_Value;
    remainder = lstrip(remainder);
    if remainder[0] == #char "]" {
        remainder = advance(remainder);
        return result, remainder, true;
    }

    while true {
        value: JSON_Value;
        success: bool;
        value, remainder, success = parse_value(remainder);
        if !success  return result, remainder, false;

        array_add(*result, value);

        remainder = lstrip(remainder);
        if remainder[0] != #char ","  break;

        remainder = advance(remainder);
        remainder = lstrip(remainder);
    }

    if remainder[0] != #char "]"  return result, remainder, false;

    remainder = advance(remainder);
    return result, remainder, true;
}


parse_object :: (str: string) -> result: JSON_Object, remainder: string, success: bool {
    assert(str[0] == #char "{", "Invalid object start %", str);
    remainder := advance(str);
    result: JSON_Object;
    remainder = lstrip(remainder);
    if remainder[0] == #char "}" {
        remainder = advance(remainder);
        return result, remainder, true;
    }

    init(*result, 32);
    while true {
        if remainder[0] != #char "\""    return result, remainder, false;

        key: string;
        value: JSON_Value;
        success: bool;
        key, remainder, success = parse_string(remainder);
        if !success  return result, remainder, false;

        existing := table_find_pointer(result, key);
        if existing  return result, remainder, false;

        remainder = lstrip(remainder);
        if remainder[0] != #char ":"  return result, remainder, false;

        remainder = advance(remainder);
        remainder = lstrip(remainder);
        value, remainder, success = parse_value(remainder);
        if !success  return result, remainder, false;

        table_add(*result, key, value);

        remainder = lstrip(remainder);
        if remainder[0] != #char ","  break;

        remainder = advance(remainder);
        remainder = lstrip(remainder);
    }

    if remainder[0] != #char "}"  return result, remainder, false;

    remainder = advance(remainder);
    return result, remainder, true;
}


parse_string :: (str: string) -> result: string, remainder: string, success: bool {
    assert(str[0] == #char "\"", "Invalid string start %", str);
    inside := advance(str);
    needsUnescape := false;
    while inside[0] != #char "\"" {
        if inside.count < 2  return "", str, false;
        if inside[0] == #char "\\" {
            needsUnescape = true;
            if inside.count < 2  return "", str, false;
            advance(*inside);
        }
        advance(*inside);
    }

    length := inside.data - str.data - 1;
    result := slice(str, 1, length);
    if needsUnescape {
        success: bool;
        result, success = unescape(result);
        if !success  return "", str, false;
    } else {
        result = copy_string(result);
    }

    remainder := slice(str, length + 2, str.count - length - 2);
    return result, remainder, true;
}


unescape :: (str: string) -> result: string, success: bool {
    result := alloc_string(str.count);
    rc := 0;
    for i: 0..str.count - 1 {
        if str[i] != #char "\\" {
            // Check for invalid characters for JSON
            if str[i] < 0x20  return "", false;

            result[rc] = str[i];
            rc += 1;
        } else {
            if i == str.count - 1  return "", false;

            i += 1;
            if str[i] == {
                case #char "\""; #through;
                case #char "/";  #through;
                case #char "\\";
                result[rc] = str[i];
                rc += 1;

                case #char "b";
                result[rc] = 0x08;
                rc += 1;

                case #char "f";
                result[rc] = 0x0c;
                rc += 1;

                case #char "n";
                result[rc] = #char "\n";
                rc += 1;

                case #char "r";
                result[rc] = #char "\r";
                rc += 1;

                case #char "t";
                result[rc] = #char "\t";
                rc += 1;

                case #char "u";
                if i + 4 >= str.count  return "", false;

                unicode_char, success := parse_unicode(slice(str, i + 1, 4));
                if !success  return "", false;

                utf8_len := encode_utf8(unicode_char, *(result.data[rc]));
                rc += utf8_len;
                i += 4;

                case;
                return "", false;
            }
        }
    }

    result.count = rc;
    return result, true;
}
