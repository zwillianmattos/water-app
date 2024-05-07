import 'package:flutter/material.dart';

class WeightRuler extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double step;
  final double initialValue;
  final ValueChanged<double>? onChanged;

  const WeightRuler({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.step,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _WeightRulerState createState() => _WeightRulerState();
}

class _WeightRulerState extends State<WeightRuler> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${_value.toStringAsFixed(1)} kg',
            style: TextStyle(fontSize: 18.0)),
        Slider(
          value: _value,
          min: widget.minValue,
          max: widget.maxValue,
          divisions: (widget.maxValue - widget.minValue) ~/ widget.step,
          label: '${_value.toStringAsFixed(1)} kg',
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
              widget.onChanged?.call(newValue);
            });
          },
        ),
      ],
    );
  }
}
