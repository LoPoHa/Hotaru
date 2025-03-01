///|
struct Images {
  img : @graphics.Image
  img2 : @graphics.Image
  subImg : @graphics.SubImage
  font : @graphics.Font
}

///|
let images : Ref[Images?] = { val: None }

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
      imgs.font.write("Hello World", point, @graphics.Yellow)
    }
    None => @logging.Logger::error("error loading file img")
  }
}

///|
pub fn update() -> Unit {

}
