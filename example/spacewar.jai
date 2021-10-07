// @Steam tags denote example API usage

verbose :: true;
#import "Steam"(verbose = verbose);  // @Steam

Simp  :: #import "Simp";
#import "Input";
#import "GL" ; // For glBlend

#import "Basic";
#import "Compiler";
#import "Math";
#import "Random";
#import "String";
#import "Window_Creation";

#load "random_names.jai";  // @TODO remove


// @TODO
// [ ] strip out extraneous logging and debug stuff
// [ ] sfx, or: in space no-one can hear you
// [ ] fx: death explosion, shot explosion
// [ ] particles
// [ ] background stars
// [ ] networking
// [ ] scoring
// [ ] steam status
// [ ] window sizing
// [ ] leaderboards
// [ ] stats / achievements
// [.] menu
// [.] multiple players
// [.] names (currently janky)
// [x] remote storage (player color)
// [x] keyboard controls
// [x] color selection
// [x] get better font
// [x] dying
// [x] check how to glBlend in Simp

steam_appid :: 480;

width  :: 1280;
height :: 768;
margin :: height / 5;

window: Window_Type;
window_width  : s32 = width;
window_height : s32 = height;

render_width  : s32 = width;
render_height : s32 = height;

ship_length :: height / 36;
ship_width  :: ship_length / 2;
ship_cut    :: 0.75;

font_height_game :: height / 64;
font_height_menu :: height / 16;
font_height_list :: height / 32;

players : [MAX_PLAYERS] Player;
MAX_PLAYERS :: 12;
player_count := 0;
me : *Player;

shots : [MAX_SHOTS] Shot;
MAX_SHOTS :: 1024;
next_shot_index := 0;

now : float64;
dt : float32;

quit := false;
mouse_x: int;
mouse_y: int;
mouse_ok: bool;

debug_triangles : [1] Triangle = .[Triangle.{ // @TODO remove
    .{400, 100, 0},
    .{300, 200, 0},
    .{450, 300, 0},
}];



main :: () {
    if !InitSteam() {  // @Steam
        log_error("Failed to initialize Steam");
        exit(1);
    }

    init();

    while !quit {
        prev_time := now;
        now = get_time();
        dt = cast(float32) (now - prev_time);

        RunCallbacks();  // @Steam
        handle_window_events();
        handle_steam_input();
        run_scheduled_tasks();

        one_game_tick();
        if in_menu  one_menu_tick();

        draw_one_frame();

        reset_temporary_storage();
        sleep_milliseconds(cast,trunc(s32)(max(1.0, 10 - dt / 1000)));
    }

    run_scheduled_tasks(force = true);

    clean := ShutdownSteam(timeout = 5.0); // @Steam
    if !clean  log_error("Steam did not shut down cleanly!");
}


init :: () {
    window = create_window(window_width, window_height, "Spacewar");
    Simp.simp_init(window, window_width, window_height, render_width, render_height);

    random_seed(xx get_time());
    init_fonts();

    me = *players[0];
    handle := GetSteamID();  // @Steam
    name   := GetPersonaName(); // @Steam
    make_player(me, handle, name, .{width / 4, height / 2}, .{1, 0.5, 0, 0});
    respawn_player(me);
    load_settings();

    register_steam_input();
    create_lobby();
    request_lobbies();
}


make_player :: (player: *Player, handle: CSteamID, name: string, position: Vector2, color: Vector4) {
    player.handle = handle;
    player.position = position;
    player.color = color;

    memcpy(*player.buffer, name.data, Player.MAX_NAME_LENGTH);
    player.name.data = *player.buffer[0];
    player.name.count = min(name.count, Player.MAX_NAME_LENGTH);

    player.label.width = Simp.get_string_width_in_pixels(font_game, player.name);

    player_count += 1;
}


add_player :: (handle: CSteamID, name: string, position: Vector2, color: Vector4) {
    make_player(*players[player_count], handle, name, position, color);
}


remove_player :: (player_index: int) {
    assert(player_index != 0, "Cannot remove local player");
    if player_index < player_count - 1
        players[player_index] = players[player_count - 1];
    player_count -= 1;
}


current_hue : float;
player_color_randomized_at : float64 = 0;

randomize_player_color :: () {
    hue := current_hue;
    while abs(hue - current_hue) < 0.2
        hue = random_get_zero_to_one();
    current_hue = hue;
    set_player_color(me, rgb_from_hsl(hue, 1.0, 0.6));
    player_color_randomized_at = now;
}


set_player_color :: (player: *Player, color: Vector4) {
    player.color = color;
    player.shot_color = color;
}


kill_player :: (player: *Player, culprit: *Player) {
    //if player == culprit:
    //    reduce_score(player);
    //else:
    //    increase_score(culprit);
    respawn_player(player);
}


respawn_player :: (player: *Player) {
    // @TODO find position far from others
    initial_velocity :: 0.75;
    if random_get() % 2 {
        player.position = .{width / 4, height / 2};
        player.velocity = .{0, +initial_velocity};
    }
    else {
        player.position = .{width - width / 4, height / 2};
        player.velocity = .{0, -initial_velocity};
    }
}


handle_window_events :: () {
    update_window_events();

    mouse_x, mouse_y, mouse_ok = get_mouse_pointer_position(window, false);
    mouse_y = height - mouse_y;

    for event: events_this_frame {
        if event.type == {
            case .QUIT;
            quit = true;

            case .KEYBOARD;
            if event.key_pressed {
                if event.key_code == {
                    case .F6; // @TODO remove
                    quit = true;

                    case .MOUSE_BUTTON_LEFT;  // @TODO remove
                    randomize_debug_triangle();

                    case .ESCAPE;
                    if in_menu  menu_cancel();
                    else        set_menu(true);
                }
            }

            check_input :: (key_code: Key_Code, proc: () -> (), key: *bool) #expand {
                if `event.key_code == key_code {
                    if in_menu {
                        if `event.key_pressed  proc();
                    }
                    else
                        <<key = cast(bool) `event.key_pressed;
                }
            }

            check_input(.ARROW_UP,    menu_up,     *keys.up);
            check_input(.ARROW_DOWN,  menu_down,   *keys.down);
            check_input(.ARROW_LEFT,  menu_left,   *keys.left);
            check_input(.ARROW_RIGHT, menu_right,  *keys.right);
            check_input(.ENTER,       menu_select, *keys.fire);
        }
    }
}


run_scheduled_tasks :: (force := false) {
    if failed_load_settings_at {
        setting_load_interval :: 0.5;
        load_settings_attempts -= 1;
        if load_settings_attempts {
            if force || now > failed_load_settings_at + setting_load_interval {
                load_settings();
            }
        }
        else {
            failed_load_settings_at = 0;
            randomize_player_color();
        }
    }

    if player_color_randomized_at {
        setting_store_interval :: 5.0;
        if force || now > player_color_randomized_at + setting_store_interval {
            store_settings();
            player_color_randomized_at = 0;
        }
    }
}


one_game_tick :: () {
    for * player, player_index: active_players {
        using player;

        c := cos(rotation);
        s := sin(rotation);

        acceleration : Vector2 = ---;
        k := dt * ifx thrusting > 0 then FORWARD_THRUST * thrusting else REVERSE_THRUST * thrusting;
        acceleration.x = k * c;
        acceleration.y = k * s;

        velocity += acceleration;
        attract(the_planet, player);
        position += velocity;

        if player_inside_planet(player)
            kill_player(player, player);

        wrap_object(player);

        rotation = cast(float) fmod(rotation - dt * turning * TURN_RATE, TAU);

        label.actual_position = lerp(label.actual_position, position, dt * 2);
        end := label.actual_position;
        end.x += label.width;
        d, dx, dy := d2_point_line_segment(position, label.actual_position, end);
        minimum :: ship_length;
        min_squared :: minimum * minimum;
        if d < min_squared {
            theta := atan2(dy, dx);
            label.actual_position.x = position.x + cos(theta) * minimum;
            label.actual_position.y = position.y + sin(theta) * minimum;
        }

        label.visual_position.x = label.actual_position.x;
        label.visual_position.y = label.actual_position.y;
    }

    for * shot: shots {
        using shot;

        if fired_at {
            if now > fired_at + FUSE {
                fired_at = 0;
            }
            else {
                old_position := shot.position;
                position += velocity;
                attract(the_planet, shot);

                if point_inside_planet(shot.position) {
                    fired_at = 0;
                    continue;
                }

                if now > fired_at + ARMING_DELAY {
                    for * player: active_players {
                        if line_segment_inside_player(old_position, shot.position, player) {
                            kill_player(player, shot.player);
                            break;
                        }
                    }
                }
                wrap_object(shot);
            }
        }
    }
}


one_menu_tick :: () {
    menu_ship_rotation += menu_ship_torque * dt;
    menu_ship_torque *= menu_ship_dampening;
}


wrap_object :: (using object: *Object) {
    if position.x > width   position.x -= width;
    else if position.x < 0  position.x += width;

    if position.y > height  position.y -= height;
    else if position.y < 0  position.y += height;
}


fire_shot :: (using player: *Player) {
    if last_fired_at + LASER_COOLDOWN > now  return;

    last_fired_at = now;

    c := cos(rotation);
    s := sin(rotation);

    shots[next_shot_index].position.x = position.x + c * ship_length * 0.5;
    shots[next_shot_index].position.y = position.y + s * ship_length * 0.5;
    shots[next_shot_index].velocity.x = velocity.x + c * Shot.MUZZLE_VELOCITY;
    shots[next_shot_index].velocity.y = velocity.y + s * Shot.MUZZLE_VELOCITY;
    shots[next_shot_index].player = player;
    shots[next_shot_index].fired_at = now;


    next_shot_index = (next_shot_index + 1) % MAX_SHOTS;
}


attract :: (planet: Planet, object: *Object) {
    d := planet.position - object.position;

    m := sqrt(d.x * d.x + d.y * d.y);
    f := sqrt(m) * planet.gravity;

    theta := atan2(d.y, d.x);
    c := cos(theta);
    s := sin(theta);

    object.velocity.x = object.velocity.x + c * f;
    object.velocity.y = object.velocity.y + s * f;
}



// :types



ship : Ship(ship_length, ship_width, ship_cut);
menu_scale :: 3;
ship_menu : Ship(ship_length * menu_scale, ship_width * menu_scale, ship_cut);
laser_bolt : Ship(ship_length / 5, ship_length / 5, 1);
the_planet :: Planet.{position = .{x = width / 2, y = height / 2}, radius = width / 20, gravity = 0.00025};


Object :: struct {
    position : Vector2;
    velocity : Vector2;
}


Ship :: struct(length: float, width: float, cut: float) {
    triangles :: Triangle.[
        .{.{length * 0.5, 0, 0}, .{-length * 0.5, -width * 0.5, 0}, .{-length * 0.5 * cut, 0, 0}},
        .{.{length * 0.5, 0, 0}, .{-length * 0.5, +width * 0.5, 0}, .{-length * 0.5 * cut, 0, 0}},
    ];
}


Player :: struct {
    using base: Object;

    FORWARD_THRUST : float : 0.5;
    REVERSE_THRUST : float : 0.2;
    TURN_RATE      : float : 1.0;
    LASER_COOLDOWN : float64 : 1.0;

    MAX_NAME_LENGTH :: 16;
    buffer     : [MAX_NAME_LENGTH] u8;  // @TODO move to player_buffer
    name       : string;
    label      : Label;
    handle     : CSteamID;  // @Steam
    color      : Vector4;
    shot_color : Vector4;
    score      : int;

    rotation : float;

    last_fired_at : float64;

    turning : float;
    thrusting : float;
    pausing : bool;

    controller : InputHandle_t;  // @Steam
}


is_me :: (player: *Player) -> bool {
    return player.handle == me.handle;
}


Shot :: struct {
    using base: Object;

    MUZZLE_VELOCITY :: 2.0;
    ARMING_DELAY    :: 0.5;
    FUSE            :: 100.0;  // @TODO 100 is for testing

    fired_at : float64;
    player :   *Player;
}


Planet :: struct {
    using base: Object;

    gravity : float;
    radius : float;
}


Label :: struct {
    visual_position : Vector3;
    actual_position : Vector2;
    width : int;
}


Triangle :: struct {
    p0: Vector3;
    p1: Vector3;
    p2: Vector3;

    #place p0;
    points : [3] Vector3;
}


keys : struct {
    up    : bool;
    down  : bool;
    left  : bool;
    right : bool;
    fire  : bool;
}



// :menu



in_menu : bool = true;
steam_overlay_is_active : bool;


set_menu :: (menu_should_be_active: bool) {
    if menu_should_be_active {
        if !in_menu {
            in_menu = true;
            current_menu = .MAIN;
            menu_current_index[Menu.MAIN] = 0;
        }
    }
    else {
        in_menu = false;
    }
}


Menu :: enum {
    MAIN;
    LIST;
}

current_menu := Menu.MAIN;

// @TODO refactor into AoS
menu_current_index : [2] int;
menu_item_count := int.[main_menu.count, 0];
menu_first_index := int.[0, -1];

scoreboard_page :: -1;
menu_list_page := scoreboard_page; // -1 = Scoreboard, 0+ = Lobbies
menu_list_page_last_index := 0;
list_per_page :: 12;

lobby_from_menu_index :: inline (menu_index: int) -> Lobby, found: bool {
    lobby_index := menu_index + list_per_page * menu_list_page;
    found := lobby_index >= 0 && lobby_index < lobby_list.count;
    if found
        return lobby_list[lobby_index], true;
    else {
        lobby : Lobby;
        return lobby, false;
    }
}

menu_ship_rotation  := 0.0;
menu_ship_torque    := 0.0;
menu_ship_dampening :: 0.99;
menu_ship_force     :: TAU / 2;

menu_input_state : enum_flags u8 {
    UP;
    DOWN;
    LEFT;
    RIGHT;
    SELECT;
    CANCEL;
};


bump_menu_ship :: (sgn: float) {
    menu_ship_torque += sgn * menu_ship_force * (random_get_zero_to_one() + 0.5);
}

menu_up :: () {
    bump_menu_ship(+1);

    if menu_current_index[current_menu] == menu_first_index[current_menu]
        menu_current_index[current_menu] = menu_item_count[current_menu] - 1;
    else
        menu_current_index[current_menu] -= 1;
}

menu_down :: () {
    bump_menu_ship(-1);

    if menu_current_index[current_menu] == menu_item_count[current_menu] - 1
        menu_current_index[current_menu] = menu_first_index[current_menu];
    else
        menu_current_index[current_menu] += 1;
}

menu_left :: () {
    bump_menu_ship(+1);

    if current_menu == .MAIN  return;

    if menu_list_page > -1 {
        menu_list_page -= 1;
        update_list_menu();
    }
    else
        current_menu = .MAIN;
}

menu_right :: () {
    bump_menu_ship(-1);

    if current_menu == .MAIN {
        current_menu = .LIST;
        return;
    }

    if menu_list_page < menu_list_page_last_index {
        menu_list_page += 1;
        update_list_menu();
    }
}

menu_select :: () {
    if current_menu == .MAIN {
        menu_item := main_menu[menu_current_index[current_menu]];
        if menu_item == {
            case .PLAY;
            set_menu(false);

            case .COLOR;
            randomize_player_color();

            case .QUIT;
            quit = true;
        }
    }
    else { // current_menu == .LIST
        menu_index := menu_current_index[current_menu];
        if menu_index == -1 {
            if hosted_lobby {
                set_lobby_type(!hosted_lobby_is_public);
            }
            else {
                // @TODO disconnect
            }
        }
        else {
            menu_item := main_menu[menu_index];
            if menu_list_page == scoreboard_page {
                // @TODO kick(menu_item)
            }
            else { // lobby list
                lobby, ok := lobby_from_menu_index(menu_index);
                if ok  join_lobby(lobby.handle);
            }
        }
    }
}


menu_cancel :: () {
    set_menu(false);
}


update_list_menu :: () {
    menu_list_page_last_index = xx ceil(cast(float)lobby_list.count / list_per_page) - 1;
    menu_list_page = min(menu_list_page, menu_list_page_last_index);

    if menu_list_page == scoreboard_page {
        menu_item_count[Menu.LIST] = max(1, current_lobby.player_count);
    }
    else {
        if menu_list_page < menu_list_page_last_index
            menu_item_count[Menu.LIST] = list_per_page;
        else
            menu_item_count[Menu.LIST] = lobby_list.count % list_per_page;

    }
    menu_current_index[Menu.LIST] = clamp(menu_current_index[Menu.LIST], -1, menu_item_count[Menu.LIST] - 1);
}


Menu_Item :: struct {
    id     : Menu_ID;
    label  : string;
    y      : int;
}


Menu_ID :: enum {
    PLAY;
    COLOR;
    QUIT;
}

menu_items :: Menu_Item.[
    .{ .PLAY,  "PLAY",  0 },
    .{ .COLOR, "COLOR", 0 },
    .{ .QUIT,  "QUIT",  0 },
];

main_menu :: Menu_ID.[
    .PLAY,
    .COLOR,
    .QUIT,
];


get_menu_label :: (menu_item: Menu_Item) -> string {
    return menu_item.label;
}

/*  // @TODO remove or use
find_index :: (index: Menu_ID, menu: [] Menu_ID) -> int {
    for menu  if it == index  return it_index;
    return 0; // never happens
}

color_menu_index         :: #run find_index(.COLOR,  main_menu);
*/

#run {
    for menu_items  if it.id != xx it_index
        compiler_report("menu_items array must be in same order as Menu_ID enum");
    if menu_items.count != type_info(Menu_ID).values.count
        compiler_report("menu_items array must have same items as Menu_ID enum");
}



// :drawing



color_background          :: Vector4.{.02, .02, .03, 0.51};
color_menu_text           :: Vector4.{1, 1, 1, 1};
color_menu_selected_text  :: Vector4.{0, 0, 0, 1};
color_menu_selected_fill  :: Vector4.{1, 1, 1, 1};
color_menu_label          :: Vector4.{0.5, 0.5, 0.5, 1};

draw_one_frame :: () {
    Simp.update_window(window, window_width, window_height, render_width, render_height);

    if !steam_overlay_is_active {
        Simp.set_shader_for_color();
        if !in_menu {
            glEnable(GL_BLEND);
            glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
            Simp.immediate_quad(0, 0, width, height, color_background);
        }

        for player: active_players
            draw_player(player);

        for shot: shots
            if shot.fired_at
                draw_shot(shot);

        draw_planet(the_planet);


        if in_menu {
            draw_menu();
        }
        else {
            for player: active_players
                draw_player_name(player);
        }

        //draw_debug_info();
    }

    Simp.swap_buffers(window);
}


draw_menu :: () {
    left :: margin;
    right :: width - margin / 2;
    top  :: height - left;
    font_width_offset  :: -5;
    font_height_offset :: -9;
    spacing :: font_height_menu / 4;
    padding :: font_height_menu / 6;
    ship_offset :: -(1.0 * font_height_menu);

    list_width :: left * 2;
    list_top   :: top + (font_height_menu - font_height_list);
    list_left  :: right - list_width;
    list_header_gap :: font_height_list * 2;

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    Simp.immediate_quad(0, 0, width, height, .{0, 0, 0, 0.51});

    x := left;
    y := top;

    arrow_spacing :: 0.5 * (margin - ship_length * 4);

    if menu_list_page < menu_list_page_last_index
        draw_arrow(right + arrow_spacing, 0.5 * (height - ship_length), true);
    if menu_list_page > scoreboard_page
        draw_arrow(list_left - arrow_spacing, 0.5 * (height - ship_length), false);


    // highlight box

    if current_menu == {
        case .MAIN;
        for menu_index: 0 .. main_menu.count - 1 {
            menu_item := menu_items[main_menu[menu_index]];
            if menu_item.y != 0  y = menu_item.y;
            if menu_index == menu_current_index[Menu.MAIN] {
                label := get_menu_label(menu_item);
                w := Simp.get_string_width_in_pixels(font_menu, label);
                x0 := cast(float)(x - padding);
                y0 := cast(float)(y - padding);
                x1 := cast(float)(x + w + padding + font_width_offset);
                y1 := cast(float)(y + font_height_menu + padding + font_height_offset);
                Simp.immediate_quad(x0, y0, x1, y1, color_menu_selected_fill);
                draw_triangles(v2(x0 + ship_offset, y + font_height_menu * 0.5),
                            menu_ship_rotation,
                            ship_menu.triangles, me.color);
                break;
            }
            y -= (font_height_menu + spacing);
        }

        case .LIST;
        x = list_left;
        y = list_top;

        draw_menu_list_block :: (x: int, y: int) {
                    x0 := cast(float)(x - padding);
                    y0 := cast(float)(y - padding);
                    x1 := cast(float)(x + list_width + padding + font_width_offset);
                    y1 := cast(float)(y + font_height_list + padding + font_height_offset);
                    Simp.immediate_quad(x0, y0, x1, y1, color_menu_selected_fill);
                    draw_triangles(v2(x0 + ship_offset, y + font_height_list * 0.5),
                                   menu_ship_rotation,
                                   ship_menu.triangles, me.color);
        }

        if menu_current_index[Menu.LIST] == -1 {
            draw_menu_list_block(x, y);
        }
        else {
            y -= (font_height_list + list_header_gap + spacing);
            for menu_index: 0 .. menu_item_count[Menu.LIST] - 1 {
                if menu_index == menu_current_index[Menu.LIST] {
                    draw_menu_list_block(x, y);
                    break;
                }
                y -= (font_height_list + spacing);
            }
        }
    }


    //  menu text (draw all text after all triangles, so as to only swap shaders once)

    x = left;
    y = top;

    for menu_index: 0 .. main_menu.count - 1 {
        menu_item := menu_items[main_menu[menu_index]];
        if menu_item.y != 0  y = menu_item.y;
        label := get_menu_label(menu_item);
        if current_menu == .MAIN && menu_index == menu_current_index[Menu.MAIN]
            draw_menu_text(label, x, y, color_menu_selected_text);
        else
            draw_menu_text(label, x, y);
        y -= (font_height_menu + spacing);
    }

    x = list_left;
    y = list_top;

    header_selected := current_menu == .LIST && menu_current_index[Menu.LIST] == -1;
    color := ifx header_selected then color_menu_selected_text else color_menu_text;

    if hosted_lobby {
        draw_list_text("Hosting", x, y, color);
        lobby_type_text := ifx hosted_lobby_is_public then "Public" else "Friends";
        width := Simp.get_string_width_in_pixels(font_list, lobby_type_text);
        draw_list_text(lobby_type_text, x + list_width - width, y, color);
    }
    else if header_selected {
        draw_list_text("Disconnect", x, y, color);
    }
    else {
        draw_list_text("Joined:", x, y, color);
        width := Simp.get_string_width_in_pixels(font_list, current_lobby.host_name);
        draw_list_text(current_lobby.host_name, x + list_width - width, y, color);
    }

    y -= list_header_gap;
    if menu_list_page == scoreboard_page {
        draw_list_text("Player", x, y, color_menu_label);
        score_text :: "Score";
        width := Simp.get_string_width_in_pixels(font_list, score_text);
        draw_list_text(score_text, x + list_width - width, y, color_menu_label);
    }
    else {
        draw_list_text("Lobbies", x, y, color_menu_label);
    }

    y -= (font_height_list + spacing);

    draw_lobby_entry :: (lobby: Lobby, x: int, y: int, color := color_menu_text) {
        draw_list_text(lobby.host_name, x, y, color);
        player_count := tprint("%/%", lobby.player_count, MAX_PLAYERS);
        width := Simp.get_string_width_in_pixels(font_list, player_count);
        draw_list_text(player_count, right - width, y, color);
        // @TODO ping
    }

    draw_player_entry :: (player: *Player, x: int, y: int, selected: bool) {
        color := ifx selected then color_menu_selected_text else color_menu_text;
        draw_list_text(player.name, x, y, color);
        right_text := ifx hosted_lobby && selected && !is_me(player)
                      then "Kick" else tprint("%", player.score);
        width := Simp.get_string_width_in_pixels(font_list, right_text);
        draw_list_text(right_text, right - width, y, color);
    }


    if menu_list_page == scoreboard_page {
        // @TODO sort by high score (but disable sorting while menu open)
        for menu_index: 0 .. menu_item_count[Menu.LIST] - 1 {
            draw_player_entry(*players[menu_index], x, y, current_menu == .LIST && menu_index == menu_current_index[Menu.LIST]);
        }
    }
    else {
        for menu_index: 0 .. menu_item_count[Menu.LIST] - 1 {
            lobby, ok := lobby_from_menu_index(menu_index);
            if ok {
                if current_menu == .LIST && menu_index == menu_current_index[Menu.LIST]
                    draw_lobby_entry(lobby, x, y, color_menu_selected_text);
                else
                    draw_lobby_entry(lobby, x, y);
            }
            else
                break;

            y -= (font_height_list + spacing);
        }
    }

    if menu_list_page_last_index >= 0 {
        y = height - top - (font_height_list + spacing);
        page := ifx menu_list_page >= 0 then tprint("%/%", menu_list_page + 1, menu_list_page_last_index + 1)
                                        else "Lobbies >";
        w := Simp.get_string_width_in_pixels(font_list, page);
        x = list_left + list_width / 2 - w / 2;
        draw_list_text(page, x, y, color_menu_label);
    }
}


wrap_deltas :: Vector2.[
    .{0, 0},
    .{-width, 0},
    .{2 * width, 0},
    .{-width, -height},
    .{0, 2 * height},
];


draw_player :: (player: Player) {
    draw_triangles(player.position, player.rotation, ship.triangles, player.color);
}


draw_player_name :: (player: Player) {
    //offset :: Vector3.{ship_width, ship_width, 0};
    color := player.color;
    color.w = 0.5;
    draw_text(player.name, player.label.visual_position, color);
}


draw_shot :: (shot: Shot) {
    rotation := random_get_zero_to_one() * TAU;
    draw_triangles(shot.position, rotation, laser_bolt.triangles, shot.player.shot_color);
}


draw_arrow :: (x: float, y: float, pointing_right: bool, color := color_menu_text) {
    length :: ship_length;
    half_height :: ship_length;
    t :: Triangle.[
        .{.{length * 0.5, 0, 0}, Vector3.{-length * 0.5, -half_height, 0}, Vector3.{-length * 0.125, 0, 0}},
        .{.{length * 0.5, 0, 0}, Vector3.{-length * 0.5, +half_height, 0}, Vector3.{-length * 0.125, 0, 0}},
    ];

    r := ifx pointing_right then 0 else PI;
    c := color;
    c.w = abs(sin(cast(float32) now));
    draw_triangles(v2(x, y), r, t, c);
}


draw_planet :: (planet: Planet) {
    SLICES :: 21;

    t : Triangle;
    t.p0 = v3(planet.position);

    step :: TAU / SLICES;
    radius := planet.radius + random_get_zero_to_one() * 1.5;
    noise := random_get_zero_to_one() / TAU;
    t.p1.x = radius * cos(-step + noise) + t.p0.x;
    t.p1.y = radius * sin(-step + noise) + t.p0.y;

    for i: 0 .. SLICES {
        t.p2 = t.p1;
        t.p1.x = radius * cos(i * step + noise) + t.p0.x;
        t.p1.y = radius * sin(i * step + noise) + t.p0.y;
        immediate_triangle(t, .{1, 1, 1, 1});
    }
}


immediate_triangle :: inline (triangle: Triangle, color: Vector4) {
    Simp.immediate_triangle(triangle.p0, triangle.p1, triangle.p2, color);
}


draw_dot :: (x: int, y: int, color := Vector4.{1, 1, 1, 1}) {
    draw_triangles(v2(x, y), 0, laser_bolt.triangles, color);
}


draw_line :: (x0: $T, y0: T, x1: T, y1: T, color := Vector4.{1, 1, 1, 1}) {
    triangles : [2] Triangle;
    stroke_width :: 2;
    triangles[0].p0 = v3(x0, y0);
    triangles[0].p1 = v3(x1, y1);
    triangles[0].p2 = v3(x1 + stroke_width, y1 + stroke_width);
    triangles[1].p0 = v3(x0, y0);
    triangles[1].p1 = v3(x1, y1);
    triangles[1].p2 = v3(x0 + stroke_width, y0 + stroke_width);
    draw_triangles(v2(0, 0), 0, triangles, color);
}


draw_debug_info :: () {
    draw_triangles(v2(0, 0), 0, debug_triangles, .{1, 1, 1, 1});
    draw_triangles(v2(debug_triangles[0].p0), 0, laser_bolt.triangles, .{1, 0, 0, 1});

//    color : = ifx //line_segment_inside_triangle(v2(width/2, height/2), v2(mouse_x, mouse_y), debug_triangles[0])
//                    line_segment_inside_player(v2(width/2, height/2), v2(mouse_x, mouse_y), me)
//             then Vector4.{0, 1, 0, 1}
//             else Vector4.{0, 0, 1, 1};
//    draw_line(width / 2, height / 2, mouse_x, mouse_y, color);

    draw_mouse();
}

draw_mouse :: () {
    size :: 40;
    draw_dot(mouse_x, mouse_y);
    for x: mouse_x - size .. mouse_x + size
        for y: mouse_y - size .. mouse_y + size
            //if point_inside_triangle(v2(x, y), debug_triangles[0])
            //if line_segment_inside_triangle(v2(mouse_x, mouse_y), v2(x, y), debug_triangles[0])
            if line_segment_inside_player(v2(mouse_x, mouse_y), v2(x, y), me)
                draw_dot(x, y, .{1, 0.5, 0.5, 1});
}


randomize_debug_triangle :: () {
    for i: 0 .. 2 {
        debug_triangles[0].points[i].x = random_get_zero_to_one() * width;
        debug_triangles[0].points[i].y = random_get_zero_to_one() * height;
    }
}


draw_triangles :: (position: Vector2, rotation: float, triangles: [] Triangle, color: Vector4) {
    c := cos(rotation);
    s := sin(rotation);
    t : Triangle;
    for triangle: triangles {
        for i: 0..2 {
            t.points[i].x = triangle.points[i].x * c - triangle.points[i].y * s + position.x;
            t.points[i].y = triangle.points[i].x * s + triangle.points[i].y * c + position.y;
        }
        for offset: wrap_deltas {
            for i: 0..2 {
                t.points[i].x += offset.x;
                t.points[i].y += offset.y;
            }
            immediate_triangle(t, color);
        }
    }
}


rgb_from_hsl :: (h: float, s: float, l: float) -> Vector4 {
    r, g, b : float;

    if s == 0 {
        r, g, b = l, l, l; // achromatic
    }
    else {
        rgb_from_hue :: (p: float, q: float, t: float) -> float {
            if t < 0  t += 1;
            if t > 1  t -= 1;
            if t < 1.0/6.0  return p + (q - p) * 6 * t;
            if t < 1.0/2.0  return q;
            if t < 2.0/3.0  return p + (q - p) * (2.0/3.0 - t) * 6;
            return p;
        }

        q := ifx l < 0.5 then l * (1 + s) else l + s - l * s;
        p := 2 * l - q;
        r = rgb_from_hue(p, q, h + 1.0/3.0);
        g = rgb_from_hue(p, q, h);
        b = rgb_from_hue(p, q, h - 1.0/3.0);
    }

    return v4(r, g, b, 1.0);
}


point_inside_planet :: inline (point: Vector2) -> bool {
    return d2(the_planet.position, point) <= the_planet.radius * the_planet.radius;
}


player_inside_planet :: (player: *Player) -> bool {
    c := cos(player.rotation);
    s := sin(player.rotation);
    r2 := the_planet.radius * the_planet.radius;
    for triangle: ship.triangles {
        for i: 0..2 {
            dx := triangle.points[i].x * c - triangle.points[i].y * s + player.position.x;
            dy := triangle.points[i].x * s + triangle.points[i].y * c + player.position.y;
            if d2(the_planet.position, v2(dx, dy)) <= r2
                return true;
        }
    }
    return false;
}


point_inside_player :: (point: Vector2, player: *Player) -> bool {
    c := cos(player.rotation);
    s := sin(player.rotation);
    t : Triangle;
    for triangle: ship.triangles {
        for i: 0..2 {
            t.points[i].x = triangle.points[i].x * c - triangle.points[i].y * s + player.position.x;
            t.points[i].y = triangle.points[i].x * s + triangle.points[i].y * c + player.position.y;
        }
        for offset: wrap_deltas {
            for i: 0..2 {
                t.points[i].x += offset.x;
                t.points[i].y += offset.y;
            }
            if point_inside_triangle(point, t)  return true;
        }
    }
    return false;
}


line_segment_inside_player :: (p0: Vector2, p1: Vector2, player: *Player) -> bool {
    c := cos(player.rotation);
    s := sin(player.rotation);
    t : Triangle;
    for triangle: ship.triangles {
        for i: 0..2 {
            t.points[i].x = triangle.points[i].x * c - triangle.points[i].y * s + player.position.x;
            t.points[i].y = triangle.points[i].x * s + triangle.points[i].y * c + player.position.y;
        }
        for offset: wrap_deltas {
            for i: 0..2 {
                t.points[i].x += offset.x;
                t.points[i].y += offset.y;
            }
            if line_segment_inside_triangle(p0, p1, t)  return true;
        }
    }
    return false;
}


d2 :: inline (a: Vector2, b: Vector2) -> float, float, float {
    dx := b.x - a.x;
    dy := b.y - a.y;
    return dx * dx + dy * dy, dx, dy;
}


d2_point_line_segment :: (point: Vector2, line_start: Vector2, line_end: Vector2) -> float, float, float {
  l2 := d2(line_start, line_end);
  if l2 == 0  return d2(point, line_start), line_start.x - point.x, line_start.y - point.y;
  t := max(0.0, min(1.0, dot(point - line_start, line_end - line_start) / l2));
  closest := lerp(line_start, line_end, t);
  return d2(point, closest), closest.x - point.x, closest.y - point.y;
}


barycentric_uv :: (point: Vector2, triangle: Triangle) -> Vector2 #must {
    v0 := triangle.p2 - triangle.p0;
    v1 := triangle.p1 - triangle.p0;
    v2 := point       - triangle.p0;

    dot00 := dot_product(v0, v0);
    dot11 := dot_product(v1, v1);
    dot01 := dot_product(v0, v1);
    dot02 := dot_product(v0, v2);
    dot12 := dot_product(v1, v2);

    k := -(dot00 * dot11 - dot01 * dot01);

    result : Vector2 = ---;
    result.x = (dot11 * dot02 - dot01 * dot12) / k;
    result.y = (dot00 * dot12 - dot01 * dot02) / k;
    return result;
}


point_inside_triangle :: (point: Vector2, triangle: Triangle) -> bool #must {
    uv := barycentric_uv(point, triangle);
    return (uv.x >= 0) && (uv.y >= 0) && (uv.x + uv.y <= 1);
}


line_segment_inside_triangle :: (p0: Vector2, p1: Vector2, triangle: Triangle) -> bool #must {
    return point_inside_triangle(p0, triangle)
        || point_inside_triangle(p1, triangle)
        || line_segments_intersect(p0, p1, v2(triangle.p0), v2(triangle.p1))
        || line_segments_intersect(p0, p1, v2(triangle.p0), v2(triangle.p2));
}


signed_2d_tri_area :: inline (a: Vector2, b: Vector2, c: Vector2) -> float #must {
    return (a.x - c.x) * (b.y - c.y) - (a.y - c.y) * (b.x - c.x);
}


line_segments_intersect :: (a: Vector2, b: Vector2, c: Vector2, d: Vector2) -> bool #must {
    a1 := signed_2d_tri_area(a, b, d);
    a2 := signed_2d_tri_area(a, b, c);
    if (a1 * a2 < 0) {
        a3 := signed_2d_tri_area(c, d, a);
        a4 := a3 + a2 - a1;
        return a3 * a4 < 0;
    }
    return false;
}



// :fonts



font_game: *Simp.Dynamic_Font;
font_menu: *Simp.Dynamic_Font;
font_list: *Simp.Dynamic_Font;


init_fonts :: () {
    font_game = Simp.get_font_at_size(".", "FalstinRegular-XOr2.ttf", "", font_height_game);
    assert(font_game != null);

    font_menu = Simp.get_font_at_size(".", "FalstinRegular-XOr2.ttf", "", font_height_menu);
    assert(font_menu != null);

    font_list = Simp.get_font_at_size(".", "FalstinRegular-XOr2.ttf", "", font_height_list);
    assert(font_list != null);
}


draw_text :: (text: string, position: Vector3, color: Vector4) {
    text_x := cast,trunc(s64) position.x;
    text_y := cast,trunc(s64) position.y;

    Simp.draw_text(font_game, text_x, text_y, text, color);
}


draw_menu_text :: (text: string, x: int, y: int, color := color_menu_text) {
    Simp.draw_text(font_menu, x, y, text, color);
}


draw_list_text :: (text: string, x: int, y: int, color := color_menu_text) {
    Simp.draw_text(font_list, x, y, text, color);
}



// :internal



operator+ :: (vector2: Vector2, vector3: Vector3) -> Vector3 #symmetric {
    result := vector3;
    result.x += vector2.x;
    result.y += vector2.y;
    return result;
}


operator- :: (vector3: Vector3, vector2: Vector2) -> Vector3 #symmetric {
    result := vector3;
    result.x -= vector2.x;
    result.y -= vector2.y;
    return result;
}


v2 :: inline (x: $T, y: T) -> Vector2 #must {
    result : Vector2 = ---;
    result.x = xx x;
    result.y = xx y;
    return result;
}


v2 :: inline (vector3: Vector3) -> Vector2 #must {
    return <<cast(*Vector2)(*vector3);
}


v3 :: inline (x: $T, y: T) -> Vector3 #must {
    result : Vector3 = ---;
    result.x = xx x;
    result.y = xx y;
    result.z = 0;
    return result;
}


v3 :: inline (vector2: Vector2) -> Vector3 #must {
    return <<cast(*Vector3)(*vector2);
}


v4 :: inline (p0: Vector2, p1: Vector2) -> Vector4 #must {
    result : Vector4 = ---;
    result.x = p0.x;
    result.y = p0.y;
    result.z = p1.x;
    result.w = p1.y;
    return result;
}


v4 :: inline (x: float, y: float, z: float, w: float) -> Vector4 #must {
    result : Vector4 = ---;
    result.x = x;
    result.y = y;
    result.z = z;
    result.w = w;
    return result;
}


parse_vector4 :: (s: string) -> Vector4 #must, success: bool {
    result : Vector4 = ---;

    components := split(s, ",");
    if components.count != 4
        return result, false;

    success : bool;
    for f, i: components {
        result.component[i], success = parse_float(*f);
        if !success  return result, false;
    }

    return result, true;
}


active_players : struct {};

for_expansion :: (_: *type_of(active_players), body: Code, flags: For_Flags) #expand {
    #assert(flags == 0 || flags == .POINTER);

    by_pointer : bool : flags & .POINTER || false;

    for *=by_pointer `it, `it_index: players {
        if it_index >= player_count  break;
        #insert body;
    }
}



// It's all @Steam below this!



// :input



raw_controller_count : int = -1;
raw_controllers : [STEAM_INPUT_MAX_COUNT] InputHandle_t;

game_action_set : InputActionSetHandle_t;
menu_action_set : InputActionSetHandle_t;

action_turn_left       : InputDigitalActionHandle_t;
action_turn_right      : InputDigitalActionHandle_t;
action_fire_lasers     : InputDigitalActionHandle_t;
action_pause_menu      : InputDigitalActionHandle_t;
action_forward_thrust  : InputDigitalActionHandle_t;
action_backward_thrust : InputDigitalActionHandle_t;
action_analog_controls : InputAnalogActionHandle_t;

action_menu_up     : InputAnalogActionHandle_t;
action_menu_down   : InputAnalogActionHandle_t;
action_menu_left   : InputAnalogActionHandle_t;
action_menu_right  : InputAnalogActionHandle_t;
action_menu_select : InputAnalogActionHandle_t;
action_menu_cancel : InputAnalogActionHandle_t;


register_steam_input :: () {
    InitInput();

    game_action_set = GetActionSetHandle("ship_controls");
    action_turn_left       = GetDigitalActionHandle("turn_left");
    action_turn_right      = GetDigitalActionHandle("turn_right");
    action_fire_lasers     = GetDigitalActionHandle("fire_lasers");
    action_pause_menu      = GetDigitalActionHandle("pause_menu");
    action_forward_thrust  = GetDigitalActionHandle("forward_thrust");
    action_backward_thrust = GetDigitalActionHandle("backward_thrust");
    action_analog_controls = GetAnalogActionHandle("analog_controls");

    menu_action_set = GetActionSetHandle("menu_controls");
    action_menu_up     = GetDigitalActionHandle("menu_up");
    action_menu_down   = GetDigitalActionHandle("menu_down");
    action_menu_left   = GetDigitalActionHandle("menu_left");
    action_menu_right  = GetDigitalActionHandle("menu_right");
    action_menu_select = GetDigitalActionHandle("menu_select");
    action_menu_cancel = GetDigitalActionHandle("menu_cancel");
}


handle_steam_input :: () {
    player := me;

    RunFrame();
    controller_count := GetConnectedControllers(*raw_controllers[0]);

    if controller_count != raw_controller_count {
        raw_controller_count = controller_count;
        log("Controllers: %\n", controller_count);
    }

    found_player_controller := false;
    for index: 0 .. raw_controller_count - 1 {
        if raw_controllers[index] == player.controller {
            found_player_controller = true;
            break;
        }
    }

    for index: 0 .. raw_controller_count - 1 {
        controller := raw_controllers[index];
        if !player.controller || !found_player_controller
            player.controller = controller;
        if controller != player.controller  continue;

        if in_menu {
            ActivateActionSet(controller, menu_action_set);

            check_input :: (action: InputAnalogActionHandle_t, menu_input: type_of(menu_input_state), proc: () -> ()) #expand {
                if GetDigitalActionData(controller, action).bState {
                    if !(`menu_input_state & menu_input) {
                        `menu_input_state |= menu_input;
                        proc();
                    }
                }
                else {
                    `menu_input_state &= ~menu_input;
                }
            }

            check_input(action_menu_up,     .UP,     menu_up);
            check_input(action_menu_down,   .DOWN,   menu_down);
            check_input(action_menu_left,   .LEFT,   menu_left);
            check_input(action_menu_right,  .RIGHT,  menu_right);
            check_input(action_menu_select, .SELECT, menu_select);
            check_input(action_menu_cancel, .CANCEL, menu_cancel);
        }
        else {
            ActivateActionSet(controller, game_action_set);

            analog := GetAnalogActionData(controller, action_analog_controls);
            player.turning = analog.x;
            player.thrusting = analog.y;

            if GetDigitalActionData(controller, action_turn_left).bState || keys.left {
                if GetDigitalActionData(controller, action_turn_right).bState || keys.right
                    player.turning = 0;
                else
                    player.turning = -1;
            }
            else if GetDigitalActionData(controller, action_turn_right).bState || keys.right
                player.turning = +1;

            if GetDigitalActionData(controller, action_backward_thrust).bState || keys.down
                player.thrusting = -1;

            if GetDigitalActionData(controller, action_forward_thrust).bState || keys.up
                player.thrusting = +1;

            if GetDigitalActionData(controller, action_fire_lasers).bState || keys.fire
                fire_shot(player);

            if GetDigitalActionData(controller, action_pause_menu).bState {
                if !player.pausing {
                    set_menu(!in_menu);
                    player.pausing = true;
                }
            }
            else {
                player.pausing = false;
            }
        }

        break; // only one local player, so once we've handled one pad we're done
    }
}



// :networking



joined_lobby  : CSteamID = 0;
hosted_lobby : CSteamID = 0;
hosted_lobby_is_public := true;

last_lobby_creation_attempt : float64;
lobby_creation_interval :: 5;

lobby_list : [..] Lobby;

LOBBY_BUFFER_SIZE :: 1024 * 1024;
lobby_buffer : [LOBBY_BUFFER_SIZE] u8;
lobby_buffer_cursor := 0;
current_lobby : Lobby;

Lobby :: struct {
    handle       : CSteamID;
    host_name    : string;
    player_count : int;
}


add_lobby :: (handle: CSteamID, host_name: string, player_count_string: string) {
    log("% % %", handle, host_name, player_count_string);
    lobby : Lobby = ---;
    lobby.handle = handle;

    lobby.host_name = stash_lobby_name_string(host_name);

    player_count, ok := parse_int(*player_count_string);
    lobby.player_count = ifx ok then player_count else 0;

    array_add(*lobby_list, lobby);
    update_list_menu();
}


remove_lobby :: (lobby_index: int) {
    if lobby_index >= lobby_list.count  return;

    if lobby_index < lobby_list.count - 1
        lobby_list[lobby_index] = lobby_list[lobby_list.count - 1];
    lobby_list.count -= 1;
}


stash_lobby_name_string :: (s: string) -> result: string {
    result : string = ---;
    result.count = min(s.count, Player.MAX_NAME_LENGTH);
    if lobby_buffer_cursor + result.count >= LOBBY_BUFFER_SIZE
        lobby_buffer_cursor = 0;
    result.data = *lobby_buffer[lobby_buffer_cursor];
    memcpy(result.data, s.data, result.count);
    lobby_buffer_cursor += result.count;

    return result;
}


create_lobby :: () {
    log("Attempting to create lobby...");
    hosted_lobby = 0;
    last_lobby_creation_attempt = now;

    CreateLobby(lobby_type(hosted_lobby_is_public), MAX_PLAYERS, #code {
        if result.Result != .k_EResultOK {
            log_error("Failed to create lobby");
            return;
        }

        `hosted_lobby = result.SteamIDLobby;
        SetLobbyData(`hosted_lobby, "Language", "Jai");
        SetLobbyData(`hosted_lobby, "HostName", to_c_string(`me.name));
        SetLobbyData(`hosted_lobby, "PlayerCount", "1");

        `current_lobby.handle = `hosted_lobby;
        `current_lobby.host_name = `me.name;
        `current_lobby.player_count = 1;

        log("Hosted lobby: %", `hosted_lobby);
    });

    // @Note When the lobby is created you automatically join it, triggering a LobbyEnter_t callback
}


join_lobby :: (lobby_id: CSteamID) {
    leave_current_lobby();
    JoinLobby(lobby_id);
}


lobby_joined :: (lobby_enter: LobbyEnter_t) {
    joined_lobby = lobby_enter.SteamIDLobby;
    if hosted_lobby != joined_lobby  hosted_lobby = 0;
    update_current_lobby_info();

    #if verbose  log("Joined lobby: %\n", joined_lobby);
} @SteamCallback


lobby_chat_update :: (update: LobbyChatUpdate_t) {
    if joined_lobby != hosted_lobby
    || update.SteamIDLobby != hosted_lobby
    || update.SteamIDUserChanged == me.handle
        return;

    //if update.ChatMemberStateChange & EChatMemberStateChange.k_EChatMemberStateChangeLeft {
        // remove_player(update.SteamIDUserChanged);
    //}
} @SteamCallback


lobby_type :: inline (is_public: bool) -> ELobbyType {
    return ifx is_public then ELobbyType.k_ELobbyTypePublic else ELobbyType.k_ELobbyTypeFriendsOnly;
}


set_lobby_type :: (is_public: bool) {
    if !hosted_lobby  return;

    SetLobbyType(hosted_lobby, lobby_type(is_public));
    hosted_lobby_is_public = is_public;
    request_lobbies();
}


update_current_lobby_info :: () {
    if !joined_lobby || joined_lobby == hosted_lobby
        return;

    for lobby: lobby_list {
        if lobby.handle == joined_lobby {
            current_lobby = lobby;
            return;
        }
    }

    host_name := GetLobbyData(joined_lobby, "HostName");
    player_count := GetLobbyData(joined_lobby, "PlayerCount");
    add_lobby(joined_lobby, host_name, player_count);
    current_lobby = lobby_list[lobby_list.count - 1];
}


leave_current_lobby :: () {
    if !joined_lobby  return;

    #if verbose  log("Leaving lobby: %\n", joined_lobby);
    LeaveLobby(joined_lobby);
    joined_lobby = 0;
}


request_lobbies :: () {
    if hosted_lobby_is_public {
        AddRequestLobbyListDistanceFilter(.k_ELobbyDistanceFilterWorldwide);
        AddRequestLobbyListStringFilter("Language", "Jai", .k_ELobbyComparisonEqual);

        RequestLobbyList(#code {
            if !`hosted_lobby_is_public  return;  // We're in friends-only mode, so ignore these public lobbies

            array_reset(*`lobby_list);
            lobby_count : int = result.LobbiesMatching;  // needs explicit type to avoid unsigned wrap-around in for loop
            #if verbose  log("Found lobbies: %", lobby_count);
            for lobby_index: 0 .. lobby_count - 1 {
                handle := GetLobbyByIndex(xx lobby_index);
                log("---> % %", handle, `hosted_lobby); // @TODO remove
                if handle == `hosted_lobby  continue;
                host_name := GetLobbyData(handle, "HostName"); // tprint("%", handle);
                player_count := GetLobbyData(handle, "PlayerCount");
                `add_lobby(handle, host_name, player_count);
            }

            `update_list_menu();

            /*
            dummy_lobby_count :: 40; // @TODO remove
            for 0 .. dummy_lobby_count - 1 {
                player_count := cast(s64) `random_get_within_range(1, `MAX_PLAYERS);
                name_index := cast(s64) `random_get_within_range(0, `random_names.count);
                `add_lobby(xx `random_get(), `random_names[name_index], tprint("%", player_count));
            }
            */

        });
    }
    else { // friends-only mode
        array_reset(*lobby_list);
        friend_count := GetFriendCount(.k_EFriendFlagImmediate);
        lobby_count := 0;
        for i: 0 .. friend_count - 1 {
            friend_handle := GetFriendByIndex(i, .k_EFriendFlagImmediate);
            game_info : FriendGameInfo_t = ---;

            if GetFriendGamePlayed(friend_handle, *game_info) && game_info.GameID == steam_appid {
                log("%", game_info);
            }
            if GetFriendGamePlayed(friend_handle, *game_info) && IsValid(game_info.SteamIDLobby) {
                lobby_count += 1;
                lobby_handle := game_info.SteamIDLobby;
                RequestLobbyData(lobby_handle);
                add_lobby(lobby_handle, GetFriendPersonaName(friend_handle), "1");
            }
        }
        #if verbose  log("Found lobbies: %", lobby_count);
    }
}


lobby_data_update :: (result: LobbyDataUpdate_t) {
    handle := result.SteamIDLobby;
    for * lobby, lobby_index: lobby_list {
        if lobby.handle == handle {
            if GetLobbyData(handle, "Language") == "Jai" {
                lobby.host_name = stash_lobby_name_string(GetLobbyData(handle, "HostName"));
                player_count, ok := parse_int(*GetLobbyData(handle, "PlayerCount"));
                lobby.player_count = ifx ok then player_count else 0;
            }
            else {
                remove_lobby(lobby_index);
            }

            update_list_menu();
            break;
        }
    }
} @SteamCallback



// :settings



steam_config_filename :: "jai_spacewar.cfg";
failed_load_settings_at : float64;
load_settings_attempts := 10;

store_settings :: () {
    // Only setting is player color
    // @TODO friend/public lobby setting
    v := me.color;
    s := tprint("%,%,%,%:%", v.component[0], v.component[1], v.component[2], v.component[3], current_hue);
    #if verbose  log("Storing: %", s);

    handle := FileWriteAsync(steam_config_filename, s.data, xx s.count, #code {
        if result.m_eResult != .k_EResultOK
            log_error("Failed to store settings to steam cloud");
        else {
            #if verbose  log("Stored!");
        }
    });

    if !handle  log_error("Failed to store settings to steam cloud");
}


load_settings :: () {
    filesize := cast(u32) GetFileSize(steam_config_filename);
    if filesize == 0  return;

    handle := FileReadAsync(steam_config_filename, 0, filesize, #code {
        success := false;
        if result.m_eResult == .k_EResultOK {
            s := talloc_string(result.m_cubRead);
            success = FileReadAsyncComplete(result.m_hFileReadAsync, s.data, xx s.count);
            if success {
                parts := `split(s, ":");
                if parts.count == 2 {
                    vector, ok := `parse_vector4(parts[0]);
                    if ok  `set_player_color(`me, vector);
                    else   success = false;

                    if success
                        `current_hue, success = `parse_float(*parts[1]);
                }
            }
        }

        if !success
            log_error("Failed to load config file from steam cloud.");
        else {
            #if verbose  log("Loaded: % %", `me.color, `current_hue);
        }
    });

    if handle
        failed_load_settings_at = 0;
    else {
        failed_load_settings_at = now;
        log_error("FileReadAsync failure");
    }
}



// :misc



overlay_activated :: (info: GameOverlayActivated_t) {
    steam_overlay_is_active = cast(bool) info.m_bActive;
} @SteamCallback
