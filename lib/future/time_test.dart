import 'dart:async';

// instead of print1, print7 and Future.microtasks
// others doing the same thing
// because Future calls Timer.run(callback) -> Timer(Duration.zero, callback) -> Zone.current.createTimer(Duration.zero, callback)
void main() {
  // 1
  print("1");

  // 5
  Future(() => print("2"));

  // 6
  Timer.run(() => print("3"));

  // 3
  Future.microtask(() => print("4"));

  // 7
  Zone.current.createTimer(Duration.zero, () => print("5"));

  // 4
  Future.microtask(() => print("6"));

  // 8
  Timer(Duration.zero, () => print("7"));

  // 9
  Future(() => print("8"));

  // 2
  print("9");
}
