import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodexample/core/base/base_stateless_view.dart';
import 'package:riverpodexample/view/stateless/stateless_view_notifier.dart';

class StatelessView extends BaseStatelessView<StatelessNotifier, StatelessStates> {
  StatelessView({super.key}) : super(notifier: StatelessNotifier());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless View Example')),
      body: Center(child: Text(state(ref).number.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () => executive(ref).change(10),
      ),
    );
  }
}
