import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzles/puzzles/blocs/puzzles_creator_bloc/puzzles_creators_bloc.dart';

class LengthOfCharactersWidget extends StatefulWidget {
  const LengthOfCharactersWidget({super.key, this.onChanged});
  final VoidCallback? onChanged;

  @override
  State<LengthOfCharactersWidget> createState() =>
      _LengthOfCharactersWidgetState();
}

class _LengthOfCharactersWidgetState extends State<LengthOfCharactersWidget> {
  double _sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    final puzzlesBloc = context.watch<PuzzlesCreatorsBloc>().state;
    return Slider(
      value: puzzlesBloc.puzzle._sliderValue,
      onChanged: (newValue) {
        // Call the provided onChanged callback
        if (widget.onChanged != null) {
          widget.onChanged!;
        }

        setState(() {
          _sliderValue = newValue;
        });
      },
      min: 4,
      max: 20,
      divisions: 10,
      label: _sliderValue.round().toString(),
    );
  }
}
