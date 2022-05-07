// ignore_for_file: avoid_print
// Copyright 2022 LastMonopoly@outlook.com. All rights reserved.
// Solution for https://adventofcode.com/2018/day/10

import 'dart:io';

void main() => solve(getInput(fromFile: true));

void solve(List<String> input) {
  List<Point> points = [];

  for (String line in input) {
    if (line.isNotEmpty) {
      points.add(Point.parse(line));
    }
  }

  late List<Point> area;

  // Find out when the area size is the smallest within the first 100,000 seconds
  int? minAreaSize;
  int? minAreaTime;
  for (int t = 0; t < 100000; t += 1) {
    area = computeArea(points);
    Point topLeft = area[0];
    Point bottomRight = area[1];

    int width = bottomRight.x - topLeft.x;
    int height = bottomRight.y - topLeft.y;
    int size = width * height;

    minAreaSize ??= size;
    minAreaTime ??= t;
    if (size < minAreaSize) {
      minAreaSize = size;
      minAreaTime = t;
      // print('Seconds: $t, $sizeX x $sizeY, $size');
    }

    move(points, 1);
  }

  // Restart the simulation
  points = [];
  for (String line in input) {
    if (line.isNotEmpty) {
      points.add(Point.parse(line));
    }
  }
  // This time, print the image when time is close to minAreaTime
  int numOfPrints = 3;
  int t = minAreaTime! - (numOfPrints - 1) ~/ 2;
  move(points, t);

  for (int i = 0; i < numOfPrints; i++) {
    area = computeArea(points);
    print('After ${t + i} seconds:');
    print(computeImage(points, area[0], area[1]).join('\n'));
    print('');
    move(points, 1);
  }
}

List<String> computeImage(
    List<Point> points, Point topLeft, Point bottomRight) {
  List<String> lines = [];
  for (int y = topLeft.y; y <= bottomRight.y; y++) {
    List<String> line = [];
    for (int x = topLeft.x; x <= bottomRight.x; x++) {
      if (points.contains(Point(x, y, 0, 0))) {
        line.add('#');
      } else {
        line.add('.');
      }
    }
    lines.add(line.join(''));
  }
  return lines;
}

move(List<Point> points, int seconds) {
  for (Point point in points) {
    point.x += seconds * point.dx;
    point.y += seconds * point.dy;
  }
}

/// Returns the area that can cover all the points.
List<Point> computeArea(List<Point> points) {
  int minX, minY, maxX, maxY;
  minX = points[0].x;
  minY = points[0].y;
  maxX = points[0].x;
  maxY = points[0].y;

  for (Point point in points) {
    if (point.x < minX) minX = point.x;
    if (point.x > maxX) maxX = point.x;
    if (point.y < minY) minY = point.y;
    if (point.y > maxY) maxY = point.y;
  }

  return [
    Point(minX, minY, 0, 0),
    Point(maxX, maxY, 0, 0),
  ];
}

class Point {
  int x, y, dx, dy;

  Point(this.x, this.y, this.dx, this.dy);

  static Point parse(String line) {
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
    return '[$x, $y] +[$dx, $dy])';
  }

  /// two points are equal if they are at the same location
  @override
  bool operator ==(Object other) {
    return other is Point && x == other.x && y == other.y;
  }

  @override
  int get hashCode => x * x + y * y;
}

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
