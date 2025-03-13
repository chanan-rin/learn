import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controllers/tea_controller.dart';
import 'package:learn/models/tea_model.dart';
import 'package:learn/views/add_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final TeaController teaController = Get.put(TeaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tea Charm Cafe'),
        backgroundColor: const Color.fromARGB(255, 112, 83, 62),
        centerTitle: true,
      ),
      body: Obx(() {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 61, 43, 36),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: teaController.Menu.length,
                itemBuilder: (context, index) {
                  TeaModel tea = teaController.Menu[index];
                  return Card(
                    color: const Color.fromARGB(
                      212,
                      161,
                      161,
                      161,
                    ), // เปลี่ยนสีพื้นหลังเป็นสีเทาอ่อน
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: ListTile(
                      title: Text(
                        tea.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 85, 56, 45),
                        ),
                      ),
                      subtitle:
                          tea.subtitle.isEmpty
                              ? null
                              : Text(
                                tea.subtitle,
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 89, 64, 54),
                                ),
                              ),
                      leading: Checkbox(
                        value: tea.isDone,
                        onChanged: (bool? newValue) {
                          teaController.toggleTea(index);
                        },
                        activeColor: const Color.fromARGB(255, 116, 93, 72),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          teaController.deleteMenu(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 170, 64, 57),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddView());
        },
        backgroundColor: const Color.fromARGB(186, 124, 124, 124),
        child: const Icon(Icons.add),
      ),
    );
  }
}
