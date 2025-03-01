// Access file system: the game ROM files and the data dir.

// In MoonBit, we don't have direct access to the underlying file system
// in the same way as Rust. Instead, we rely on the host environment
// providing us with functions to interact with the file system.
// Therefore, the implementation of `fs` in MoonBit will look
// different and rely on external imports.

// We can mimic the `File` and `FileBuf` behavior using custom types
// and functions.

// In MoonBit, we use `Byte` instead of `u8`
///|
pub struct File {
  raw : FixedArray[Byte]
}

// A font is basically just a raw bytes, so no need to duplicate.
// The `as_font` method is not needed.
// struct Font {
//   raw: Array[Byte]
// }

// Here, as we don't have the image lib, we just use `File` type.
// struct Image {
//   raw: Array[Byte]
// }

// Get a file size in the data dir.
// If the file does not exist, 0 is returned.
///|
pub fn File::get_file_size_wrapper(name : String) -> UInt {
  let (bytes, ptr, len) = @internal.Helper::string_to_pointer_len(name)
  let size = Bindings::get_file_size(ptr, len)
  ignore(bytes)
  ignore(name)
  size
}

// // Read the whole file with the given name into the given buffer.
// // If the file size is not known in advance (and so the buffer has to be allocated
// // dynamically), consider using `load_file_buf` instead.
// pub fn load_file_wrapper(name: String, buf: Array[Byte]) -> File! {
//   let result = load_file(name, buf)
//   if result == 0 {
//     raise Failure("load_file failed")
//   }
//  v File { raw: buf.clone() }
// }

// Read the whole file with the given name.
// If you have a pre-allocated buffer of the right size, use `load_file` instead.
// `None` is returned if the file does not exist.
///|
pub fn File::load_file_buf(name : String) -> File! {
  let size = File::get_file_size_wrapper(name)
  if size == 0 {
    raise Failure("File not found")
  }
  let (bytes, path_ptr, path_len) = @internal.Helper::string_to_pointer_len(
    name,
  )
  let buf = FixedArray::make(size.reinterpret_as_int(), Byte::default())
  let buf_ptr = @internal.Helper::array_to_pointer(buf)
  let buf_len = buf.length()
  let _ = Bindings::load_file(path_ptr, path_len, buf_ptr, buf_len) // rust also ignores the result...
  ignore(bytes)
  ignore(name)
  ignore(buf)
  { raw: buf }
}

// Write the buffer into the given file in the data dir.
// If the file exists, it will be overwritten.
// If it doesn't exist, it will be created.
///|
pub fn File::dump_file_wrapper(name : String, buf : FixedArray[Byte]) -> Unit! {
  let (bytes, path_ptr, path_len) = @internal.Helper::string_to_pointer_len(
    name,
  )
  let buf_ptr = @internal.Helper::array_to_pointer(buf)
  let buf_len = buf.length()
  let result = Bindings::dump_file(path_ptr, path_len, buf_ptr, buf_len)
  ignore(bytes)
  if result == 0 {
    raise Failure("dump file fail")
  }
}

// Remove file (if exists) with the given name from the data dir.
// func remove_file_wrapper(name: String) -> Result[Nil] {
//   let result = remove_file(name)
//     if result == 0 {
//      return Result::Err("remove file fail")
//   }
//   Result::Ok(Nil)
// }
