import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/puzzles/blocs/puzzle_item_crud/puzzle_item_crud_bloc.dart';
import 'package:puzzles_api/puzzles_api.dart';

class PuzzlesComparisonWidget extends StatelessWidget {
  const PuzzlesComparisonWidget({super.key, required this.puzzleItem});
  final PuzzleItem? puzzleItem;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // choices
            const SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(
                puzzleItem?.choices?.length ?? 0,
                (index) => DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).cardColor.withOpacity(0.2),
                        offset: const Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      puzzleItem?.choices?[index] ?? '',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
            ),
            // buttons
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.greenAccent.withOpacity(.2),
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<PuzzleItemCrudBloc>(context).add(
                      InsertAPuzzleItem(
                        puzzleItem?.copyWith(
                          completedAt: DateTime.now().toIso8601String(),
                          // ignore: use_if_null_to_convert_nulls_to_bools
                          isCorrect: puzzleItem?.isSimilar == true,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.check,
                      color: Colors.greenAccent.withOpacity(.2)),
                  label: Text(l10n.similarText),
                ),
                const SizedBox(
                  width: 18,
                ),
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.red.withOpacity(.2)),
                  ),
                  onPressed: () {
                    BlocProvider.of<PuzzleItemCrudBloc>(context).add(
                      InsertAPuzzleItem(
                        puzzleItem?.copyWith(
                          completedAt: DateTime.now().toIso8601String(),
                          isCorrect: puzzleItem?.isSimilar == false,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red.withOpacity(.2),
                  ),
                  label: Text(l10n.notSimilarText),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
