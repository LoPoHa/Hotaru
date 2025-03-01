// A loaded image file.
//
// Can be loaded as `FileBuf` from ROM with `load_file_buf`
// and then cast using `Into`.
///|
pub struct Image {
  raw : FixedArray[Byte]
}

// Get a rectangle subregion of the image.

///|
pub fn Image::sub(self : Image, p : Point, s : Size) -> SubImage {
  { point: p, size: s, raw: self.raw }
}

// Bits per pixel. One of: 1, 2, or 4.
///|
pub fn Image::bpp(self : Image) -> Byte {
  self.raw[1]
}

// The color used for transparency. If no transparency, returns `Color::None`.
///|
pub fn Image::transparency(self : Image) -> Color {
  let c = (self.raw[4] + 1).to_int()
  match try_into_color(c) {
    Ok(color) => color
    Err(_) => Color::None
  }
}

// The number of pixels the image has.
///|
pub fn Image::pixels(self : Image) -> UInt {
  self.raw.length().reinterpret_as_uint() * 8U / self.bpp().to_uint()
}

// The image width in pixels.
///|
pub fn Image::width(self : Image) -> UInt {
  let big = self.raw[2].to_uint()
  let little = self.raw[3].to_uint()
  big | (little << 8)
}

// The image height in pixels.
///|
pub fn Image::height(self : Image) -> UInt {
  let p = self.pixels()
  let w = self.width()
  match checked_div(p, w) {
    Some(val) => val
    None => 0
  }
}

// The image size in pixels.
///|
pub fn Image::size(self : Image) -> Size {
  {
    width: self.width().reinterpret_as_int(),
    height: self.height().reinterpret_as_int(),
  }
}

// Get the color used to represent the given pixel value.
///|
pub fn Image::get_color(self : Image, p : Int) -> Color {
  if p > 15 {
    return Color::None
  }
  let byte_idx = 5 + p / 2
  let mut byte_val = self.raw[byte_idx]
  if p % 2 == 0 {
    byte_val = byte_val >> 4
  }
  byte_val = byte_val & 0b1111
  let transp = self.raw[4]
  if byte_val == transp {
    return Color::None
  }
  let color_val = byte_val + 1
  match try_into_color(color_val.to_int()) {
    Ok(color) => color
    Err(_) => Color::None
  }
}

// A subregion of an image. Constructed using `Image::sub`.
///|
struct SubImage {
  point : Point
  size : Size
  raw : FixedArray[Byte]
}

///|
fn try_into_color(value : Int) -> Result[Color, Unit] {
  match value {
    0 => Ok(Color::None)
    1 => Ok(Color::Black)
    2 => Ok(Color::Purple)
    3 => Ok(Color::Red)
    4 => Ok(Color::Orange)
    5 => Ok(Color::Yellow)
    6 => Ok(Color::LightGreen)
    7 => Ok(Color::Green)
    8 => Ok(Color::DarkGreen)
    9 => Ok(Color::DarkBlue)
    10 => Ok(Color::Blue)
    11 => Ok(Color::LightBlue)
    12 => Ok(Color::Cyan)
    13 => Ok(Color::White)
    14 => Ok(Color::LightGray)
    15 => Ok(Color::Gray)
    16 => Ok(Color::DarkGray)
    _ => Err(())
  }
}

///|
fn checked_div(a : UInt, b : UInt) -> UInt? {
  if b == 0 {
    return None
  }
  Some(a / b)
}

///|
pub fn Image::load_file(path : String) -> Image! {
  let content = @fs.File::load_file_buf!(path)
  { raw: content.raw }
}

///|
pub fn Image::draw(self : Image, point : Point) -> Unit {
  let ptr = @internal.Helper::array_to_pointer(self.raw)
  Bindings::draw_image(ptr, self.raw.length(), point.x, point.y)
}

///|
pub fn SubImage::draw(self : SubImage, p : Point) -> Unit {
  let ptr = @internal.Helper::array_to_pointer(self.raw)
  Bindings::draw_sub_image(
    ptr,
    self.raw.length(),
    p.x,
    p.y,
    self.point.x,
    self.point.y,
    self.size.width,
    self.size.height,
  )
}
