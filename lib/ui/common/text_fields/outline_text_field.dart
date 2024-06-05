import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/app_colors.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class OutlineTextField extends StatelessWidget {
  /// Виджет формы ввода текста
  const OutlineTextField({
    super.key,
    this.textInputType,
    this.onChanged,
    this.textInputFormatter,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.descriptionText,
    this.isReadOnly,
    this.fillColor,
    this.borderColor,
    this.isFocus = false,
    this.labelText,
    this.controller,
    this.maxLines,
    this.minLines,
    this.height,
    this.contentPadding,
    this.onTap,
    this.enabledBorder,
    this.focusedBorder,
    this.prefixText,
    this.initialValue,
    this.errorText,
    this.helperText,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.style,
    this.cursorColor,
    this.decoration,
    this.obscureText = false,
    this.expands = false,
    this.hintStyle,
    this.tooltip,
    this.textInputAction,
  });

  final TextInputType? textInputType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? style;
  final TextAlign textAlign;
  final String? hintText;
  final String? descriptionText;
  final String? labelText;
  final String? prefixText;
  final String? initialValue;
  final String? errorText;
  final String? helperText;
  final bool? isReadOnly;
  final Color? fillColor;
  final Color? borderColor;
  final bool isFocus;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final EdgeInsets? contentPadding;
  final VoidCallback? onTap;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextAlignVertical? textAlignVertical;
  final Color? cursorColor;
  final InputDecoration? decoration;
  final bool obscureText;
  final bool expands;
  final TextStyle? hintStyle;
  final Widget? tooltip;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (descriptionText != null)
          Padding(
            padding: EdgeInsets.only(bottom: 5.hA),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    descriptionText!,
                    style: TextStyle(
                      fontSize: 13.a,
                      fontWeight: FontWeight.w400,
                      color: errorText != null ? AppColorsLight.red : null,
                    ),
                  ),
                ),
                SizedBox(width: 5.a),
                if (tooltip != null) tooltip!,
              ],
            ),
          ),
        TextFormField(
          textInputAction: textInputAction,
          expands: expands,
          obscureText: obscureText,
          initialValue: initialValue,
          textAlignVertical: textAlignVertical,
          textAlign: textAlign,
          onTap: onTap,
          maxLines: maxLines,
          minLines: minLines,
          controller: controller,
          autofocus: isFocus,
          onChanged: onChanged,
          cursorColor: cursorColor ?? context.theme.hintColor,
          readOnly: isReadOnly ?? false,
          style: style ?? context.mBlack14(),
          inputFormatters: textInputFormatter,
          keyboardType: textInputType ?? TextInputType.text,
          decoration: decoration ??
              InputDecoration(
                helperText: helperText,
                labelText: labelText,
                hintText: hintText,
                prefixText: prefixText,
                helperStyle: context.textTheme.headlineLarge,
                contentPadding: contentPadding ??
                    EdgeInsets.symmetric(
                      horizontal: 16.a,
                      vertical: 15.a,
                    ),
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: fillColor ?? context.theme.scaffoldBackgroundColor,
                labelStyle: context.theme.textTheme.headlineLarge,
                hintStyle: hintStyle ?? context.mGray14(),
                prefixIcon: prefixIcon,
                prefixStyle: context.theme.textTheme.headlineLarge,
                enabledBorder: enabledBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
                      borderSide: BorderSide(
                        color: errorText != null ? AppColorsLight.red : context.theme.dividerColor,
                      ),
                    ),
                focusedBorder: focusedBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
                      borderSide: BorderSide(
                        color: errorText != null ? AppColorsLight.red : context.theme.dividerColor,
                      ),
                    ),
              ),
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: 5.hA),
            child: Text(
              errorText!,
              style: context.mBlack12(color: AppColorsLight.red),
            ),
          ),
      ],
    );
  }
}
