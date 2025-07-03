import 'package:card_list/presentation/home/cubit/card_cubit.dart';
import 'package:card_list/core/router/app_router.dart';
import 'package:card_list/core/utils/color/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<CardCubit>(
      create: (context) => CardCubit(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CardList App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColors.primary,
        hoverColor: CustomColors.primary.withOpacity(0.1),
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primary),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
