import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodexample/core/base/base_stateful_view.dart';
import 'package:riverpodexample/view/stateful/stateful_view_notifier.dart';

class StatefulView extends ConsumerStatefulWidget {
  const StatefulView({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulView> createState() => _StatefulViewState();
}

class _StatefulViewState extends BaseStateView<StatefulView, StatefulNotifier, StatefulStates> {
  _StatefulViewState() : super(notifier: StatefulNotifier());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful View Example')),
      body: Center(child: loading),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }

  Widget get loading => state.isLoading ? const CircularProgressIndicator() : const SizedBox();
}
