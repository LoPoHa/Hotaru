///|
type Logger

///|
pub fn Logger::debug(s : String) -> Unit {
  let bytes = FixedArray::make(s.length() * 4 + 1, Byte::default())
  let mut offset = 0
  s.iter().each(fn { ch => offset += bytes.set_utf8_char(offset, ch) })
  Bindings::log_debug(@internal.Helper::array_to_pointer(bytes), offset)
  ignore(bytes)
}

///|
pub fn Logger::error(s : String) -> Unit {
  let bytes = FixedArray::make(s.length() * 4 + 1, Byte::default())
  let mut offset = 0
  s.iter().each(fn { ch => offset += bytes.set_utf8_char(offset, ch) })
  Bindings::log_error(@internal.Helper::array_to_pointer(bytes), offset)
  ignore(bytes)
}
