import 'package:examp_app/data/model/user.dart';
import 'package:examp_app/data/repository/user_repo.dart';
import 'package:get/get.dart';


class Controller extends GetxController implements GetxService {
  final UserRepo userRepo;
  Controller({required this.userRepo});

  String name = "";
  String email = "";
  int id = 0;

  String get getName => name;
  String get getEmail => email;
  int get getId => id;

  Future<User> login(String email, String password) async {
    Response response = await userRepo.login(email: email, password: password);
    if (response.statusCode == 200) {
      final data = response.body['User'];
      User user = User.fromJson(data);
      return user;
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}