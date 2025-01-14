use std::fs;

fn main() {
  let text = fs::read_to_string("src/bin/2024/1/input.txt").unwrap();

  let lines = text.split("\n").collect::<Vec<_>>();

  let mut column0 = Vec::<i32>::with_capacity(lines.len());
  let mut column1 = Vec::<i32>::with_capacity(lines.len());
  for line in &lines[..lines.len() - 1] {
    let parts = 
      line
        .split("   ")
        .map(|part| part.parse::<i32>().unwrap())
        .collect::<Vec<_>>();
    column0.push(parts[0]);
    column1.push(parts[1]);
  }

  let mut diff = 0;

  for num in column0 {
    let add :i32 = column1.iter().filter(|x| **x == num).count().try_into().unwrap();
    diff += num * add;
  }

  println!("{}", diff);
}