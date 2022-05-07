import 'package:test/test.dart';
import '../bin/solution_2021day10.dart';

void main() {
  group('Auto complete', () {
    test('Line 1', () {
      expect(autoComplete('[({(<(())[]>[[{[]{<()<>>').join(''), '}}]])})]');
    });

    test('Line 2', () {
      expect(autoComplete('[(()[<>])]({[<{<<[]>>(').join(''), ')}>]})');
    });

    test('Line 3', () {
      expect(autoComplete('(((({<>}<{<{<>}{[]{[]{}').join(''), '}}>}>))))');
    });

    test('Line 4', () {
      expect(autoComplete('{<[[]]>}<{[{[{[]{()[[[]').join(''), ']]}}]}]}>');
    });

    test('Line 5', () {
      expect(autoComplete('<{([{{}}[<[[[<>{}]]]>[]]').join(''), '])}>');
    });
  });

  group('Catch illegal character: all legal', () {
    test('Line 1', () {
      expect(getIllegalChar('([])'), '');
    });

    test('Line 2', () {
      expect(getIllegalChar('{()()()}'), '');
    });

    test('Line 3', () {
      expect(getIllegalChar('<([{}])>'), '');
    });

    test('Line 4', () {
      expect(getIllegalChar('[<>({}){}[([])<>]]'), '');
    });

    test('Line 5', () {
      expect(getIllegalChar('(((((((((())))))))))'), '');
    });
  });

  group('Catch illegal character: all illegal', () {
    test('Line 1', () {
      expect(getIllegalChar('{([(<{}[<>[]}>{[]{[(<()>'), '}');
    });

    test('Line 2', () {
      expect(getIllegalChar('[[<[([]))<([[{}[[()]]]'), ')');
    });

    test('Line 3', () {
      expect(getIllegalChar('[{[{({}]{}}([{[{{{}}([]'), ']');
    });

    test('Line 4', () {
      expect(getIllegalChar('[<(<(<(<{}))><([]([]()'), ')');
    });

    test('Line 5', () {
      expect(getIllegalChar('<{([([[(<>()){}]>(<<{{'), '>');
    });
  });
}
