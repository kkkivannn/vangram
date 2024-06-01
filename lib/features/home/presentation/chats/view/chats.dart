import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/assets/gen/assets.gen.dart';
import 'package:vangram/features/home/presentation/chats/controller/chats_bloc.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final chatsBloc = context.read<ChatsBloc>();
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: false,
              pinned: true,
              title: Text(
                'Чаты',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: AppColors.kSecondaryColor,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => context.pushNamed(Routes.createChat, extra: chatsBloc),
                    child: Icon(
                      Icons.add_circle_outline_rounded,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            CupertinoSliverRefreshControl(
              onRefresh: () async => chatsBloc.add(GetChatsEvent()),
            ),
            SliverSafeArea(
              top: false,
              sliver: SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                sliver: SliverList.separated(
                  itemCount: state.chats.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => context.pushNamed(Routes.chat, extra: state.chats[index].id),
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: AppColors.kBlackColor,
                            backgroundImage: state.chats[index].photo == null
                                ? AssetImage(Assets.images.logo.path)
                                : NetworkImage(state.chats[index].photo!) as ImageProvider,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.chats[index].name,
                                style: theme.textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (state.chats[index].user != null)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundImage: state.chats[index].user!.photo == null
                                          ? AssetImage(Assets.images.logo.path)
                                          : NetworkImage(state.chats[index].user!.photo!) as ImageProvider,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${state.chats[index].user!.name}:",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      state.chats[index].message!.body,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                )
                              else
                                Text(
                                  'В данном чате нет сообщений',
                                  style: theme.textTheme.bodySmall,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    color: AppColors.kBlackGreyColor,
                    height: 35,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
