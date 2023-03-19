import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseStatefulNotifier<S> extends StateNotifier<S> {
  BaseStatefulNotifier(super.state);

  void onInit() {}

  @override
  void dispose() {
    super.dispose();
  }
}

/// [BaseStateView] corresponds to [StatefulWidget]
abstract class BaseStateView<T extends ConsumerStatefulWidget, N extends BaseStatefulNotifier<S>, S extends Equatable>
    extends ConsumerState<T> {
  late final StateNotifierProvider<N, S> _stateNotifierProvider;

  /// [notifier] of state class
  @mustCallSuper
  final N notifier;

  BaseStateView({required this.notifier}) {
    _stateNotifierProvider = StateNotifierProvider<N, S>((ref) {
      return notifier;
    });
  }

  @override
  void initState() {
    super.initState();
    notifier.onInit();
  }

  @override
  void dispose() {
    notifier.dispose();
  }

  void listen(void Function(S? previous, S next) listener) => ref.listen(_stateNotifierProvider, listener);
  S get state => ref.watch(_stateNotifierProvider);
  N get executive => ref.read(_stateNotifierProvider.notifier);
}
