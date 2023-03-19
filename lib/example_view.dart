import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodexample/IBaseViewState.dart';
import 'package:riverpodexample/example_view_model.dart';

class ExampleView extends ConsumerStatefulWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  ConsumerState<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends BaseViewState<ExampleView, ExampleProvider, ExampleStates> {
  _ExampleViewState() : super(provider: ExampleProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Example')),
      body: Center(child: loading),
      floatingActionButton: FloatingActionButton(onPressed: () => logic.changeLoading()),
    );
  }

  Widget get loading => state.isLoading ? const CircularProgressIndicator() : const SizedBox();
}
