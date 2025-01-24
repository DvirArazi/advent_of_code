use std::fs;

fn main() {
  let input = fs::read_to_string("src/bin/2024/3/input.txt").unwrap();

  let mut stage = 0;
  let mut i = 0;
  let (mut a_crnt, mut b_crnt) = (0, 0);
  let (mut a_found, mut b_found) = (false, false);
  let mut sum = 0;
  while i < input.len() {
    match stage {
      0 => {
        if input[i..].starts_with("mul(") {
          a_crnt = 0;
          b_crnt = 0;
          a_found = false;
          b_found = false;
          stage = 1;
          i += 4;
          continue;
        }
      }
      1 => {
        let ch = input.chars().nth(i).unwrap();
        if let Some(digit) = ch.to_digit(10) {
          a_found = true;
          a_crnt = a_crnt * 10 + digit;
          i += 1;
          continue;
        }
        if a_found && ch == ',' {
          stage = 2;
          i += 1;
          continue;
        }
        stage = 0;
      }
      2 => {
        let ch = input.chars().nth(i).unwrap();
        if let Some(digit) = ch.to_digit(10) {
          b_found = true;
          b_crnt = b_crnt * 10 + digit;
          i += 1;
          continue;
        }
        if b_found && ch == ')' {
          sum += a_crnt * b_crnt;
          stage = 0;
          i += 1;
          continue;
        }
        stage = 0;
      }
      _ => (),
    }

    i += 1;
  }

  println!("{}", sum);
}
