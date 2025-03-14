import 'package:get/get.dart';
import 'package:learn/controllers/auth_controller.dart';
import 'package:learn/models/tea_model.dart';
import 'package:learn/services/storage_service.dart';

class TeaController extends GetxController {
  var Menu = <TeaModel>[].obs;
  StorageService storageService = StorageService();
  AuthController authController = Get.put(AuthController());

  @override
  void onInit() {
    super.onInit();
    fetchTea();
  }
  Future <void> fetchTea() async {
    var Tea = await storageService.read('Menu',
    authController.user.value?.uid?? '');
    if (Tea != null) {
      Menu.value = List<TeaModel>.from(
        Tea.map((x) => TeaModel.fromJson(x)),
      );
    }
  }

  Future<void> addMenu(String title, String subtitle) async {
    TeaModel tea = TeaModel(
    title, 
    subtitle, 
    false,
    uid: authController.user.value?.uid
    );
    String docId = await storageService.write('Menu', tea.toJson());
    tea.docId = docId;
    Menu.add(tea);
  }

  Future<void> updateMenu(String docId, String title, String subtitle) async {
    Menu.firstWhere((tea) => tea.docId == docId).title = title;
    Menu.firstWhere((tea) => tea.docId == docId).subtitle = subtitle;
    Menu.refresh();
    await storageService.update('Menu', docId ?? '', Menu.toJson());
  }

  void toggleTea(int index) {
    Menu[index].isDone = !Menu[index].isDone;
    Menu.refresh();
    storageService.update('Menu', Menu[index].docId ?? '', {
      'isDone': Menu[index].isDone,});
  }

  void deleteMenu(String docId) {
    Menu.removeWhere((tea) => tea.docId == docId);
    storageService.delete('Menu', docId);
  }

  void cleanMenu(){
    Menu.clear();
  }
}
