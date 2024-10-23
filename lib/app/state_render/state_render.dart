import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  final String? message;
  final String subMessage;
  final String errorBottomSheetButtonTitle;
  final String title;
  final Function? retryActionFunction;
  final double? maxContentHeight;
  final bool? isSliver;
  final bool? withScaffold;

  const AppState({
    this.message = "",
    this.title = "",
    this.subMessage = "",
    this.errorBottomSheetButtonTitle = "",
    this.maxContentHeight,
    required this.retryActionFunction,
    this.isSliver = false,
    this.withScaffold = false,
  });

  @override
  List<Object?> get props => [];
}

abstract class StateRender {
  void render(AppState state);
}
