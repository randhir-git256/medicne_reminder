import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));
      
      if (email != 'ram@gmail.com') {
        errorMessage.value = 'Incorrect Email Address';
        return false;
      }
      
      if (password != 'pass123') {
        errorMessage.value = 'Password don\'t match';
        return false;
      }

      return true;
    } finally {
      isLoading.value = false;
    }
  }
}