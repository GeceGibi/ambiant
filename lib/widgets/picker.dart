part of 'widgets.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    required this.onColorPicked,
    super.key,
  });

  final void Function(Color color) onColorPicked;
  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  var hue = 180.0;
  var lightness = 0.5;
  var saturation = 1.0;

  Color get color {
    return HSLColor.fromAHSL(1, hue, saturation, lightness).toColor();
    // return HSVColor.fromAHSV(alpha, hue, saturation, 1).toColor();
  }

  void onChangedLightness(double value) {
    setState(() {
      lightness = value;
    });
  }

  void onChangedSaturation(double value) {
    setState(() {
      saturation = value;
    });
  }

  void onChangedHue(double value) {
    setState(() {
      hue = value;
    });
  }

  void onColorPicked() {
    widget.onColorPicked(color);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: UiConstants.of(context).border,
        borderRadius: UiConstants.borderRadius,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SliderLabel(
              value: saturation,
              divisions: 100,
              onChanged: onChangedSaturation,
              fixed: 2,
            ),
            SliderLabel(
              value: lightness,
              divisions: 100,
              onChanged: onChangedLightness,
              fixed: 2,
            ),
            SliderLabel(
              value: hue,
              onChanged: onChangedHue,
              divisions: 360,
              max: 360,
              fixed: 0,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: UiConstants.of(context).border,
                        borderRadius: UiConstants.borderRadius,
                        color: Colors.black,
                      ),
                      child: ClipRRect(
                        borderRadius: UiConstants.borderRadius,
                        child: ColoredBox(color: color),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: onColorPicked,
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
