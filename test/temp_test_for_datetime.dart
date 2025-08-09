import 'package:clock/clock.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';

// Clock — это, по сути, «розетка времени», а DateTime — просто «снимок времени».
void main() {
  test('Разница между DateTime и Clock с fakeAsync', () {
    fakeAsync((fa) {
      // --- 1. DateTime фиксируется при создании ---
      final fixedDateTime = DateTime.now();

      // --- 2. Clock по умолчанию будет получать время у fakeAsync ---
      final clockNow = clock.now();
      // final fixedClockNow = Clock.fixed(fixedDateTime);

      print('Сразу после старта:');
      print('DateTime: $fixedDateTime');
      print('Clock:    $clockNow');

      // Симулируем, что прошло 1 час
      fa.elapse(Duration(days: 1));

      print('\nЧерез 1 час:');
      print('DateTime: $fixedDateTime'); // ❌ то же самое время
      print('Clock:    ${clock.now()}'); // ✅ время изменилось
    });
  });
}
