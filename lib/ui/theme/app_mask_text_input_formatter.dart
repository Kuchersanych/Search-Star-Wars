import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Маски полей ввода
abstract class AppMaskTextInputFormatter{
  static final phoneMask = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.lazy,
  );

  static final codeMask = MaskTextInputFormatter(
    mask: '####',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.lazy,
  );
}