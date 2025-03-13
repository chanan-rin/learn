import 'package:get/get.dart';
import 'package:learn/models/tea_model.dart';
import 'package:learn/services/storage_service.dart';

class TeaController extends GetxController {
  var Menu = <TeaModel>[].obs;
  StorageService storageService = StorageService();

  @override
  void onInit() {
    super.onInit();
    fetchMenus();
  }
  void fetchMenus() async {
    var Menus = await storageService.read('Menu');
    if (Menus != null) {
      Menu.value = List<TeaModel>.from(
        Menus.map((x) => TeaModel.fromJson(x)),
      );
    }
  }

  void addMenu(String title, String subtitle) {
    Menu.add(TeaModel(title: title, subtitle: subtitle, isDone: false));
    storageService.write('Menu', Menu.toJson());
  }

  void toggleTea(int index) {
    Menu[index].isDone = !Menu[index].isDone;
    Menu.refresh();
  }

  void deleteMenu(int index) {
    Menu.removeAt(index);
  }
}
