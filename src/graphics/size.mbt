// Size of a bounding box for a shape.
//
// The width and height must be positive.
///|
pub struct Size {
  // Horizontal size in pixels.
  mut width : Int
  // Vertical size in pixels.
  mut height : Int
}

///|
type! IndexOutOfBounds String

// Create a new size.
///|
pub fn Size::new(width : Int, height : Int) -> Size {
  { width, height }
}

// Set both width and height to their absolute (non-negative) value.
///|
pub fn Size::abs(self : Size) -> Size {
  { width: self.width.abs(), height: self.height.abs() }
}

// Set both width and height to their @internal.Helper::minimum in the two given sizes.
///|
pub fn Size::component_min(self : Size, other : Size) -> Size {
  {
    width: @internal.Helper::min(self.width, other.width),
    height: @internal.Helper::min(self.height, other.height),
  }
}

// Set both width and height to their @internal.Helper::maximum in the two given sizes.
///|
pub fn Size::component_max(self : Size, other : Size) -> Size {
  {
    width: @internal.Helper::max(self.width, other.width),
    height: @internal.Helper::max(self.height, other.height),
  }
}

// Add two Sizes
///|
pub fn Size::add(self : Size, other : Size) -> Size {
  { width: self.width + other.width, height: self.height + other.height }
}

// Add Assign Size
///|
pub fn Size::add_assign(self : Size, other : Size) -> Unit {
  self.width += other.width
  self.height += other.height
}

// Subtract two Sizes
///|
pub fn Size::sub(self : Size, other : Size) -> Size {
  { width: self.width - other.width, height: self.height - other.height }
}

// Subtract Size and Point
///|
pub fn Size::sub_point(self : Size, other : Point) -> Size {
  { width: self.width - other.x, height: self.height - other.y }
}

// Subtract Assign Size
///|
pub fn Size::sub_assign(self : Size, other : Size) -> Unit {
  self.width -= other.width
  self.height -= other.height
}

// Multiply Size by Int
///|
pub fn Size::mul(self : Size, rhs : Int) -> Size {
  { width: self.width * rhs, height: self.height * rhs }
}

// Multiply Assign Size by Int
///|
pub fn Size::mul_assign(self : Size, rhs : Int) -> Unit {
  self.width *= rhs
  self.height *= rhs
}

// Divide Size by Int
///|
pub fn Size::div(self : Size, rhs : Int) -> Size {
  { width: self.width / rhs, height: self.height / rhs }
}

// Divide Assign Size by Int
///|
pub fn Size::div_assign(self : Size, rhs : Int) -> Unit {
  self.width /= rhs
  self.height /= rhs
}

// Index Size
///|
pub fn Size::index(self : Size, idx : Int) -> Int! {
  if idx == 0 {
    self.width
  } else if idx == 1 {
    self.height
  } else {
    raise IndexOutOfBounds(
      "index out of bounds: the len is 2 but the index is " + idx.to_string(),
    )
  }
}

// From Point to Size
///|
pub fn Size::from_point(value : Point) -> Size {
  { width: value.x, height: value.y }
}

// From (Int, Int) to Size
///|
pub fn Size::from_tuple(other : (Int, Int)) -> Size {
  { width: other.0, height: other.1 }
}

// From [Int; 2] to Size
///|
pub fn Size::from_array(other : Array[Int]) -> Size {
  { width: other[0], height: other[1] }
}

// From Size to (Int, Int)
///|
pub fn Size::to_tuple(self : Size) -> (Int, Int) {
  (self.width, self.height)
}

// From Size to [Int; 2]
///|
pub fn Size::to_array(self : Size) -> Array[Int] {
  [self.width, self.height]
}

// From &Size to (Int, Int)
///|
pub fn Size::to_tuple_ref(self : Size) -> (Int, Int) {
  (self.width, self.height)
}
