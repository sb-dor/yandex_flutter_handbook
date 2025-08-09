import 'package:flutter_test/flutter_test.dart';

Matcher containsMap(Map<String, dynamic>? value) => _ContainsMap(value);

class _ContainsMap extends Matcher {
  final Map<String, dynamic>? _value;

  const _ContainsMap(this._value);

  @override
  Description describe(Description description) {
    return description
        .add('Словарь должен содержать все пары значений из проверяемого словаря')
        .addDescriptionOf(_value);
  }

  @override
  bool matches(Object? item, Map matchState) {
    if (_value == null || item == null) {
      return false;
    }

    return _value.entries.every(
      (entry) => (item as Map<String, dynamic>)[entry.key] == entry.value,
    );
  }
}

// Code usage:
// expect(
//   actualResponse as Json,
//   containsMap({
//     'pageName': expectedPrevPageValue,
//     'reqId': expectedRecId.id,
//   }),
// );
