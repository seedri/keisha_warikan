import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keisha_warikan/models/total.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _kingaku = 0;
    final total = ref.watch(totalNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('下記に合計金額を入力'),
        TextField(
          onChanged: (value) {
            _kingaku = int.parse(value);
          },
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        Text(
          '$total',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        TextButton(
            onPressed: () {
              final notifier = ref.read(totalNotifierProvider.notifier);
              notifier.updateTotal(_kingaku);
              notifier.divideTwo();
            },
            child: Text("割り勘"))
      ],
    );
  }
}
