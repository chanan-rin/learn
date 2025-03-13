import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controllers/auth_controller.dart';
import 'package:learn/views/login_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController(); 
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลังรูปภาพ
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
              image: NetworkImage("https://i.pinimg.com/736x/25/43/ce/2543ce8560994a8ff57a1f53fddff0ee.jpg"), // ใส่ภาพ background ที่เหมือนใน UI
              fit: BoxFit.cover,
              ),
            ),
          ),
          // เนื้อหาหลัก
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ข้อความ Welcome
                  Text(
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Email Input
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, color: Colors.white),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white70),
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Password Input
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white70),
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Confirm Password Input
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: confirmpasswordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.white70),
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // ปุ่ม Register
                  ElevatedButton(
                    onPressed: () {
                      if (!GetUtils.isEmail(emailController.text)) {
                        Get.snackbar("Error", "Please enter a valid email");
                        return;
                      }
                      if (passwordController.text.length < 6) {
                        Get.snackbar("Error", "Password must be at least 6 characters");
                        return;
                      }
                      if (passwordController.text != confirmpasswordController.text) {
                        Get.snackbar("Error", "Passwords do not match");
                        return;
                      }
                      authController.register(emailController.text, passwordController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Register", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 15),

                  // ลิงก์ไปหน้า Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ", style: TextStyle(color: Colors.white)),
                      Text("|", style: TextStyle(color: Colors.white70)),
                      TextButton(
                        onPressed: () => Get.to(LoginView()),
                        child: Text("Log in", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
