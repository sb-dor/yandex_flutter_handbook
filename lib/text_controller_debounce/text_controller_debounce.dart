import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TextControllerDebounceController {
  TextControllerDebounceController({required TextEditingController textEditingController})
    : _textEditingController = textEditingController {
    _textEditingController.addListener(_listenerForTextEditingController);
  }

  final TextEditingController _textEditingController;

  final BehaviorSubject<String> _streamController = BehaviorSubject();

  Stream<String> get debouncedTextStream =>
      _streamController.debounceTime(const Duration(seconds: 1));

  Stream<String> get distinct => _streamController.distinct();

  Stream<String> get filter => _streamController.where((el) => el.length > 10);

  Stream<String> get skipWhile => _streamController.skipWhile((el) => el.length < 5);

  Stream<List<String>> get bufferCount => _streamController.bufferCount(10);

  Stream<List<String>> get bufferTime => _streamController.bufferTime(Duration(seconds: 3));

  Stream<String> get throttleTime => _streamController.throttleTime(const Duration(seconds: 3));

  Stream<String> get mapped => _streamController.map((el) => el.toUpperCase());

  void _listenerForTextEditingController() {
    _streamController.sink.add(_textEditingController.text);
  }
}
