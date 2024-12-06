import argv
import d1p1/d1p1
import gleam/dict
import gleam/io
import gleam/result

fn help() {
  "Usage: ./program problem <problem>\n\nFor example to run the day 1 part 1 problem I would run './program problem d1p1'"
}

fn invalid_problem() {
  "Please pass a valid problem argument"
}

pub fn main() {
  let solutions = dict.from_list([#("d1p1", d1p1.run)])

  let func = case argv.load().arguments {
    ["problem", key] -> {
      dict.get(solutions, key) |> result.unwrap(invalid_problem)
    }
    _ -> help
  }

  io.println(func())
}
