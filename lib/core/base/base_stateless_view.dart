import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseStatelessNotifier<S> extends StateNotifier<S> {
  BaseStatelessNotifier(super.state);
}

/// [BaseStatelessView] corresponds to [StatefulWidget]
abstract class BaseStatelessView<N extends BaseStatelessNotifier<S>, S extends Equatable> extends ConsumerWidget {
  late final StateNotifierProvider<N, S> _provider;

  @protected
  @mustCallSuper
  N notifier;

  BaseStatelessView({super.key, required this.notifier}) {
    _provider = StateNotifierProvider<N, S>((ref) {
      return notifier;
    });
  }

  StateNotifierProvider<N, S> get provider => _provider;
  void listen(WidgetRef ref, void Function(S? previous, S next) listener) => ref.listen(_provider, listener);
  S state(WidgetRef ref) => ref.watch(_provider);
  N executive(WidgetRef ref) => ref.read(_provider.notifier);
}
