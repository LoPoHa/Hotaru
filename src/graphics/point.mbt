// A point on the screen.
//
// Typically, the upper-left corner of a bounding box of a shape.
///|
pub struct Point {
  // Pixel distance from left.
  mut x : Int
  // Pixel distance from the top.
  mut y : Int
}

///|
pub fn Point::new(x : Int, y : Int) -> Point {
  { x, y }
}

///|
pub fn Point::move_horizontal(self : Point, amount : Int) -> Unit {
  self.x = self.x + amount
}

///|
pub fn Point::move_vertical(self : Point, amount : Int) -> Unit {
  self.y = self.y + amount
}

// Set x and y to their absolute (non-negative) value.
///|
pub fn Point::abs(self : Point) -> Point {
  { x: self.x.abs(), y: self.y.abs() }
}

// Set both x and y to their @internal.Helper::minimum in the two given points.
///|
pub fn Point::component_min(self : Point, other : Point) -> Point {
  {
    x: @internal.Helper::min(self.x, other.x),
    y: @internal.Helper::min(self.x, other.y),
  }
}

// Set both x and y to their @internal.Helper::maximum in the two given points.
///|
pub fn Point::component_max(self : Point, other : Point) -> Point {
  {
    x: @internal.Helper::max(self.x, other.x),
    y: @internal.Helper::max(self.y, other.y),
  }
}

// Add two Points
///|
pub fn Point::add(self : Point, other : Point) -> Point {
  { x: self.x + other.x, y: self.y + other.y }
}

// Add Point and Size
///|
pub fn Point::add_size(self : Point, other : Size) -> Point {
  { x: self.x + other.width, y: self.y + other.height }
}

// Add Assign Point
///|
pub fn Point::add_assign(self : Point, other : Point) -> Unit {
  self.x += other.x
  self.y += other.y
}

// Add Assign Size
///|
pub fn Point::add_assign_size(self : Point, other : Size) -> Unit {
  self.x += other.width
  self.y += other.height
}

// Subtract two Points
///|
pub fn Point::sub(self : Point, other : Point) -> Point {
  { x: self.x - other.x, y: self.y - other.y }
}

// Subtract Point and Size
///|
pub fn Point::sub_size(self : Point, other : Size) -> Point {
  { x: self.x - other.width, y: self.y - other.height }
}

// Subtract Assign Point
///|
pub fn Point::sub_assign(self : Point, other : Point) -> Unit {
  self.x -= other.x
  self.y -= other.y
}

// Subtract Assign Size
///|
pub fn Point::sub_assign_size(self : Point, other : Size) -> Unit {
  self.x -= other.width
  self.y -= other.height
}

// Multiply Point by Int
///|
pub fn Point::mul(self : Point, rhs : Int) -> Point {
  { x: self.x * rhs, y: self.y * rhs }
}

// Multiply Assign Point by Int
///|
pub fn Point::mul_assign(self : Point, rhs : Int) -> Unit {
  self.x *= rhs
  self.y *= rhs
}

// Divide Point by Int
///|
pub fn Point::div(self : Point, rhs : Int) -> Point {
  { x: self.x / rhs, y: self.y / rhs }
}

// Divide Assign Point by Int
///|
pub fn Point::div_assign(self : Point, rhs : Int) -> Unit {
  self.x /= rhs
  self.y /= rhs
}

// Index Point
///|
pub fn Point::index(self : Point, idx : Int) -> Int! {
  if idx == 0 {
    self.x
  } else if idx == 1 {
    self.y
  } else {
    raise IndexOutOfBounds(
      "index out of bounds: the len is 2 but the index is " + idx.to_string(),
    )
  }
}

// Negate Point
///|
pub fn Point::neg(self : Point) -> Point {
  { x: -self.x, y: -self.y }
}

///|
pub fn Point::from_size(value : Size) -> Point {
  { x: value.width, y: value.height }
}

///|
pub fn Point::from_tuple(point : (Int, Int)) -> Point {
  { x: point.0, y: point.1 }
}

///|
pub fn Point::from_array(point : Array[Int]) -> Point {
  { x: point[0], y: point[1] }
}

///|
pub fn Point::from_unint_tuple(point : (UInt, UInt)) -> Point {
  let x = point.0.reinterpret_as_int()
  let y = point.1.reinterpret_as_int()
  { x, y }
}

///|
pub fn Point::from_uint_array(point : Array[UInt]) -> Point {
  let x = point[0].reinterpret_as_int()
  let y = point[1].reinterpret_as_int()
  { x, y }
}

///|
pub fn Point::draw(self : Point, color : Color) -> Unit {
  Bindings::draw_point(self.x, self.y, color.to_int())
}
