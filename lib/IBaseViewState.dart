import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseViewState<T extends ConsumerStatefulWidget, P extends StateNotifier<S>, S extends Equatable>
    extends ConsumerState<T> {
  late final StateNotifierProvider<P, S> _stateNotifierProvider;
  final P provider;

  BaseViewState({required this.provider}) {
    _stateNotifierProvider = StateNotifierProvider<P, S>((ref) {
      return provider;
    });
  }

  void listen(void Function(S? previous, S next) listener) => ref.listen(_stateNotifierProvider, listener);
  S get state => ref.watch(_stateNotifierProvider);
  P get logic => ref.read(_stateNotifierProvider.notifier);
}
