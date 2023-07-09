import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:um_core/src/base/theme/theme_values_constants.dart';


class AppTextField extends StatelessWidget {
  AppTextField({
    this.borderColor,
    Key? key,
    this.hint,
    this.onTap,
    this.label,
    this.value,
    this.obscure = false,
    this.suffix,
    this.onSaved,
    this.onChanged,
    this.readonly,
    this.validator,
    this.keyboardType,
    this.floatLabel = false,
    this.textEditingController,
    this.isBold = false,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.fillColor,
    this.style,
    this.bottomPadding,
    this.focusedBorderColor,
    this.prefix,
    this.hintStyle,
    this.hintColor,
    this.showBorder = true,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 17,
    ),
    this.borderRadius,
    this.focusNode,
    this.inputFormatters,
    this.cursorColor,
    this.maxLength,
    this.border,
    this.textCapitalization = TextCapitalization.none,
    this.initialVal,
  }) : super(key: key);

  final Color? cursorColor;
  final FocusNode? focusNode;
  final EdgeInsets contentPadding;
  final bool? isBold;
  final double? bottomPadding;
  final TextStyle? style;
  final bool? obscure;
  final String? hint;
  final String? label;
  final String? value;
  final bool ? readonly;
  final Widget? suffix;
  final bool? floatLabel;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldSetter<String>? onSaved;
  final FormFieldSetter<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final int? maxLines;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final Color? focusedBorderColor;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final Color? hintColor;
  final bool showBorder;
  final double? borderRadius;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final InputBorder? border;
  final String? initialVal;

  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 15),
      child: TextFormField(
        textCapitalization: textCapitalization,
        readOnly: readonly ?? false,
        maxLines: maxLines,
        onTap: onTap,
        initialValue: initialVal,
        maxLength: maxLength,
        onSaved: onSaved,
        focusNode: focusNode,
        onChanged: onChanged,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscure ?? false,
        controller: textEditingController,
        cursorColor: cursorColor ?? Colors.black54,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.primaryColor,
                width: 2.0
            )
          ),
          border : OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: borderColor ?? Colors.black54,
                  width: 1.0
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: borderColor ?? Colors.black54,
                  width: 1.0
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                  color: borderColor ?? Colors.black54,
              )
          ),
          contentPadding: contentPadding,
          prefixIcon: prefix,
          suffixIcon: suffix,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black54),
          hintText: hint ?? '',

        ),
      ),
    );
  }
}


// class AppTextField extends StatelessWidget {
//   AppTextField({
//     Key? key,
//     this.hint,
//     this.onTap,
//     this.label,
//     this.value,
//     this.dense = false,
//     this.obscure = false,
//     this.suffix,
//     this.onSaved,
//     this.maxLines = 1,
//     this.onChanged,
//     this.readonly = false,
//     this.validator,
//     this.prefixIcon,
//     this.keyboardType,
//     this.floatLabel = false,
//     this.textEditingController,
//     this.textCapitalization = TextCapitalization.none,
//     this.textInputAction,
//     this.prefixText,
//     this.maxLength,
//     this.suffixText,
//     this.bottomPadding,
//     this.minLines = 1,
//     this.focusNode,
//   }) : super(key: key);
//
//   final FocusNode? focusNode;
//   final bool dense;
//   final bool obscure;
//   final String? hint;
//   final String? label;
//   final int? maxLines;
//   final String? value;
//   final bool readonly;
//   final Widget? suffix;
//   final bool floatLabel;
//   final Widget? prefixIcon;
//   final VoidCallback? onTap;
//   final TextInputType? keyboardType;
//   final FormFieldSetter<String?>? onSaved;
//   final FormFieldSetter<String?>? onChanged;
//   final FormFieldValidator<String?>? validator;
//   final TextEditingController? textEditingController;
//   final TextCapitalization textCapitalization;
//   final TextInputAction? textInputAction;
//   final String? prefixText;
//   final int? maxLength;
//   final String? suffixText;
//   final double? bottomPadding;
//   final int minLines;
//
//   final _prefixSuffixTextStyle = TextStyle(
//     color: Colors.black.withOpacity(0.75),
//     fontSize: 19,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: bottomPadding ?? 12),
//       child: TextFormField(
//         focusNode: focusNode,
//         textCapitalization: textCapitalization,
//         onTap: onTap,
//         onSaved: onSaved,
//         readOnly: readonly,
//         maxLines: maxLines,
//         initialValue: value,
//         onChanged: onChanged,
//         validator: validator,
//         obscureText: obscure,
//         keyboardType: keyboardType,
//         controller: textEditingController,
//         textInputAction: textInputAction,
//         minLines: minLines,
//         maxLength: maxLength,
//         // autovalidateMode: AutovalidateMode.onUserInteraction,
//         decoration: InputDecoration(
//           counterText: '',
//           isDense: dense,
//           hintText: hint,
//           errorMaxLines: 3,
//           floatingLabelBehavior: floatLabel
//               ? FloatingLabelBehavior.always
//               : FloatingLabelBehavior.auto,
//           labelText: label,
//           labelStyle: const TextStyle(color: Colors.grey),
//           suffixIcon: suffix,
//           prefixIcon: prefixIcon,
//           prefixText: prefixText,
//           suffixText: suffixText,
//           prefixStyle: _prefixSuffixTextStyle,
//           suffixStyle: _prefixSuffixTextStyle,
//           contentPadding:
//           dense ? null : const EdgeInsets.all(14),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.grey,
//               width: 2.3,
//             ),
//             borderRadius: BorderRadius.all(
//               Radius.circular(15),
//             ),
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.grey,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.all(
//               Radius.circular(15),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
