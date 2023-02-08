import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<St> extends Cubit<St> {
  BaseCubit(St initialState) : super(initialState);

  void init() {}

  void dispose() {}
}
