use std::fs;

fn main() {
  let text = fs::read_to_string("src/bin/2024/2/input.txt").unwrap();

  let lines = text.split('\n').collect::<Vec<_>>();
  let lines = lines[..lines.len() - 1].to_vec();
  let reports = lines
    .iter()
    .map(|line| {
      line
        .split(' ')
        .map(|level| level.parse::<i32>().unwrap())
        .collect::<Vec<_>>()
    })
    .collect::<Vec<_>>();

  let mut safe_count = 0;

  'counter: for report in reports {
    let ascends = report[1] - report[0] > 0;
    for i in 0..report.len() - 1 {
      let diff = (report[i + 1] - report[i]) * if ascends { 1 } else { -1 };
      if !(diff >= 1 && diff <= 3) {
        continue 'counter;
      }
    }
    safe_count += 1;
  }

  println!("{}", safe_count);
}
