import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forcard/app/shared/models/user.dart';

class AuthCubit extends Cubit<User?> {
  AuthCubit() : super(null);

  void sign(email, password) async => emit(state);
}
