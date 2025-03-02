///|
pub type Peer UInt

///|
pub fn Peer::all() -> Peer {
  Peer(0xFF)
}

// TODO: PAD

///|
pub struct Buttons {
  up : Bool
  left : Bool
  right : Bool
  down : Bool
  menu : Bool
}

///|
pub fn Buttons::any(self : Buttons) -> Bool {
  self.up || self.left || self.right || self.down || self.menu
}

///|
pub fn Buttons::any_direction(self : Buttons) -> Bool {
  self.up || self.left || self.right || self.down
}

///|
pub fn Buttons::just_pressed(self : Buttons, old : Buttons) -> Buttons {
  {
    up: self.up && not(old.up),
    down: self.down && not(old.down),
    left: self.left && not(old.left),
    right: self.right && not(old.right),
    menu: self.menu && not(old.menu),
  }
}

///| Given the old state, get buttons that were pressed but aren't pressed now.
pub fn Buttons::just_released(self : Buttons, old : Buttons) -> Buttons {
  {
    up: not(self.up) && old.up,
    down: not(self.down) && old.down,
    left: not(self.left) && old.left,
    right: not(self.right) && old.right,
    menu: not(self.menu) && old.menu,
  }
}

///|
pub fn Buttons::held(self : Buttons, old : Buttons) -> Buttons {
  {
    up: self.up && old.up,
    down: self.down && old.down,
    left: self.left && old.left,
    right: self.right && old.right,
    menu: self.menu && old.menu,
  }
}

///|
pub fn Buttons::read(peer : Peer) -> Buttons {
  let raw = Bindings::read_buttons(peer._)
  {
    down: @internal.Helper::has_bit_set(raw, 0),
    right: @internal.Helper::has_bit_set(raw, 1),
    left: @internal.Helper::has_bit_set(raw, 2),
    up: @internal.Helper::has_bit_set(raw, 3),
    menu: @internal.Helper::has_bit_set(raw, 4),
  }
}

///|
fn Buttons::init() -> Buttons {
  { down: false, up: false, right: false, left: false, menu: false }
}

///|
pub struct Input {
  peer : Peer
  mut currentButtons : Buttons
  mut oldButtons : Buttons
}

///|
pub fn Input::next(self : Input) -> Unit {
  self.oldButtons = self.currentButtons
  self.currentButtons = Buttons::read(self.peer)
}

///|
pub fn Input::init(peer : Peer) -> Input {
  { peer, currentButtons: Buttons::init(), oldButtons: Buttons::init() }
}
