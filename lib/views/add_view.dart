import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controllers/tea_controller.dart';
import 'package:learn/models/tea_model.dart';

class AddView extends StatefulWidget {
  AddView({super.key, this.tea});
  TeaModel? tea;
  
  @override
  State<AddView> createState() => _AddViewState();
}
  class _AddViewState extends State<AddView> {

    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();

    TeaController teaController = Get.put(TeaController());

  @override
  void initState() {
    super.initState();
    if (widget.tea != null) {
    titleController.text = widget.tea!.title;
    subtitleController.text = widget.tea!.subtitle;
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.tea == null ? Text("Add Menu") : Text("Edit Menu")),
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
                  if (widget.tea != null) {
                    teaController.updateMenu(
                      widget.tea!.docId ?? '',
                      titleController.text,
                      subtitleController.text,
                    );
                  } else {
                    teaController.addMenu(
                      titleController.text,
                      subtitleController.text,
                    );
                  }
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
