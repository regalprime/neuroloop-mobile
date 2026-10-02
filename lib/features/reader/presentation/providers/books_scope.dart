import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/core/di/injection.dart';
import 'package:neuroloop/features/reader/presentation/bloc/books_bloc/books_bloc.dart';

class BooksScope extends StatelessWidget {
  final Widget child;

  const BooksScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<BooksBloc>(),
        )
      ],
      child: child,
    );
  }
}
