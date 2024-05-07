import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/models/post/create_post_model.dart';
import 'package:vangram/core/widgets/custom_text_field.dart';
import 'package:vangram/features/home/presentation/posts/controller/posts_cubit.dart';
import 'package:vangram/features/home/presentation/posts/widgets/pages/create_new_post/controller/create_new_post_bloc.dart';
import 'package:vangram/gen/assets.gen.dart';

class CreateNewPostPage extends StatefulWidget {
  const CreateNewPostPage({super.key});

  @override
  State<CreateNewPostPage> createState() => _CreateNewPostPageState();
}

class _CreateNewPostPageState extends State<CreateNewPostPage> {
  late final ValueNotifier<File?> _photo;
  late final TextEditingController _body;

  @override
  void initState() {
    super.initState();
    _photo = ValueNotifier<File?>(null);
    _body = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _photo.dispose();
    _body.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final createNewPostBloc = context.read<CreateNewPostBloc>();
    final postsCubit = context.read<PostsCubit>();
    return BlocListener<CreateNewPostBloc, CreateNewPostState>(
      listener: (context, state) async {
        if (state.status == CreateStatus.created) {
          await postsCubit.getPosts();
          if (context.mounted) {
            context.pop();
          }
        }
      },
      child: ValueListenableBuilder(
        valueListenable: _photo,
        builder: (_, value, __) {
          return Scaffold(
            bottomNavigationBar: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: ElevatedButton(
                  onPressed: () => createNewPostBloc
                      .add(CreatePostEvent(post: CreatePostModel(body: _body.text, photo: value?.path))),
                  child: Text(
                    'Опубликовать',
                    style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.kWhiteColor),
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              centerTitle: true,
              leading: GestureDetector(
                onTap: () => context.pop(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              title: Text(
                'Новый пост',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: AppColors.kPrimaryColor,
                  fontSize: 24,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: SvgPicture.asset(
                    Assets.icons.bell,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      AppColors.kPrimaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: _body,
                            autoFocus: true,
                            maxLines: 14,
                            minLines: 1,
                            hintText: 'Расскажите о моменте...',
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        GestureDetector(
                          onTap: () => _imagePick(_photo),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.kGreyColor,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: SvgPicture.asset(
                                Assets.icons.image,
                                colorFilter: ColorFilter.mode(
                                  AppColors.kHintColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (value != null)
                      Container(
                        height: 300,
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                              value,
                            ),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () => _photo.value = null,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.clear_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future _imagePick(ValueNotifier photo) async {
  final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (file == null) {
    return;
  }
  photo.value = File(file.path);
}
