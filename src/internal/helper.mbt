///|
pub type Helper

///|
pub fn Helper::min(left : Int, right : Int) -> Int {
  if left < right {
    left
  } else {
    right
  }
}

///|
pub fn Helper::max(left : Int, right : Int) -> Int {
  if left < right {
    right
  } else {
    left
  }
}

///|
pub fn Helper::has_bit_set(val : UInt, bit : Int) -> Bool {
  ((val >> bit) & 0b1) != 0
}

///|
pub fn Helper::array_to_pointer(arr : FixedArray[Byte]) -> Int {
  get_addr(arr)
}

///|
pub fn Helper::string_to_pointer_len(
  s : String
) -> (FixedArray[Byte], Int, Int) {
  let bytes = FixedArray::make(s.length() * 4 + 1, Byte::default())
  let mut offset = 0
  s.iter().each(fn { ch => offset += bytes.set_utf8_char(offset, ch) })
  (bytes, get_addr(bytes), offset)
}

// From the WASM4 moonbit library. TODO: Link to file for credit!
///|
extern "wasm" fn get_addr(bytes : FixedArray[Byte]) -> Int =
  #|(func (param i32) (result i32) (call $moonbit.decref (local.get 0)) (i32.add (local.get 0) (i32.const 8)))
