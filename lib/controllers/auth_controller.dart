import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:learn/views/home_view.dart';
import 'package:learn/views/login_view.dart';

class AuthController extends GetxController{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var user = Rxn<User>();
  @override
  void onInit() {
    super.onInit();
    user.bindStream(firebaseAuth.authStateChanges());
  }

  Future<void> register(String email, String password) async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      Get.snackbar('Success', 'Account created successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> login(String email, String password) async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      Get.snackbar('Success', 'Login successful');
      Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> logOut() async{
    try{
      await firebaseAuth.signOut();
      Get.snackbar('Success', 'Login successful');
      Get.offAll(LoginView());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

