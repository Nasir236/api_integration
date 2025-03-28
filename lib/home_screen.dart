// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Apiclass extends StatefulWidget {
  const Apiclass({super.key});

  @override
  State<Apiclass> createState() => _ApiclassState();
}

class _ApiclassState extends State<Apiclass> {
  @override
  getpostApi() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Integration'),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: getpostApi(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]['name']),
                  subtitle: Text(snapshot.data[index]['id'].toString()),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
