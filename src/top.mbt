///|
struct Images {
  img : @graphics.Image
  img2 : @graphics.Image
  subImg : @graphics.SubImage
  font : @graphics.Font
}

let input: @input.Input = @input.Input::init(@input.Peer::all())

///|
let images : Ref[Images?] = { val: None }

///|
struct State {
  position : @graphics.Point
}

///|
let state : State = { position: @graphics.Point::new(0, 0) }

///|
pub fn boot() -> Unit {
  try {
    let img = @graphics.Image::load_file!("img")
    let subImg = img.sub(
      @graphics.Point::new(0, 0),
      @graphics.Size::new(20, 20),
    )
    images.val = Some({
      img,
      img2: @graphics.Image::load_file!("img2"),
      subImg,
      font: @graphics.Font::load_file!("font"),
    })
  } catch {
    _ => @logging.Logger::error("error loading file img")
  }
}

///|
pub fn render() -> Unit {
  let point = @graphics.Point::new(10, 10)
  match images.val {
    Some(imgs) => {
      //imgs.img2.draw(point)
      imgs.subImg.draw(point)
      imgs.font.write("Hello World", state.position, @graphics.Yellow)
      @graphics.Rect::new(@graphics.Point::new(100, 100), @graphics.Size::new(40, 40), @graphics.Style::new(@graphics.Cyan, @graphics.Green, 2)).draw()
      @graphics.RoundedRect::new(@graphics.Point::new(50, 50), @graphics.Size::new(40, 40), @graphics.Size::new(5, 5), @graphics.Style::new(@graphics.Cyan, @graphics.Green, 2)).draw()
    }
    None => @logging.Logger::error("error loading file img")
  }
}

///|
pub fn update() -> Unit {
  input.next()
  if input.currentButtons.right {
    state.position.move_horizontal(1)
  }
  if input.currentButtons.down {
    state.position.move_vertical(1)
  }
  if input.currentButtons.left {
    state.position.move_horizontal(-1)
  }
  if input.currentButtons.up {
    state.position.move_vertical(-1)
  }
}
