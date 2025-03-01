///|
type Bindings

// Fill the whole frame with the given color.
///|
fn Bindings::clear_screen(color : Int) = "graphics" "clear_screen"

// Set a color value in the palette.
///|
fn Bindings::set_color(index : Int, r : Int, g : Int, b : Int) = "graphics" "set_color"

// Set a single point (1 pixel is scaling is 1) on the frame.
///|
fn Bindings::draw_point(x : Int, y : Int, color : Int) = "graphics" "draw_point"

// Draw a straight line from point a to point b.
///|
fn Bindings::draw_line(
  p1_x : Int,
  p1_y : Int,
  p2_x : Int,
  p2_y : Int,
  color : Int,
  stroke_width : Int
) = "graphics" "draw_line"

// Draw a rectangle filling the given bounding box.
///|
fn Bindings::draw_rect(
  x : Int,
  y : Int,
  width : Int,
  height : Int,
  fill_color : Int,
  stroke_color : Int,
  stroke_width : Int
) = "graphics" "draw_rect"

// Draw a rectangle with rounded corners.
///|
fn Bindings::draw_rounded_rect(
  x : Int,
  y : Int,
  width : Int,
  height : Int,
  corner_width : Int,
  corner_height : Int,
  fill_color : Int,
  stroke_color : Int,
  stroke_width : Int
) = "graphics" "draw_rounded_rect"

// Draw a circle with the given diameter.
///|
fn Bindings::draw_circle(
  x : Int,
  y : Int,
  diameter : Int,
  fill_color : Int,
  stroke_color : Int,
  stroke_width : Int
) = "graphics" "draw_circle"

// Draw an ellipse (oval).
///|
fn Bindings::draw_ellipse(
  x : Int,
  y : Int,
  width : Int,
  height : Int,
  fill_color : Int,
  stroke_color : Int,
  stroke_width : Int
) = "graphics" "draw_ellipse"

// Draw a triangle.
///|
fn Bindings::draw_triangle(
  p1_x : Int,
  p1_y : Int,
  p2_x : Int,
  p2_y : Int,
  p3_x : Int,
  p3_y : Int,
  fill_color : Int,
  stroke_color : Int,
  stroke_width : Int
) = "graphics" "draw_triangle"

// Draw an arc.
///|
fn Bindings::draw_arc(
  x : Int,
  y : Int,
  diameter : Int,
  angle_start : Float,
  angle_sweep : Float,
  fill_color : Int,
  stroke_color : Int,
  stroke_width : Int
) = "graphics" "draw_arc"

// Draw a sector.
///|
fn Bindings::draw_sector(
  x : Int,
  y : Int,
  diameter : Int,
  angle_start : Float,
  angle_sweep : Float,
  fill_color : Int,
  stroke_color : Int,
  stroke_width : Int
) = "graphics" "draw_sector"

// Render text using the given font.
///|
fn Bindings::draw_text(
  text_ptr : Int,
  text_len : Int,
  font_ptr : Int,
  font_len : Int,
  x : Int,
  y : Int,
  color : Int
) = "graphics" "draw_text"

// Draw a subregion of an image.
///|
fn Bindings::draw_sub_image(
  ptr : Int,
  len : Int,
  x : Int,
  y : Int,
  sub_x : Int,
  sub_y : Int,
  sub_width : Int,
  sub_height : Int
) = "graphics" "draw_sub_image"

// Render an image using the given colors.
///|
fn Bindings::draw_image(ptr : Int, len : Int, x : Int, y : Int) = "graphics" "draw_image"

// Set canvas to be used for all subsequent drawing operations.
///|
fn Bindings::set_canvas(ptr : Int, len : Int) = "graphics" "set_canvas"

// Unset canvas set by [`set_canvas`]. All subsequent drawing operations will target frame buffer.
///|
fn Bindings::unset_canvas() = "graphics" "unset_canvas"
