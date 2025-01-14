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

  'safe_counter: for report in reports {
    print!(
      "{} ",
      report
        .iter()
        .map(|n| n.to_string())
        .collect::<Vec<_>>()
        .join(" ")
    );
    let get_diff = |start: usize, end: usize| -> Option<i32> {
      Some(report.get(end)? - report.get(start)?)
    };

    let rising0 = get_diff(0, 1).map_or(true, |diff| diff > 0);
    let rising1 = get_diff(1, 2).map_or(rising0, |diff| diff > 0);
    let rising2 = get_diff(2, 3).map_or(rising0, |diff| diff > 0);
    let ascends = if rising0 && rising1 { rising0 } else { rising2 };

    let is_diff_valid = |start: usize, end: usize| -> Option<bool> {
      let mut diff = get_diff(start, end)?;
      if !ascends {
        diff *= -1;
      }

      Some(diff >= 1 && diff <= 3)
    };

    let mut found_bad = false;
    let mut i = 0;
    while i < report.len() - 1 {
      if !is_diff_valid(i, i + 1).unwrap() {
        if !found_bad {
          if let Some(is_valid) = is_diff_valid(i, i + 2) {
            if !(is_valid || is_diff_valid(i + 1, i + 2).unwrap()) {
              println!("Unsafe");
              continue 'safe_counter;
            }
            found_bad = true;
          }
          i += 2;
          continue;
        }
        println!("Unsafe");
        continue 'safe_counter;
      }
      i += 1;
    }
    println!("Safe");
    safe_count += 1
  }

  println!("{}", safe_count);
}
