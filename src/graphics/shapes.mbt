pub struct Line {
  a: Point
  b: Point
  style: LineStyle
}

pub fn Line::new(a: Point, b: Point, style: LineStyle) -> Line {
  {
    a,
    b,
    style,
  }
}

pub fn Line::draw(self: Line) -> Unit {
  Bindings::draw_line(self.a.x, self.a.y, self.b.x, self.b.y, self.style.color.to_int(), self.style.width)
}

pub struct LineStyle {
  color: Color
  /// The line stroke width.
  width: Int
}

pub fn LineStyle::new(color: Color, width: Int) -> LineStyle {
  {
    color,
    width,
  }
}

pub struct Style {
    /// The color to use to fill the shape.
    fill_color: Color

    /// The color to use for the shape stroke.
    stroke_color: Color

    /// The width of the shape stroke.
    ///
    /// If zero, a solid shape without a stroke will be drawn.
    stroke_width: Int
}

pub fn Style::new(fill_color: Color, stroke_color: Color, stroke_width: Int) -> Style {
  {
    fill_color,
    stroke_color,
    stroke_width,
  }
}

pub struct Rect {
  point: Point
  size: Size
  style: Style
}

pub fn Rect::new(point: Point, size: Size, style: Style) -> Rect {
  {
    point,
    size,
    style,
  }
}

pub fn Rect::draw(self: Rect) -> Unit {
  Bindings::draw_rect(self.point.x, self.point.y, self.size.width, self.size.height, self.style.fill_color.to_int(), self.style.stroke_color.to_int(), self.style.stroke_width)
}


pub struct RoundedRect {
    point: Point
    size: Size
    corner: Size
    style: Style
}

pub fn RoundedRect::new(point: Point, size: Size, corner: Size, style: Style) -> RoundedRect {
  {
    point,
    size,
    corner,
    style,
  }
}

pub fn RoundedRect::draw(self: RoundedRect) -> Unit {
  Bindings::draw_rounded_rect(self.point.x, self.point.y, self.size.width, self.size.height, self.corner.width, self.corner.height, self.style.fill_color.to_int(), self.style.stroke_color.to_int(), self.style.stroke_width)
}
