import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/puzzles/blocs/puzzle_item_crud/puzzle_item_crud_bloc.dart';
import 'package:puzzles/puzzles/views/letter_puzzles/blocs/letter_puzzle_items_generator/letter_puzzle_items_generator_bloc.dart';
import 'package:puzzles_api/puzzles_api.dart';
import 'package:puzzles_repository/puzzles_repository.dart';
import 'package:words_generator_repository/words_generator_repository.dart';

class LettersPuzzlesPlayPage extends StatelessWidget {
  const LettersPuzzlesPlayPage({
    super.key,
    required this.puzzle,
    this.completed,
  });

  /// Puzzle obj
  final Puzzle? puzzle;

  /// whether the puzzle is completed.
  /// used to handle data actions such as timer etc.
  final bool? completed;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LetterPuzzleItemsGeneratorBloc(
            wordsGeneratorRepository: context.read<WordsGeneratorRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => PuzzleItemCrudBloc(
            puzzlesRepository: context.read<PuzzlesRepository>(),
          ),
        ),
      ],
      child: LetterPuzzlesPlayView(
        puzzle: puzzle,
        completed: completed,
      ),
    );
  }
}

class LetterPuzzlesPlayView extends StatelessWidget {
  const LetterPuzzlesPlayView(
      {super.key, required this.puzzle, this.completed});
  final Puzzle? puzzle;
  final bool? completed;

  void generatePuzzleItem(BuildContext context) {
    BlocProvider.of<LetterPuzzleItemsGeneratorBloc>(context)
        .add(GenerateLetterPuzzleItem(puzzle));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (completed ?? false) {
    } else {
      // generate puzzle item
      generatePuzzleItem(context);
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              '${l10n.lettersText} ${l10n.puzzlesAppBarTitle}',
            ),
          ),
          BlocConsumer<PuzzleItemCrudBloc, PuzzleItemCrudState>(
            listener: (context, state) {
              if (state is PuzzleItemCrudSuccess) {
                // generate next puzzle
                generatePuzzleItem(context);
              }
            },
            builder: (context, state) {
              if (state is PuzzleItemCrudLoading) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is PuzzleItemCrudError) {
                return SliverToBoxAdapter(
                  child: TextButton(
                    child: Text(l10n.errorText),
                    onPressed: () {
                      generatePuzzleItem(context);
                    },
                  ),
                );
              }
              return BlocConsumer<LetterPuzzleItemsGeneratorBloc,
                  LetterPuzzleItemsGeneratorState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LetterPuzzleItemsGeneratorLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is LetterPuzzleItemsGeneratorSuccess) {}
                  return SliverToBoxAdapter(
                    child: TextButton(
                      child: Text(l10n.tryAgainText),
                      onPressed: () {
                        generatePuzzleItem(context);
                      },
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
