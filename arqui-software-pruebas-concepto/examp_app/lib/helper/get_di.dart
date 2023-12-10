import 'package:examp_app/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:examp_app/data/repository/user_repo.dart';
import 'package:examp_app/controller/controller.dart';
import 'package:examp_app/util/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
    Get.lazyPut(() => UserRepo(apiClient: Get.find()));

    Get.lazyPut(() => Controller(userRepo: Get.find()));

    Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

    return {
        'en_US': {
            'title': 'Flutter Demo Home Page',
            'login': 'Login',
            'email': 'Email',
            'password': 'Password',
            'name': 'Name',
            'register': 'Register',
            'login_error': 'Error al cargar los datos',
            'login_success': 'Login Success',
            'register_error': 'Error al registrar los datos',
            'register_success': 'Register Success',
        },
        'es_ES': {
            'title': 'Página de inicio de demostración de Flutter',
            'login': 'Iniciar sesión',
            'email': 'Correo electrónico',
            'password': 'Contraseña',
            'name': 'Nombre',
            'register': 'Registrarse',
            'login_error': 'Error al cargar los datos',
            'login_success': 'Inicio de sesión correcto',
            'register_error': 'Error al registrar los datos',
            'register_success': 'Registro exitoso',
        },
    };
}