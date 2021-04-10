// @TODO
// [ ] multiple players
// [ ] networking
// [ ] dying
// [ ] menu
// [ ] scoring
// [ ] check how to glBlend in Simp
// [ ] steam status
// [ ] names

// @Steam tags denote example API usage

width  :: 1280;
height :: 768;

window: Window_Type;
window_width  : s32 = width;
window_height : s32 = height;

render_width  : s32 = width;
render_height : s32 = height;

ship_length :: height / 36;
ship_width  :: ship_length / 2;
ship_cut    :: 0.75;

shot_gravity_multiplier :: 20.0;

player := Player.{position = .{width / 4, height / 2}, color = .{1, 0.5, 0, 1}};

shots : [MAX_SHOTS] Shot;
MAX_SHOTS :: 1024;
next_shot_index := 0;


prev_raw_time : float64;
curr_raw_time : float64;
now : float64;
dt : float32;

quit := false;


main :: () {
    // @Steam
    init_steam := InitSteam();
    if !init_steam {
        log_error("Failed to initialize Steam");
        exit(1);
    }
    else {
        #insert SteamCallbacks;
        register_steam_input();
        name := GetPersonaName();
        memcpy(*player.buffer, name.data, 16);
        player.name.data = *player.buffer[0];
        player.name.count = min(name.count, 16);
    }

    window = create_window(window_width, window_height, "Spacewar");
    Simp.simp_init(window, window_width, window_height, render_width, render_height);

    my_init_fonts();
    player.label.width = Simp.get_string_width_in_pixels(my_font, player.name);

    while !quit {
        prev_raw_time = curr_raw_time;
        curr_raw_time = get_time();
        dt = cast(float32) (curr_raw_time - prev_raw_time);
        now = curr_raw_time - paused_delta;
        was_paused := paused;

        RunCallbacks();  // @Steam
        handle_steam_input();
        handle_window_events();

        if !was_paused {
            simulate();
        }

        draw_one_frame();

        //sleep_milliseconds(10);
    }

    ShutdownSteam(); // @Steam
}


handle_window_events :: () {
    Input.update_window_events();

    for event: Input.events_this_frame {
        if event.type == {
            case .QUIT;
            quit = true;

            case .KEYBOARD;
            if event.key_pressed {

                if event.key_code == {
                    case .ESCAPE;
                    case .F6;
                    quit = true;

                    case .PAUSE;
                    set_pause(!paused, .USER);
                }
            }
        }
    }
}


simulate :: () {
     {
        using player;

        c := cos(rotation);
        s := sin(rotation);

        acceleration : Vector2;
        k := dt * ifx thrusting > 0 then FORWARD_THRUST * thrusting else REVERSE_THRUST * thrusting;
        acceleration.x = k * c;
        acceleration.y = k * s;

        velocity += acceleration;
        attract(the_planet, *player);
        position += velocity;

        wrap_object(*player);

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
                position += velocity;
                attract(the_planet, shot);
                wrap_object(shot);
            }
        }
    }
}


wrap_object :: (using object: *Object) {
    if position.x > width   position.x -= width;
    else if position.x < 0  position.x += width;

    if position.y > height  position.y -= height;
    else if position.y < 0  position.y += height;
}


fire_shot :: (player: *Player) {
    using player;

    if last_fired_at + LASER_COOLDOWN > now  return;

    last_fired_at = now;

    c := cos(rotation);
    s := sin(rotation);

    shots[next_shot_index].position.x = position.x + c * ship_length * 0.5;
    shots[next_shot_index].position.y = position.y + s * ship_length * 0.5;
    shots[next_shot_index].velocity.x = velocity.x + c * Shot.MUZZLE_VELOCITY;
    shots[next_shot_index].velocity.y = velocity.y + s * Shot.MUZZLE_VELOCITY;
    shots[next_shot_index].gravity_multiplier = shot_gravity_multiplier;
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

    dp := abs(dot_product(d, object.velocity));
    dp = sqrt(dp);
    //if object != *player  log("%\n", dp);

    k : float;
    if object.gravity_multiplier == 1.0
        k = 1;
    else
        k = ifx dp == 0 then object.gravity_multiplier else lerp(1.0, object.gravity_multiplier, 1/dp);


    object.velocity.x = object.velocity.x + c * f * k;
    object.velocity.y = object.velocity.y + s * f * k;
}


paused : enum_flags u8 {
    USER  :: 1;
    STEAM :: 2;
} = 0;


paused_at : float64;
paused_delta : float64;


set_pause :: (should_pause: bool, pause_type: type_of(paused)) {
    if should_pause {
        if !paused  paused_at = curr_raw_time;
        paused |= pause_type;
    }
    else {
        paused &= ~pause_type;
        if !paused  paused_delta += curr_raw_time - paused_at;
    }
}


color_background :: Vector4.{.02, .02, .03, 0.51};


draw_one_frame :: () {
    Simp.update_window(window, window_width, window_height, render_width, render_height);

    Simp.set_shader_for_color();
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    Simp.immediate_quad(0, 0, width, height, color_background);

    draw_player(player, ship);

    for shot: shots
        if shot.fired_at
            draw_shot(shot);

    draw_planet(the_planet);

    draw_player_name(player);

    Simp.swap_buffers(window);
}


wrap_offsets :: Vector2.[
    .{0, 0},
    .{-width, 0},
    .{width, 0},
    .{0, -height},
    .{0, +height},
];


draw_player :: (player: Player, ship: Ship) {
    c := cos(player.rotation - TAU / 4);
    s := sin(player.rotation - TAU / 4);
    t : Triangle;

    for offset: wrap_offsets {
        for triangle: ship.triangles {
            for i: 0..2 {
                t.points[i].x = triangle.points[i].x * c - triangle.points[i].y * s + player.position.x + offset.x;
                t.points[i].y = triangle.points[i].x * s + triangle.points[i].y * c + player.position.y + offset.y;
            }

            immediate_triangle(t, player.color);
        }
    }
}


draw_player_name :: (player: Player) {
    //offset :: Vector3.{ship_width, ship_width, 0};
    color := player.color;
    color.w = 0.5;
    draw_text(player.name, player.label.visual_position, color, player.label.width);
}


// @TODO factor shot and player together


draw_shot :: (shot: Shot) {
    rotation := random_get_zero_to_one() * TAU;
    c := cos(rotation);
    s := sin(rotation);
    t : Triangle;
    for offset: wrap_offsets {
        for triangle: laser_bolt.triangles {
            for i: 0..2 {
                t.points[i].x = triangle.points[i].x * c - triangle.points[i].y * s + shot.position.x + offset.x;
                t.points[i].y = triangle.points[i].x * s + triangle.points[i].y * c + shot.position.y + offset.y;
            }

            immediate_triangle(t, .{1, 1, 1, 1});
        }
    }
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


Triangle :: struct {
    p0: Vector3;
    p1: Vector3;
    p2: Vector3;

    #place p0;
    points : [3] Vector3;
}


Ship :: struct(length: float, width: float, cut: float) {
    triangles :: Triangle.[
        .{.{0, length * 0.5, 0}, .{-width * 0.5, -length * 0.5, 0}, .{0, -length * 0.5 * cut, 0}},
        .{.{0, length * 0.5, 0}, .{+width * 0.5, -length * 0.5, 0}, .{0, -length * 0.5 * cut, 0}},
    ];
}


ship : Ship(ship_length, ship_width, ship_cut);
laser_bolt : Ship(ship_length / 5, ship_length / 5, 1);
the_planet :: Planet.{position = .{x = width / 2, y = height / 2}, radius = width / 20, gravity = 0.00025};


Object :: struct {
    position : Vector2;
    velocity : Vector2;
    gravity_multiplier := 1.0;
}


Player :: struct {
    using base: Object;

    FORWARD_THRUST : float : 0.5;
    REVERSE_THRUST : float : 0.2;
    TURN_RATE      : float : 1.0;
    LASER_COOLDOWN : float64 : 1.0;

    buffer   : [16] u8;
    name     : string;
    label    : Label;
    color    : Vector4;

    rotation : float;

    last_fired_at : float64;

    turning : float;
    thrusting : float;
    pausing : bool;

    controller : InputHandle_t;  // @Steam
}


Shot :: struct {
    using base: Object;

    MUZZLE_VELOCITY :: 2.0;
    FUSE :: 10.0;

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


v3 :: inline (v2: Vector2) -> Vector3 {
    return <<cast(*Vector3)(*v2);
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


my_init_fonts :: () {
    // So that we can load our font, set to path of running executable.
    // @Incomplete: Pack a default font into Simp.
    path := path_strip_filename(get_path_of_running_executable());

    set_working_directory(path);
    pixel_height := window_height / 64;

    // @Cleanup: Don't have path + name be separate.
    my_font = Simp.get_font_at_size(".", "OpenSans-BoldItalic.ttf", "", pixel_height);
    assert(my_font != null);
}

my_font: *Simp.Dynamic_Font;


draw_text :: (text: string, position: Vector3, color: Vector4, text_width := -1) {
    if text_width < 0
        text_width = Simp.get_string_width_in_pixels(my_font, text);

    text_x := cast,trunc(s64) position.x;
    text_y := cast,trunc(s64) position.y;

//    theta := cast(float) fmod(now*3, TAU);
//    color: Vector4;
//    color.x = cos(theta)*.5+.5;
//    Clamp(*color.x, 0, 1);
//    color.y = 1;
//    color.z = sin(theta)*.5+.5;
//    Clamp(*color.z, 0, 1);
//    color.w = 1;

    Simp.draw_text(my_font, text_x, text_y, text, color);
}


Simp  :: #import "Simp";
Input :: #import "Input";
#import "Steam";

#import "Window_Creation";

#import "Basic";
#import "Math";
#import "Random";
#import "System";  // For get_path_of_running_executable. @Cleanup.
#import "String";  // For path_strip_filename. @Cleanup.
#import "GL"; // For glBlend



// It's all @Steam below this!



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
    RunFrame();
    controller_count := GetConnectedControllers(*raw_controllers[0]);

    if controller_count != raw_controller_count {
        raw_controller_count = controller_count;
        log("Controllers: %\n", controller_count);
    }

    for index: 0..raw_controller_count-1 {
        controller := raw_controllers[index];
        if !player.controller  player.controller = controller;
        if controller != player.controller  continue;

        if paused {
            ActivateActionSet(controller, menu_action_set);

            if GetDigitalActionData(controller, action_menu_up).bState {
                log("Menu Up\n");
            }

            if GetDigitalActionData(controller, action_menu_down).bState {
                log("Menu Down\n");
            }

            if GetDigitalActionData(controller, action_menu_left).bState {
                log("Menu Left\n");
            }

            if GetDigitalActionData(controller, action_menu_right).bState {
                log("Menu Right\n");
            }

            if GetDigitalActionData(controller, action_menu_select).bState {
                log("Menu Select\n");
            }

            if GetDigitalActionData(controller, action_menu_cancel).bState {
                log("Menu Cancel\n");
                set_pause(false, .USER);
            }
        }
        else {
            ActivateActionSet(controller, game_action_set);

            analog := GetAnalogActionData(controller, action_analog_controls);
            player.turning = analog.x;
            player.thrusting = analog.y;

            if GetDigitalActionData(controller, action_turn_left).bState {
                if GetDigitalActionData(controller, action_turn_right).bState
                    player.turning = 0;
                else
                    player.turning = -1;
            }
            else if GetDigitalActionData(controller, action_turn_right).bState
                player.turning = +1;

            if GetDigitalActionData(controller, action_backward_thrust).bState
                player.thrusting = -1;

            if GetDigitalActionData(controller, action_forward_thrust).bState
                player.thrusting = +1;

            if GetDigitalActionData(controller, action_fire_lasers).bState
                fire_shot(*player);

            if GetDigitalActionData(controller, action_pause_menu).bState {
                if !player.pausing {
                    set_pause(!paused, .USER);
                    player.pausing = true;
                }
            }
            else {
                player.pausing = false;
            }
        }
    }
}

overlay_activated :: (info: GameOverlayActivated_t) {
    set_pause(cast(bool) info.m_bActive, .STEAM);
} @SteamCallback
