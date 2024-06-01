import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/widgets/post_card.dart';
import 'package:vangram/features/profile/presentation/profile/controller/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final profileBloc = context.read<ProfileBloc>();
    return Column(
      children: [
        AppBar(
          centerTitle: false,
          title: FittedBox(
            child: Text(
              'Профиль',
              style: theme.textTheme.titleLarge!.copyWith(
                color: AppColors.kThirdColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.status != ProfileStatus.loaded) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return RefreshIndicator.adaptive(
                onRefresh: () async => profileBloc.add(GetProfileEvent()),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  children: [
                    SizedBox(
                      height: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            maxRadius: 60,
                            backgroundImage: state.profile!.photo == null
                                ? null
                                : NetworkImage(
                                    state.profile!.photo!,
                                  ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    state.profile?.name ?? '-',
                                    style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    state.profile?.surname ?? '-',
                                    style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                state.profile?.phone ?? '-',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.kBlackGreyColor,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: ElevatedButton(
                                  style: theme.elevatedButtonTheme.style!.copyWith(
                                    backgroundColor: WidgetStatePropertyAll<Color>(AppColors.kThirdColor),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Редактировать'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.kThirdColor,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Ваши моменты',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: state.posts!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => PostCardWidget(
                        post: state.posts![index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
