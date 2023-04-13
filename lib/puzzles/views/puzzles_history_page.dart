import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzles/puzzles/blocs/puzzles_get/puzzles_get_bloc.dart';
import 'package:puzzles/puzzles/puzzles.dart';
import 'package:puzzles/puzzles/views/widgets/widgets.dart';
import 'package:puzzles/router/app_router.dart';
import 'package:puzzles_repository/puzzles_repository.dart';

class PuzzlesHistoryPage extends StatelessWidget {
  const PuzzlesHistoryPage({super.key, required this.puzzleType});
  final PUZZLETYPE puzzleType;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PuzzlesGetBloc(
        puzzlesRepository: context.read<PuzzlesRepository>(),
      ),
      child: PuzzlesHistoryView(
        puzzleType: puzzleType,
      ),
    );
  }
}

class PuzzlesHistoryView extends StatelessWidget {
  const PuzzlesHistoryView({super.key, required this.puzzleType});
  final PUZZLETYPE puzzleType;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PuzzlesGetBloc>(context).add(
      GetPuzzles(
        enumToString(puzzleType),
      ),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switch (puzzleType) {
            case PUZZLETYPE.letters:
              AutoRouter.of(context)
                  .push(const LetterPuzzleConfigurePageRoute());
              break;
            default:
          }
        },
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('Puzzles'),
          ),
          BlocConsumer<PuzzlesGetBloc, PuzzlesGetState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is PuzzlesGetLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state is PuzzlesGetSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => PuzzleListCard(
                      puzzle: state.puzzles?[index],
                    ),
                    childCount: state.puzzles?.length,
                  ),
                );
              }
              return const SliverToBoxAdapter(
                child: SizedBox(),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
            ),
          )
        ],
      ),
    );
  }
}
