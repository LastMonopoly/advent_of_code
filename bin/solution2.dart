// ignore_for_file: avoid_print
// Solution for https://adventofcode.com/2018/day/10

import 'dart:io';

void main() => solve(getInput(fromFile: false));

List<String> getInput({required bool fromFile}) {
  if (fromFile) {
    return File('./assets/input2.txt').readAsLinesSync();
  } else {
    return """
position=< 9,  1> velocity=< 0,  2>
position=< 7,  0> velocity=<-1,  0>
position=< 3, -2> velocity=<-1,  1>
position=< 6, 10> velocity=<-2, -1>
position=< 2, -4> velocity=< 2,  2>
position=<-6, 10> velocity=< 2, -2>
position=< 1,  8> velocity=< 1, -1>
position=< 1,  7> velocity=< 1,  0>
position=<-3, 11> velocity=< 1, -2>
position=< 7,  6> velocity=<-1, -1>
position=<-2,  3> velocity=< 1,  0>
position=<-4,  3> velocity=< 2,  0>
position=<10, -3> velocity=<-1,  1>
position=< 5, 11> velocity=< 1, -2>
position=< 4,  7> velocity=< 0, -1>
position=< 8, -2> velocity=< 0,  1>
position=<15,  0> velocity=<-2,  0>
position=< 1,  6> velocity=< 1,  0>
position=< 8,  9> velocity=< 0, -1>
position=< 3,  3> velocity=<-1,  1>
position=< 0,  5> velocity=< 0, -1>
position=<-2,  2> velocity=< 2,  0>
position=< 5, -2> velocity=< 1,  2>
position=< 1,  4> velocity=< 2,  1>
position=<-2,  7> velocity=< 2, -2>
position=< 3,  6> velocity=<-1, -1>
position=< 5,  0> velocity=< 1,  0>
position=<-6,  0> velocity=< 2,  0>
position=< 5,  9> velocity=< 1, -2>
position=<14,  7> velocity=<-2,  0>
position=<-3,  6> velocity=< 2, -1>
"""
        .split('\n');
  }
}

void solve(List<String> input) {
  for (String line in input) {
    if (line.isNotEmpty) {
      print(line);
      print(Point.from(line));
    }
  }
}

class Point {
  int x, y, dx, dy;

  Point(this.x, this.y, this.dx, this.dy);

  static Point from(String line) {
    assert(line.isNotEmpty);

    int x, y, dx, dy;
    int l, r;

    l = line.indexOf('<');
    r = line.indexOf(',');
    x = int.parse(line.substring(l + 1, r));
    l = line.indexOf(',');
    r = line.indexOf('>');
    y = int.parse(line.substring(l + 1, r));
    l = line.lastIndexOf('<');
    r = line.lastIndexOf(',');
    dx = int.parse(line.substring(l + 1, r));
    l = line.lastIndexOf(',');
    r = line.lastIndexOf('>');
    dy = int.parse(line.substring(l + 1, r));

    return Point(x, y, dx, dy);
  }

  @override
  String toString() {
    return 'p($x, $y) v($dx, $dy)';
  }
}
