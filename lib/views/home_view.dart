import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controllers/auth_controller.dart';
import 'package:learn/controllers/tea_controller.dart';
import 'package:learn/models/tea_model.dart';
import 'package:learn/views/add_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  TeaController teaController = Get.put(TeaController());
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/736x/4e/cb/e6/4ecbe633d057d1a14ddb72d53d8a221c.jpg",
              ), // ใส่ภาพ background ที่เหมือนใน UI
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.darken,
              ),
            ),
          ),
          child: Column(
            children: [
              // AppBar(
              //   title: const Text('Tea Charm Cafe'),
              //   backgroundColor: Colors.brown.withOpacity(
              //     0.8,
              //   ), // ทำให้โปร่งแสงเล็กน้อย
              //   centerTitle: true,
              //   actions: [
              //     IconButton(
              //       icon: const Icon(Icons.logout),
              //       onPressed: () {
              //         teaController.cleanMenu();
              //         authController.logOut();
              //       },
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.transparent),
                    onPressed: () {},
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "MENU",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () {
                      teaController.cleanMenu();
                      authController.logOut();
                    },
                  ),
                ],
              ),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: teaController.Menu.length,
                    itemBuilder: (context, index) {
                      TeaModel tea = teaController.Menu[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                            0.9,
                          ), // โปร่งแสงเล็กน้อย
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: tea.isDone,
                                  onChanged: (bool? newValue) {
                                    teaController.toggleTea(index);
                                  },
                                  activeColor: Colors.brown,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tea.title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown,
                                      ),
                                    ),
                                    if (tea.subtitle.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          "${tea.subtitle.toString()}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                teaController.deleteMenu(tea.docId ?? '');
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddView());
          },
          backgroundColor: Colors.brown,
          child: const Icon(Icons.add),
          elevation: 5,
        ),
      ),
    );
  }
}
