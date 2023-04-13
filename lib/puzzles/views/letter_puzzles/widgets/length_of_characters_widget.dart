import 'package:flutter/material.dart';

typedef IntCallback = void Function(int value);

class LengthOfCharactersWidget extends StatefulWidget {
  const LengthOfCharactersWidget({
    super.key,
    this.onTap,
    this.maxValue,
    this.minValue,
  });
  final IntCallback? onTap;
  final double? maxValue;
  final double? minValue;
  @override
  State<LengthOfCharactersWidget> createState() =>
      _LengthOfCharactersWidgetState();
}

class _LengthOfCharactersWidgetState extends State<LengthOfCharactersWidget> {
  double _sliderValue = 4;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          widget.onTap!(newValue.round());
          setState(() {
            _sliderValue = newValue;
          });
        },
        min: widget.minValue ?? 4,
        max: widget.maxValue ?? 20,
        divisions:
            (((widget.maxValue ?? 20) - (widget.minValue ?? 4)) * 10).toInt(),
        label: _sliderValue.round().toString(),
      ),
    );
  }
}
