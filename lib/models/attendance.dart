import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'attendance.g.dart';

@riverpod
class attendanceNotifier extends _$attendanceNotifier {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;

  void decrement() {
    if (state > 0) state--;
  }
}
