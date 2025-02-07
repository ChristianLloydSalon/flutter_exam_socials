import 'package:bloc/bloc.dart';

class AuthOptionsCubit extends Cubit<bool> {
  AuthOptionsCubit() : super(false);

  void show() {
    emit(true);
  }

  void hide() {
    emit(false);
  }
}
