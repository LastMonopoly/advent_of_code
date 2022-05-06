// ignore_for_file: avoid_print
// Solution for https://adventofcode.com/2021/day/10

import 'dart:io';

bool pass() => true;

void main() => solve(getInput(fromFile: false));

List<String> getInput({required bool fromFile}) {
  if (fromFile) {
    return File('./assets/input1.txt').readAsLinesSync();
  } else {
    return """
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
"""
        .split('\n');
  }
}

void solve(List<String> input) {
  for (String line in input) {
    print(line);
  }
}
