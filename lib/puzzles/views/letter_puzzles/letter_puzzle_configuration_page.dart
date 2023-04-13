import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/puzzles/blocs/puzzles_creator_bloc/puzzles_creators_bloc.dart';
import 'package:puzzles_repository/puzzles_repository.dart';

class LetterPuzzleConfigurePage extends StatelessWidget {
  const LetterPuzzleConfigurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const LetterPuzzleConfigureView(),
      create: (context) => PuzzlesCreatorsBloc(
        puzzlesRepository: context.read<PuzzlesRepository>(),
      ),
    );
  }
}

class LetterPuzzleConfigureView extends StatelessWidget {
  const LetterPuzzleConfigureView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('${l10n.lettersText} ${l10n.puzzlesAppBarTitle}'),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // length of words

              // time

              /// no of questions
            ]),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 120),
          ),
        ],
      ),
    );
  }
}
