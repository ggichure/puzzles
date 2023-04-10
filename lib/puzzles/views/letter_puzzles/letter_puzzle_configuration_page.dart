import 'package:flutter/material.dart';
import 'package:puzzles/l10n/l10n.dart';

class LetterPuzzleConfigurePage extends StatelessWidget {
  const LetterPuzzleConfigurePage({super.key});

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
