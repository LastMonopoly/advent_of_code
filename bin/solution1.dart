// ignore_for_file: avoid_print
// Solution for https://adventofcode.com/2021/day/10

import 'dart:io';

void main() => solve(getInput(fromFile: true));

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
  Map<String, int> point = {
    '': 0,
    ')': 3,
    ']': 57,
    '}': 1197,
    '>': 25137,
  };

  int points = 0;
  for (String line in input) {
    if (line.isNotEmpty) {
      points += point[getIllegalChar(line)]!;
    }
  }
  print(points);
}

String getIllegalChar(String line) {
  Map<String, String> chunk = {
    '(': ')',
    '[': ']',
    '{': '}',
    '<': '>',
  };
  List<String> stack = [];

  for (int i = 0; i < line.length; i++) {
    String char = line[i];

    if (chunk.containsKey(char)) {
      stack.add(char);
    } else if (chunk[stack.last] == line[i]) {
      stack.removeLast();
    } else {
      return char;
    }
  }
  return '';
}
