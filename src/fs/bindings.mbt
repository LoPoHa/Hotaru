///|
type Bindings

///|
fn Bindings::get_file_size(path_ptr : Int, path_len : Int) -> UInt = "fs" "get_file_size"

///| Load a file from the rom
///
/// path_ptr: Pointer to the string in memory
///
/// path_len: Length of the string
/// 
/// buf_ptr: Pointer of the array to store the file in
///
/// buf_len: Length of the array
fn Bindings::load_file(
  path_ptr : Int,
  path_len : Int,
  buf_ptr : Int,
  buf_len : Int
) -> UInt = "fs" "load_file"

///| Dumps a file to the rom?
///
/// path_ptr: Pointer to the string in memory
///
/// path_len: Length of the string
/// 
/// buf_ptr: Pointer of the array to store the file in
///
/// buf_len: Length of the array
fn Bindings::dump_file(
  path_ptr : Int,
  path_len : Int,
  buf_ptr : Int,
  buf_len : Int
) -> UInt = "fs" "dump_file"

///|
fn Bindings::remove_file(path_ptr : UInt, path_len : UInt) = "fs" "remove_file"
