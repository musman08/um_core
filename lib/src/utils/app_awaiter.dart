import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reusables/reusables.dart';
import 'package:um_core/src/widgets/loading_widget.dart';

class AppDefaultAwaiterBehaviour extends AwaiterBehaviour {
  @override
  FutureOr<void> after(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  FutureOr<void> before(BuildContext context, arguments) {
    LoadingDialog(arguments).show(context);
  }
}
