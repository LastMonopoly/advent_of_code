// ignore_for_file: avoid_print
// Copyright 2022 LastMonopoly@outlook.com. All rights reserved.
// Solution for https://adventofcode.com/2021/day/10

import 'dart:io';

void main() => solve(getInput(fromFile: true));

void solve(List<String> input) {
  Map<String, int> point = {
    '': 0,
    ')': 3,
    ']': 57,
    '}': 1197,
    '>': 25137,
  };

  int sum = 0;
  for (String line in input) {
    if (line.isNotEmpty) {
      sum += point[getIllegalChar(line)]!;
    }
  }
  print(sum);
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
    } else if (char == chunk[stack.last]) {
      stack.removeLast();
    } else {
      return char;
    }
  }
  return '';
}

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
