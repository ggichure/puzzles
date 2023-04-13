import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/puzzles/blocs/puzzles_creator_bloc/puzzles_creators_bloc.dart';
import 'package:puzzles/puzzles/views/letter_puzzles/widgets/widgets.dart';
import 'package:puzzles_api/puzzles_api.dart';
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
    context.read<PuzzlesCreatorsBloc>().add(
          const PuzzlesConfigurationEvent(
            Puzzle(
              puzzleType: 'LTRS',
              noOfPuzzleItems: 100,
              lengthOfCharacters: 4,
              durationInSeconds: 3,
            ),
          ),
        );

    return Scaffold(
      body: BlocConsumer<PuzzlesCreatorsBloc, PuzzlesCreatorsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('${l10n.lettersText} ${l10n.puzzlesAppBarTitle}'),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 12,
                  ),
                  // length of words
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      '''Select length of words : ${state.puzzle?.lengthOfCharacters}''',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LengthOfCharactersWidget(
                    onTap: (int i) {
                      BlocProvider.of<PuzzlesCreatorsBloc>(context).add(
                        PuzzlesConfigurationEvent(
                          state.puzzle?.copyWith(
                            lengthOfCharacters: i,
                          ),
                        ),
                      );
                    },
                  ),
                  // time
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      '''Select desired time to complete puzzles in minutes ${state.puzzle?.durationInSeconds}''',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LengthOfCharactersWidget(
                    minValue: 1,
                    maxValue: 100,
                    onTap: (int i) {
                      BlocProvider.of<PuzzlesCreatorsBloc>(context).add(
                        PuzzlesConfigurationEvent(
                          state.puzzle?.copyWith(
                            durationInSeconds: i,
                          ),
                        ),
                      );
                    },
                  ),

                  /// no of questions
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      '''Select desired no of puzzles ${state.puzzle?.noOfPuzzleItems}''',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LengthOfCharactersWidget(
                    minValue: 1,
                    maxValue: 200,
                    onTap: (int i) {
                      BlocProvider.of<PuzzlesCreatorsBloc>(context).add(
                        PuzzlesConfigurationEvent(
                          state.puzzle?.copyWith(
                            noOfPuzzleItems: i,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<PuzzlesCreatorsBloc>(context).add(
                        PuzzlesCreateEvent(
                          state.puzzle,
                        ),
                      );
                    },
                    child: const Text('Start'),
                  )
                ]),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 120),
              ),
            ],
          );
        },
      ),
    );
  }
}
