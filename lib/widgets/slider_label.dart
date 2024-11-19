part of 'widgets.dart';

class SliderLabel extends StatefulWidget {
  const SliderLabel({
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.fixed = 1,
    super.key,
  });

  final double value;
  final double min;
  final double max;
  final int? divisions;
  final void Function(double)? onChanged;
  final int fixed;

  @override
  State<SliderLabel> createState() => _SliderLabelState();
}

class _SliderLabelState extends State<SliderLabel> {
  String fixed(num value) {
    return value.toStringAsFixed(widget.fixed);
  }

  late var _value = fixed(widget.value);

  void onChanged(double value) {
    setState(() {
      _value = fixed(value);
    });

    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 32,
          child: Center(child: Text(_value)),
        ),
        Expanded(
          child: Slider.adaptive(
            value: widget.value,
            divisions: widget.divisions,
            onChanged: onChanged,
            max: widget.max,
            min: widget.min,
          ),
        )
      ],
    );
  }
}
