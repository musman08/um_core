import 'package:flutter/material.dart';
import 'package:um_core/src/widgets/text_widget.dart';
import 'package:um_core/src/base/theme/theme_values_constants.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: TextWidget(title: title,),
        content: const SizedBox(
          height: 50,
          width: 100,
          child: Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          )),
        ));
  }

  void show(BuildContext context) {
    showDialog(context: context, builder: (_) => this);
  }

  void hide(BuildContext context) {
    Navigator.pop(context);
  }
}

class PopUpDialog extends StatelessWidget {
  const PopUpDialog(this.description, {Key? key, this.title, this.isError}) : super(key: key);

  final String description;
  final String ? title;
  final bool ? isError;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : const SizedBox(),
      content: SizedBox(
        child: Text(description),
      ),
      actions: [
        TextButton(
          child: const Text(
            'Ok',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void show(BuildContext context) {
    showDialog(context: context, builder: (_) => this);
  }
}