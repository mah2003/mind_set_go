/*import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);

  }

  login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      AppLocalStorage.cacheData(
          key: AppLocalStorage.token, value: credential.user!.uid);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState("المستخدم غير موجود"));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState("كلمة المرور غير صحيحة"));
      } else {
        emit(AuthErrorState("حدث خطأ ما"));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthErrorState("حدث خطأ ما"));
    }
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      User? user = credential.user;
      user?.updateDisplayName(event.name);
      user?.updatePhotoURL(event.userType.name);
      // store into fireStore
      if (event.userType == UserType.doctor) {
        FirebaseFirestore.instance.collection("doctors").doc(user?.uid).set({
          'name': event.name,
          'image': '',
          'specialization': '',
          'rating': 3,
          'email': event.email,
          'phone1': '',
          'phone2': '',
          'bio': '',
          'openHour': '',
          'closeHour': '',
          'address': '',
          'uid': user?.uid,
        });
      } else {
        FirebaseFirestore.instance.collection('patients').doc(user?.uid).set({
          'name': event.name,
          'image': '',
          'age': null,
          'email': event.email,
          'phone': '',
          'bio': '',
          'city': '',
          'uid': user?.uid,
        });
      }
      AppLocalStorage.cacheData(
          key: AppLocalStorage.token, value: credential.user!.uid);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState("كلمة المرور ضعيفة"));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState("البريد الالكتروني مستخدم بالفعل"));
      } else {
        emit(AuthErrorState("حدث خطأ ما"));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthErrorState("حدث خطأ ما"));
    }
  }

  updateDoctorData(DoctorRegistrationEvent event, Emitter<AuthState> emit) {
    emit(DoctorRegistrationLoadingState());
    try {
      FirebaseFirestore.instance
          .collection("doctors")
          .doc(event.doctorModel.uid)
          .update(event.doctorModel.toJson());
      emit(DoctorRegistrationSuccessState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}*/