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

  void didUpdateWidget(Widget oldWidget) {}
}

abstract class BaseStatefulWidget extends ConsumerStatefulWidget {
  const BaseStatefulWidget({super.key});
}

/// [BaseStateView] corresponds to [StatefulWidget]
abstract class BaseStateView<T extends BaseStatefulWidget, N extends BaseStatefulNotifier<S>, S extends Equatable>
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
    super.dispose();
    notifier.dispose();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    notifier.didUpdateWidget(oldWidget);
  }

  void listen(void Function(S? previous, S next) listener) => ref.listen(_stateNotifierProvider, listener);
  S get state => ref.watch(_stateNotifierProvider);
  N get executive => ref.read(_stateNotifierProvider.notifier);
}
