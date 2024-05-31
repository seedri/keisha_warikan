import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keisha_warikan/models/attendance.dart';
import 'package:keisha_warikan/models/total.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _kingaku = 0;
    final total = ref.watch(totalNotifierProvider);
    final attendance = ref.watch(attendanceNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('合計金額を入力'),
        TextField(
          onChanged: (value) {
            _kingaku = int.parse(value);
          },
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  final notifier =
                      ref.read(attendanceNotifierProvider.notifier);
                  notifier.increment();
                },
                icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  final notifier =
                      ref.read(attendanceNotifierProvider.notifier);
                  notifier.decrement();
                },
                icon: Icon(Icons.remove))
          ],
        ),
        Text(
          '割り勘人数:$attendance',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          '割り勘金額:$total円',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        TextButton(
            onPressed: () {
              final notifier = ref.read(totalNotifierProvider.notifier);
              notifier.updateTotal(_kingaku);
              notifier.warikan(attendance);
            },
            child: Text("割り勘"))
      ],
    );
  }
}
