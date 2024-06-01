import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/helpers/models/send_code/send_code_model.dart';
import 'package:vangram/core/utils/extension/extension_on_context.dart';
import 'package:vangram/core/utils/formatter/formatter.dart';
import 'package:vangram/features/authorization/presentation/enter_code/controller/enter_code_bloc.dart';

class EnterCodePage extends StatefulWidget {
  const EnterCodePage({Key? key, required this.phone}) : super(key: key);

  final String phone;

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  late final TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _codeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final bloc = context.read<EnterCodeBloc>();
    return BlocListener<EnterCodeBloc, EnterCodeState>(
      listener: (context, state) {
        if (state.status == EnterCodeStatus.notHaveAccount) {
          context.goNamed(Routes.registration);
        } else {
          context.goNamed(Routes.posts);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kSecondaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Moments'),
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
            color: AppColors.kWhiteColor,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 30),
                    child: SafeArea(
                      top: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Введите код',
                            style: theme.textTheme.titleLarge!.copyWith(color: AppColors.kBlackColor),
                          )
                              .animate()
                              .fade(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              )
                              .slideY(
                                begin: 1,
                                end: 0,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'На ваш номер пришел код, никому его не сообщайте!',
                            style: theme.textTheme.bodyMedium,
                          )
                              .animate()
                              .fade(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              )
                              .slideY(
                                begin: 1,
                                end: 0,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Pinput(
                                length: 4,
                                inputFormatters: [codeMask],
                                keyboardType: TextInputType.number,
                                controller: _codeController,
                                defaultPinTheme: PinTheme(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  textStyle: theme.textTheme.titleLarge!.copyWith(color: AppColors.kBlackColor),
                                ),
                              ),
                            ],
                          )
                              .animate()
                              .fade(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              )
                              .slideY(
                                begin: 1,
                                end: 0,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              ),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              bloc.add(
                                SendCodeEvent(
                                  sendCodeModel: SendCodeModel(phone: widget.phone, code: _codeController.text),
                                ),
                              );
                            },
                            style: theme.elevatedButtonTheme.style!.copyWith(
                              backgroundColor: WidgetStatePropertyAll(AppColors.kSecondaryColor),
                            ),
                            child: Text(
                              'Отправить',
                              style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.kWhiteColor),
                            ),
                          )
                              .animate()
                              .fade(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              )
                              .slideY(
                                begin: 1,
                                end: 0,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
