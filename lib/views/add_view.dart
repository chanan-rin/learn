import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controllers/tea_controller.dart';

class AddView extends StatelessWidget {
  AddView({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  final TeaController teaController = Get.put(TeaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Menu")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Price",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(
                hintText: "Enter price",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty) return;
                  teaController.addMenu(
                    titleController.text,
                    subtitleController.text,
                  );
                  Get.back();
                  Get.snackbar(
                    "แจ้งเตือน",
                    "success",
                    backgroundColor: Colors.lightBlueAccent[100],
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: Text("Add Menu"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
