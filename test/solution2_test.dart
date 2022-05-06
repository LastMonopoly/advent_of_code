import 'package:test/test.dart';
import '../bin/solution2.dart';

void main() {
  group('Converts string to point', () {
    test('Line 1', () {
      Point p = Point.from('position=< 6, 10> velocity=<-2, -1>');
      expect(p.x, 6);
      expect(p.y, 10);
      expect(p.dx, -2);
      expect(p.dy, -1);
    });

    test('Line 2', () {
      Point p = Point.from('position=<-40143,  50606> velocity=< 4, -5>');
      expect(p.x, -40143);
      expect(p.y, 50606);
      expect(p.dx, 4);
      expect(p.dy, -5);
    });
  });
}
