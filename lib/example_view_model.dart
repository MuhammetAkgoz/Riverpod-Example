import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleProvider extends StateNotifier<ExampleStates> {
  ExampleProvider() : super(ExampleStates.initState());

  void change(int number) {
    state = state.copyWith(number: number);
  }

  void changeLoading() async {
    state = state.copyWith(isLoading: !(state.isLoading));
  }
}

class ExampleStates extends Equatable {
  final int? number;
  final List<int>? numbers;
  final bool isLoading;

  /// Initial State of object
  ExampleStates.initState({this.number = 5, this.isLoading = true}) : numbers = [1, 2, 3, 4, 5, 6, 7];

  const ExampleStates({
    this.number,
    this.numbers,
    required this.isLoading,
  });

  ExampleStates copyWith({
    int? number,
    List<int>? numbers,
    bool? isLoading,
  }) {
    return ExampleStates(
      number: number ?? this.number,
      numbers: numbers ?? this.numbers,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [number, numbers, isLoading];
}
