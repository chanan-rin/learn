import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controllers/auth_controller.dart';
import 'package:learn/views/register_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลังรูปภาพ
            Container(
            decoration: BoxDecoration(
              image: DecorationImage(
              image: NetworkImage("https://i.pinimg.com/736x/fb/d9/63/fbd963b76bf811ccd5de8ca1fa81bb1e.jpg"), // ใส่ภาพ background ที่เหมือนใน UI
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
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
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
                  SizedBox(height: 20),
                  
                  // ปุ่ม Login
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
                      authController.login(emailController.text, passwordController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Log in", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 15),

                  // ลิงก์ไป Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Get.to(RegisterView()),
                        child: Text("Create Account", style: TextStyle(color: Colors.white)),
                      ),
                      Text("|", style: TextStyle(color: Colors.white70)),
                      TextButton(
                        onPressed: () {}, // TODO: ลิงก์ไปหน้า Forgot Password
                        child: Text("Forgot Password", style: TextStyle(color: Colors.white)),
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
