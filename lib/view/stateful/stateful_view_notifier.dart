import 'package:equatable/equatable.dart';
import 'package:riverpodexample/core/base/base_stateful_view.dart';

class StatefulNotifier extends BaseStatefulNotifier<StatefulStates> {
  StatefulNotifier() : super(StatefulStates.initState());

  void change(int number) {
    state = state.copyWith(number: number);
  }

  void _changeLoading() {
    state = state.copyWith(isLoading: !(state.isLoading));
  }

  @override
  void onInit() async {
    super.onInit();
    print('onInıt excecuted');
    await Future.delayed(const Duration(seconds: 5), () => _changeLoading());
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class StatefulStates extends Equatable {
  final int? number;
  final List<int>? numbers;
  final bool isLoading;

  /// Initial State of object
  StatefulStates.initState({this.number = 5, this.isLoading = true}) : numbers = [1, 2, 3, 4, 5, 6, 7];

  const StatefulStates({
    this.number,
    this.numbers,
    required this.isLoading,
  });

  StatefulStates copyWith({
    int? number,
    List<int>? numbers,
    bool? isLoading,
  }) {
    return StatefulStates(
      number: number ?? this.number,
      numbers: numbers ?? this.numbers,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [number, numbers, isLoading];
}
