import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/features/home/presentation/profile/controller/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return SingleChildScrollView(
      child: Column(
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
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.status == ProfileStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return Column(
                children: [
                  CircleAvatar(
                    maxRadius: 80,
                    backgroundImage: NetworkImage(
                      state.profile!.photo!,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(state.profile?.name ?? '-'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(state.profile?.surname ?? '-'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(state.profile?.phone ?? '-'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(state.profile?.age.toString() ?? '-'),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
