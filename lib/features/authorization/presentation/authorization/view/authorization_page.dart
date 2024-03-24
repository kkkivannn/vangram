import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/formatter/romatter.dart';
import 'package:vangram/core/models/send_phone_model.dart';
import 'package:vangram/core/widgets/custom_text_field.dart';
import 'package:vangram/features/authorization/presentation/authorization/controller/authorization_bloc.dart';
import 'package:vangram/gen/assets.gen.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  late final TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final bloc = context.read<AuthorizationBloc>();
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        if (state.status == AuthStatus.loaded) {
          context.pushNamed(Routes.enterCode, extra: _numberController.text);
        }
      },
      child: Form(
        key: enterNumberFormKey,
        child: Scaffold(
          backgroundColor: AppColors.kThirdColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              'Moments',
              style: theme.textTheme.titleLarge!.copyWith(color: AppColors.kWhiteColor),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(36),
              ),
            ),
            child: LayoutBuilder(builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 30),
                    child: SafeArea(
                      top: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Введите номер телефона',
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
                            'На данный номер придет код.',
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
                            height: 20,
                          ),
                          CustomTextField.number(
                            controller: _numberController,
                            inputFormatter: [numberMask],
                            hintText: 'Введите ваш номер',
                            prefixIcon: SvgPicture.asset(
                              Assets.icons.call,
                              colorFilter: ColorFilter.mode(AppColors.kHintColor, BlendMode.srcIn),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (enterNumberFormKey.currentState!.validate()) {
                                bloc.add(
                                  SendPhoneEvent(
                                    sendPhoneModel: SendPhoneModel(phone: _numberController.text),
                                  ),
                                );
                              }
                            },
                            style: theme.elevatedButtonTheme.style!.copyWith(
                              backgroundColor: MaterialStatePropertyAll(AppColors.kThirdColor),
                            ),
                            child: Text(
                              'Отправить код',
                              style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.kWhiteColor),
                            ),
                          )
                              .animate()
                              .slideY(
                                begin: 1,
                                end: 0,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              )
                              .fade(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
