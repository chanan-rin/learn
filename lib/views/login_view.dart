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
                image: NetworkImage("https://i.pinimg.com/736x/e7/af/c0/e7afc0f59365d13b1993272cf430a622.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // เนื้อหาหลัก
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // โลโก้
                    Image.asset(
                      "assets/logo.png",
                      height: 180, // ปรับขนาดให้พอดี
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 10),
                    
                    // ชื่อแอป
                    Text(
                      "Tea Charm Cafe",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    // ข้อความ Login
                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    
                    // Email Input
                    _buildInputField(
                      controller: emailController,
                      hintText: "Email",
                      icon: Icons.email,
                    ),
                    SizedBox(height: 15),
                    
                    // Password Input
                    _buildInputField(
                      controller: passwordController,
                      hintText: "Password",
                      icon: Icons.lock,
                      obscureText: true,
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
                    
                    // ลิงก์ไป Register & Forgot Password
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
          ),
        ],
      ),
    );
  }

  // Widget สำหรับสร้างช่องกรอกข้อมูล
  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.white),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
