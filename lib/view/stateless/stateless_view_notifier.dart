import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpodexample/core/base/base_stateless_view.dart';

class StatelessNotifier extends BaseStatelessNotifier<StatelessStates> {
  StatelessNotifier() : super(const StatelessStates.initState());

  void change(int number) {
    state = state.copyWith(number: number);
  }
}

@immutable
class StatelessStates extends Equatable {
  final int? number;

  /// Initial State of object
  const StatelessStates.initState({this.number = 5});

  const StatelessStates({
    this.number,
  });

  StatelessStates copyWith({
    int? number,
  }) {
    return StatelessStates(
      number: number ?? this.number,
    );
  }

  @override
  List<Object?> get props => [number];
}
