///|
pub struct Font {
  raw : FixedArray[Byte]
  pointer : Int
  length : Int
}

///|
pub fn Font::load_file(path : String) -> Font! {
  let content = @fs.File::load_file_buf!(path)
  let pointer = @internal.Helper::array_to_pointer(content.raw)
  { raw: content.raw, pointer, length: content.raw.length() }
}

///|
pub fn Font::write(
  self : Font,
  text : String,
  position : Point,
  color : Color
) -> Unit {
  let (txtbuf, text_ptr, text_len) = @internal.Helper::string_to_pointer_len(
    text,
  )
  Bindings::draw_text(
    text_ptr,
    text_len,
    self.pointer,
    self.length,
    position.x,
    position.y,
    color.to_int(),
  )
  ignore(txtbuf)
}
