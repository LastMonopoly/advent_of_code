// ignore_for_file: avoid_print
// Solution for https://adventofcode.com/2021/day/10

import 'dart:io';

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
    print(getIllegalChar(line));
  }
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