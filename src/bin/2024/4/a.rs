use std::fs;

const XMAS: &str = "XMAS";

struct I32X2 {
  x: i32,
  y: i32,
}

fn main() {
  let input = fs::read_to_string("src/bin/2024/4/input.txt").unwrap();
  let lines = input.split('\n').collect::<Vec<_>>();
  let board = lines
    .iter()
    .map(|&line| line.chars().collect::<Vec<_>>())
    .collect::<Vec<_>>();

  let dirs = [
    I32X2 { x: -1, y: -1 },
    I32X2 { x: 0, y: -1 },
    I32X2 { x: 1, y: -1 },
    I32X2 { x: -1, y: 0 },
    I32X2 { x: 1, y: 0 },
    I32X2 { x: -1, y: 1 },
    I32X2 { x: 0, y: 1 },
    I32X2 { x: 1, y: 1 },
  ];

  let mut count = 0;

  for y in 0..lines.len() {
    for x in 0..lines[0].len() {
      for dir in &dirs {
        if is_xmas(
          &board,
          I32X2 {
            x: x as i32,
            y: y as i32,
          },
          dir,
        ) {
          count += 1;
        }
      }
    }
  }

  println!("{}", count);
}

fn is_xmas(board: &Vec<Vec<char>>, start_i: I32X2, dir: &I32X2) -> bool {
  (|| -> Option<()> {
    for i in 0..XMAS.len() {
      let x: usize = (start_i.x + dir.x * i as i32).try_into().ok()?;
      let y: usize = (start_i.y + dir.y * i as i32).try_into().ok()?;
      if *board.get(y)?.get(x)? != XMAS.chars().nth(i).unwrap() {
        return None;
      }
    }

    Some(())
  })()
  .is_some()
}