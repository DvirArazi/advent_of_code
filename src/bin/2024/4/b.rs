use std::fs;

struct I32X2 {
  x: i32,
  y: i32,
}

fn main() {
  let input = fs::read_to_string("src/bin/2024/4/input.txt").unwrap();
  let mut lines = input.split('\n').collect::<Vec<_>>();
  lines.pop();
  let board = lines
    .iter()
    .map(|&line| line.chars().collect::<Vec<_>>())
    .collect::<Vec<_>>();

  let mut count = 0;

  for y in 1..board.len() - 1 {
    for x in 1..board[0].len() - 1 {
      if is_x_mas(
        &board,
        I32X2 {
          x: x as i32,
          y: y as i32,
        },
      ) {
        count += 1;
      }
    }
  }

  println!("{}", count);
}

fn is_x_mas(board: &Vec<Vec<char>>, center_i: I32X2) -> bool {
  let at = |add_x: i32, add_y: i32|
    board[(center_i.y + add_y) as usize][(center_i.x + add_x) as usize];

  let is_ms = |a: char, b: char|
    a == 'M' && b == 'S' || a == 'S' && b == 'M';

  at(0, 0) == 'A' && is_ms(at(-1, -1), at(1, 1)) && is_ms(at(-1, 1), at(1, -1))
}
