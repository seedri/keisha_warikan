import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'total.g.dart';

@riverpod
class totalNotifier extends _$totalNotifier {
  @override
  int build() {
    return 0;
  }

  void updateTotal(int kingaku) {
    state = kingaku;
  }

  void divideTwo() {
    if (state % 2 == 1) state++;
    state = state ~/ 2;
  }

  void warikan(int attendance) {
    state = state ~/ attendance;
  }
}
