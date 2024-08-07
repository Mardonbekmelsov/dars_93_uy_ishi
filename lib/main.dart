import 'package:dars_93_uy_ishi/blocs/contacts_bloc/contacts_bloc.dart';
import 'package:dars_93_uy_ishi/services/contacts_services.dart';
import 'package:dars_93_uy_ishi/services/message_services.dart';
import 'package:dars_93_uy_ishi/ui/screens/contacts_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ContactsBloc())],
      child: MaterialApp(
        home: ContactsScreen(),
      ),
    );
  }
}
