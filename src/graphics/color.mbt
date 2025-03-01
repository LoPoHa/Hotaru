///| A pointer to a color in the color palette.
pub enum Color {
  /// No color (100% transparency).
  None
  /// Black color: #1A1C2C.
  Black
  /// Purple color: #5D275D.
  Purple
  /// Red color: #B13E53.
  Red
  /// Orange color: #EF7D57.
  Orange
  /// Yellow color: #FFCD75.
  Yellow
  /// Light green color: #A7F070.
  LightGreen
  /// Green color: #38B764.
  Green
  /// Dark green color: #257179.
  DarkGreen
  /// Dark blue color: #29366F.
  DarkBlue
  /// Blue color: #3B5DC9.
  Blue
  /// Light blue color: #41A6F6.
  LightBlue
  /// Cyan color: #73EFF7.
  Cyan
  /// White color: #F4F4F4.
  White
  /// Light gray color: #94B0C2.
  LightGray
  /// Gray color: #566C86.
  Gray
  /// Dark gray color: #333C57.
  DarkGray
}

///|
fn Color::to_int(self : Color) -> Int {
  match self {
    Color::None => 0
    Color::Black => 1
    Color::Purple => 2
    Color::Red => 3
    Color::Orange => 4
    Color::Yellow => 5
    Color::LightGreen => 6
    Color::Green => 7
    Color::DarkGreen => 8
    Color::DarkBlue => 9
    Color::Blue => 10
    Color::LightBlue => 11
    Color::Cyan => 12
    Color::White => 13
    Color::LightGray => 14
    Color::Gray => 15
    Color::DarkGray => 16
  }
}
