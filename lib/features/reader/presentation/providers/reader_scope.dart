import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/features/reader/presentation/bloc/reader_bloc.dart';

import '../../../../core/di/injection.dart';

class ReaderScope extends StatelessWidget {
  final Widget child;

  const ReaderScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ReaderBloc>(),
        )
      ],
      child: child,
    );
  }
}
