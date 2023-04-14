import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:puzzles/router/app_router.dart';
import 'package:puzzles_api/puzzles_api.dart';

class PuzzleListCard extends StatelessWidget {
  const PuzzleListCard({super.key, this.puzzle});
  final Puzzle? puzzle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(
          LettersPuzzlesPlayPageRoute(puzzle: puzzle, completed: false),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).cardColor.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text('Type: ${puzzle?.puzzleType} '),
            Text('Puzzles: ${puzzle?.noOfPuzzleItems} '),
            Text('Puzzles: ${puzzle?.toJson()} '),
          ],
        ),
      ),
    );
  }
}
