// @Steam tags denote example API usage

window: Window_Type;
window_width  : s32 = 1024;
window_height : s32 = 768;

render_width  : s32 = 1024;
render_height : s32 = 768;


player : Player;

raw_time : float64;
now : float64;
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
    }

    window = create_window(window_width, window_height, "Spacewar");
    Simp.simp_init(window, window_width, window_height, render_width, render_height);

    //my_init_fonts();

    while !quit {
        raw_time = get_time();
        now := raw_time - paused_delta;
        was_paused := paused;

        RunCallbacks(); // @Steam

        handle_window_events();

        if !was_paused {
            player.position.x = cast(float) window_width / 2;
            player.position.y = cast(float) window_height / 2;
            player.rotation = cast(float) fmod(now, TAU);
        }

        draw_one_frame();

        sleep_milliseconds(10);
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
                    quit = true;

                    case .PAUSE;
                    set_pause(!paused, .USER);
                }
            }
        }
    }
}



paused : enum_flags u8 {
    USER  :: 1;
    STEAM :: 2;
} = 0;


paused_at : float64;
paused_delta : float64;


set_pause :: (should_pause: bool, pause_type: type_of(paused)) {
    if should_pause {
        if !paused  paused_at = raw_time;
        paused |= pause_type;
    }
    else {
        paused &= ~pause_type;
        if !paused  paused_delta += raw_time - paused_at;
    }
}



draw_one_frame :: () {
    Simp.update_window(window, window_width, window_height, render_width, render_height);
    Simp.clear_render_target(.15, .08, .08, 1);

    Simp.set_shader_for_color();

    draw_player(player, ship);

    Simp.swap_buffers(window);
}


draw_player :: (player: Player, ship: Ship) {
    c := cos(player.rotation);
    s := sin(player.rotation);
    t : Triangle;
    for triangle: ship.triangles {
        for i: 0..2 {
            t.points[i].x = triangle.points[i].x * c - triangle.points[i].y * s + player.position.x;
            t.points[i].y = triangle.points[i].x * s + triangle.points[i].y * c + player.position.y;
        }

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



Ship :: struct(length: float, width: float) {
    triangles :: Triangle.[
        .{.{0, length * 0.5, 0}, .{-width * 0.5, -length * 0.5, 0}, .{+width * 0.5, -length * 0.5, 0}},
    ];
}

Player :: struct {
    position : Vector2;
    rotation : float;
}

ship : Ship(50, 20);


my_init_fonts :: () {
    // So that we can load our font, set to path of running executable.
    // @Incomplete: Pack a default font into Simp.
    path := path_strip_filename(get_path_of_running_executable());

    set_working_directory(path);
    pixel_height := window_height / 24;

    // @Cleanup: Don't have path + name be separate.
    my_font = Simp.get_font_at_size(".", "OpenSans-BoldItalic.ttf", "", pixel_height);
    assert(my_font != null);
}

my_font: *Simp.Dynamic_Font;

// Draw some text.
    /*
    {
        text := "Simp!";

        text_width := Simp.get_string_width_in_pixels(my_font, text);

        text_x := (window_width - text_width) / 2;
        text_y := window_height/2 - my_font.character_height/4;

        theta := cast(float) fmod(time*3, TAU);
        color: Vector4;
        color.x = cos(theta)*.5+.5;
        Clamp(*color.x, 0, 1);
        color.y = 1;
        color.z = sin(theta)*.5+.5;
        Clamp(*color.z, 0, 1);
        color.w = 1;

        Simp.draw_text(my_font, text_x, text_y, text, color);
    }
    */

Simp  :: #import "Simp";
Input :: #import "Input";
#import "Steam";

#import "Window_Creation";

#import "Basic";
#import "Math";
#import "System";  // For get_path_of_running_executable. @Cleanup.
#import "String";  // For path_strip_filename. @Cleanup.


// @Steam callbacks below

overlay_activated :: (info: GameOverlayActivated_t) {
    set_pause(cast(bool) info.m_bActive, .STEAM);
} @SteamCallback
