import 'package:flutter/material.dart';
import 'package:puzzles_api/puzzles_api.dart';

class PuzzleListCard extends StatelessWidget {
  const PuzzleListCard({super.key, this.puzzle});
  final Puzzle? puzzle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text('Type: ${puzzle?.puzzleType} '),
          Text('Puzzles: ${puzzle?.noOfPuzzleItems} '),
        ],
      ),
    );
  }
}
