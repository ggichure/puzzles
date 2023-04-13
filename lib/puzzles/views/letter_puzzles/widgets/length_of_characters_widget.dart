import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzles/puzzles/blocs/puzzles_creator_bloc/puzzles_creators_bloc.dart';

typedef IntCallback = void Function(int value);

class LengthOfCharactersWidget extends StatefulWidget {
  const LengthOfCharactersWidget({
    super.key,
  });

  @override
  State<LengthOfCharactersWidget> createState() =>
      _LengthOfCharactersWidgetState();
}

class _LengthOfCharactersWidgetState extends State<LengthOfCharactersWidget> {
  double _sliderValue = 4;
  @override
  Widget build(BuildContext context) {
    final puzzlesBloc = context.watch<PuzzlesCreatorsBloc>().state;

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 10,
        trackShape: const RoundedRectSliderTrackShape(),
        activeTrackColor: Theme.of(context).indicatorColor,
        inactiveTrackColor: Theme.of(context).indicatorColor.withOpacity(.1),
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 14,
          pressedElevation: 8,
        ),
        thumbColor: Theme.of(context).cardColor,
        overlayColor: Theme.of(context).cardColor.withOpacity(0.2),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 32),
        tickMarkShape: const RoundSliderTickMarkShape(),
        activeTickMarkColor: Theme.of(context).cardColor,
        inactiveTickMarkColor: Theme.of(context).cardColor,
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: Theme.of(context).cardColor,
        valueIndicatorTextStyle: const TextStyle(
          //color: Colors.white,
          fontSize: 20,
        ),
      ),
      child: Slider(
        value: _sliderValue,
        onChanged: (newValue) {
          context.read<PuzzlesCreatorsBloc>().add(
                PuzzlesConfigurationEvent(
                  puzzlesBloc.puzzle?.copyWith(
                    lengthOfCharacters: newValue.round(),
                  ),
                ),
              );
          setState(() {
            _sliderValue = newValue;
          });
        },
        min: 4,
        max: 20,
        divisions: 160,
        label: _sliderValue.round().toString(),
      ),
    );
  }
}
