import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    test(
      'given a successful Result, when when() runs, should call success',
      () {
        final result = Result<int>.success(42);

        final output = result.when(
          success: (data) => 'got $data',
          failed: (error) => 'error: ${error.message}',
        );

        expect(output, 'got 42');
      },
    );

    test('given a failed Result, when when() runs, should call failed', () {
      final result = Result<int>.failed(const Error.message('boom'));

      final output = result.when(
        success: (data) => 'got $data',
        failed: (error) => 'error: ${error.message}',
      );

      expect(output, 'error: boom');
    });

    test('isSuccess returns true only for a successful Result', () {
      expect(Result<int>.success(1).isSuccess(), isTrue);
      expect(Result<int>.failed(const Error.message('x')).isSuccess(), isFalse);
    });

    test('two ResultSuccess with the same data are equal', () {
      expect(Result<int>.success(1), equals(Result<int>.success(1)));
    });
  });
}
