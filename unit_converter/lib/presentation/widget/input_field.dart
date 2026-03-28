import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(
      text: context.read<ConverterProvider>().inputText,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: AppStrings.inputLabel,
        hintText: AppStrings.inputHint,
        prefixIcon: const Icon(Icons.edit_note),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  context.read<ConverterProvider>().updateInput('');
                  setState(() {});
                },
              )
            : null,
      ),
      onChanged: (value) {
        setState(() {
          context.read<ConverterProvider>().updateInput(value);
        });
      },
    );
  }
}
