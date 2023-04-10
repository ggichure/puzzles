import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:puzzles/l10n/l10n.dart';
import 'package:puzzles/puzzles/puzzles.dart';

/// {@template puzzles_type_card}
/// Used to display what types of puzzles.
///
/// [title]  the title of the puzzle type eg xoxo
///
/// [asset] an svg asset path else the title will be used
///
/// [puzzletype] Used to identify type of puzzle when navigating
///  {@endtemplate}
class PuzzleTypeCard extends StatelessWidget {
  const PuzzleTypeCard({
    super.key,
    required this.title,
    this.asset,
    required this.puzzletype,
    this.ontap,
  });

  /// [asset] an svg asset path else the title will be used
  final String? asset;

  /// [title]  the title of the puzzle type eg xoxo
  final String title;

  /// [puzzletype] Used to identify type of puzzle when navigating
  final PUZZLETYPE puzzletype;

  /// used to handle navigation
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              if (asset?.isNotEmpty ?? false)
                SvgPicture.asset(
                  asset!,
                  height: kToolbarHeight,
                  width: kToolbarHeight,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).indicatorColor,
                    BlendMode.srcIn,
                  ),
                ),
              if (asset?.isNotEmpty ?? false)
                const SizedBox(
                  height: 8,
                ),
              Text(
                '$title ${l10n.puzzlesAppBarTitle}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
