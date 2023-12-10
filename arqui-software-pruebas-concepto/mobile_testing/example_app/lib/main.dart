import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
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
  late User user;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.post(Uri.parse('http://172.20.10.4:8000/api/v1/login'),
        body: {
            "email": "aescobedoc4@upao.edu.pe",
            "password": 12345678
        });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        user = User.fromJson(data['User']);
      });
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Datos del Usuario'),
        ),
        body: Center(
          // ignore: unnecessary_null_comparison
          child: user != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('ID: ${user.id}'),
                    Text('Nombre: ${user.name}'),
                    Text('Email: ${user.email}'),
                    Text('Creado en: ${user.createdAt}'),
                    Text('Actualizado en: ${user.updatedAt}'),
                  ],
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
