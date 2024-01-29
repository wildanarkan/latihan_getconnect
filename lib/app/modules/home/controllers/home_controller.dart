import 'package:get/get.dart';
import 'package:latihan_getconnect/app/data/models/user_model.dart';
import 'package:latihan_getconnect/app/data/providers/user_provider.dart';

class HomeController extends GetxController {
  UserProvider userProv = UserProvider();

 Future<User?> getUser(int id)async{
  return await userProv.getUser(id);
 }

 Future<List<User>?> getAllUser()async{
  return await userProv.getAllUser();
 }


}
