import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

MaskTextInputFormatter numberMask = MaskTextInputFormatter(
  mask: '+7 (###) ### ## ##',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);
MaskTextInputFormatter codeMask = MaskTextInputFormatter(
  mask: '####',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);
final DateFormat timeFormat = DateFormat('HH:mm');
// final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
final DateFormat dateFormat = DateFormat('dd.MM.yyyy');
