// ignore_for_file: avoid_print
// Copyright 2022 LastMonopoly@outlook.com. All rights reserved.
// Solution to https://adventofcode.com/2021/day/10

import 'dart:io';

void main() => solveSecondHalf(getInput(fromFile: true));

void solveSecondHalf(List<String> input) {
  List<int> scores = [];
  List<String> completions = [];
  for (String line in input) {
    if (line.isNotEmpty) {
      completions = autoComplete(line);
      if (completions.isNotEmpty) scores.add(scoreAutoCompletion(completions));
    }
  }
  scores.sort();
  print(scores[scores.length ~/ 2]);
}

int scoreAutoCompletion(List<String> completion) {
  Map<String, int> point = {
    ')': 1,
    ']': 2,
    '}': 3,
    '>': 4,
  };

  int sum = 0;
  for (String char in completion) {
    sum *= 5;
    sum += point[char]!;
  }
  return sum;
}

List<String> autoComplete(String line) {
  List<String> stack = [];
  for (int i = 0; i < line.length; i++) {
    String char = line[i];

    if (chunk.containsKey(char)) {
      stack.add(char);
    } else if (char == chunk[stack.last]) {
      stack.removeLast();
    } else {
      return [];
    }
  }

  List<String> completion = [];
  while (stack.isNotEmpty) {
    completion.add(chunk[stack.removeLast()]!);
  }

  return completion;
}

void solveFirstHalf(List<String> input) {
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

Map<String, String> chunk = const {
  '(': ')',
  '[': ']',
  '{': '}',
  '<': '>',
};

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
