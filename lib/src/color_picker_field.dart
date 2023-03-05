import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:widget_stage/widget_stage.dart';

class ColorPickerField extends StatelessWidget {
  const ColorPickerField({
    Key? key,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

  final Color color;
  final ValueChanged<Color> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text('color'),
          const SizedBox(width: 32),
          GestureDetector(
            onTap: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Pick a color!'),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        pickerColor: color,
                        onColorChanged: onChanged,
                      ),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Accept'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorFieldConfigurator extends FieldConfigurator<Color> {
  ColorFieldConfigurator({
    required Color value,
  }) : super(
          value: value,
          builder: () => ColorPickerField(
            color: value,
            onChanged: (Color value) {
              value = value;
            },
          ),
        );
}
