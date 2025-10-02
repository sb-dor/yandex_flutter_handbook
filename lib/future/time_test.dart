import 'dart:async';


// instead of print1 and print7
// others doing the same thing
// because Future calls Timer.run(callback) -> Timer(Duration.zero, callback) -> Zone.current.createTimer(Duration.zero, callback)
void main() {
  print("1");

  Future(() => print("2"));

  Timer.run(() => print("3"));

  Zone.current.createTimer(Duration.zero, () => print("4"));

  Timer(Duration.zero, () => print("5"));

  Future(() => print("6"));

  print("7");
}
