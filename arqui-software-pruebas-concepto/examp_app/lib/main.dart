import 'package:examp_app/controller/controller.dart';
import 'package:examp_app/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/get_di.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller controller = Get.find<Controller>();
  String email = '';
  String name = '';
  int id = 0;

  @override
  void initState() {
    super.initState();
    Future<User> user = Get.find<Controller>().login('aescobedoc4@upao.edu.pe', '12345678');
    user.then((value) {
      setState(() {
        id = value.id;
        name = value.name;
        email = value.email;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Datos del Usuario'),
        ),
        body: Center(
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ID: $id',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      'Nombre: $name',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      'Email: $email',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                )
        ),
      ),
    );
  }
}