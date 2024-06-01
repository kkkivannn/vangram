import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/assets/gen/assets.gen.dart';
import 'package:vangram/core/formatter/formatter.dart';
import 'package:vangram/core/helpers/models/sign_up.dart';
import 'package:vangram/core/widgets/custom_text_field.dart';
import 'package:vangram/features/authorization/presentation/registration/controller/registration_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _dateController;

  DateTime? _birth;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _surnameController.dispose();
    _dateController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final bloc = context.read<RegistrationBloc>();
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state.status == RegStatus.loaded) {
          context.goNamed(Routes.posts);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Регистрация',
            style: theme.textTheme.titleLarge!.copyWith(color: AppColors.kWhiteColor),
          ),
        ),
        body: Form(
          key: registrationFormKey,
          child: Container(
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
                          RichText(
                            text: TextSpan(
                                text: 'Добро пожаловать!\n',
                                style: theme.textTheme.titleLarge!.copyWith(color: AppColors.kBlackColor),
                                children: [
                                  TextSpan(
                                    text: 'Создайте Аккаунт чтобы делиться своими моментами из жизни и смотреть чужие!',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ]),
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
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kGreyColor,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                Assets.icons.image,
                                height: 50,
                                colorFilter: ColorFilter.mode(
                                  AppColors.kHintColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: _nameController,
                            hintText: 'Введите ваше имя',
                            prefixIcon: SvgPicture.asset(
                              Assets.icons.user,
                              colorFilter: ColorFilter.mode(AppColors.kHintColor, BlendMode.srcIn),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: _surnameController,
                            hintText: 'Введите вашу фамилию',
                            prefixIcon: SvgPicture.asset(
                              Assets.icons.user,
                              colorFilter: ColorFilter.mode(AppColors.kHintColor, BlendMode.srcIn),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField.age(
                            controller: _dateController,
                            readOnly: true,
                            onTap: () async {
                              if (Platform.isIOS) {
                                await showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 216,
                                    padding: const EdgeInsets.only(top: 6.0),
                                    margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).viewInsets.bottom,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: CupertinoColors.systemBackground.resolveFrom(context),
                                    ),
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (value) {
                                        _birth = value;
                                        _dateController.text = dateFormat.format(value);
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                            hintText: 'Выберите дату рождения',
                            prefixIcon: SvgPicture.asset(
                              Assets.icons.calendar,
                              colorFilter: ColorFilter.mode(AppColors.kHintColor, BlendMode.srcIn),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.icons.right,
                              colorFilter: ColorFilter.mode(AppColors.kHintColor, BlendMode.srcIn),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (registrationFormKey.currentState!.validate()) {
                                bloc.add(
                                  RegistrationUserEvent(
                                    signUpModel: SignUpModel(
                                      name: _nameController.text,
                                      surname: _surnameController.text,
                                      age: DateTime.now().year - _birth!.year,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Далее',
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
