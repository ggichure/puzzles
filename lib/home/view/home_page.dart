import 'package:flutter/material.dart';

import 'package:puzzles/home/view/widgets/home_widgets.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/puzzles/puzzles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(l10n.puzzlesAppBarTitle),
          elevation: 0,
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          childAspectRatio: 1.7,
          children: [
            PuzzleTypeCard(
              title: l10n.lettersText,
              puzzletype: PUZZLETYPE.letters,
            ),
            PuzzleTypeCard(
              title: l10n.xoxoText,
              puzzletype: PUZZLETYPE.xoxo,
            ),
            PuzzleTypeCard(
              title: l10n.shapesText,
              puzzletype: PUZZLETYPE.shapes,
            ),
            PuzzleTypeCard(
              title: l10n.mixedPuzzlesText,
              puzzletype: PUZZLETYPE.mixed,
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 120),
        )
      ],
    ));
  }
}
