import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/assets/gen/assets.gen.dart';
import 'package:vangram/core/widgets/custom_text_field.dart';
import 'package:vangram/features/chats/presentation/chat/controller/chat_bloc.dart';
import 'package:vangram/features/chats/presentation/chat/widgets/message_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ValueNotifier<String> _messageNotifier;

  @override
  void initState() {
    super.initState();
    _messageNotifier = ValueNotifier<String>('');
  }

  @override
  void dispose() {
    super.dispose();
    _messageNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 35,
        leading: GestureDetector(
          onTap: context.pop,
          child: SvgPicture.asset(
            Assets.icons.left,
            colorFilter: ColorFilter.mode(
              AppColors.kPrimaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          'Chat',
          style: theme.textTheme.bodyLarge,
        ),
        actions: [
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(Assets.images.logo.path),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return switch (state.status) {
                  ChatStatus.loading => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  _ => ListView(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.chatMessages.length,
                          itemBuilder: (context, index) {
                            return MessageCardWidget(
                              message: state.chatMessages[index].message,
                              user: state.chatMessages[index].user,
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 12),
                        ),
                      ],
                    ),
                };
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _messageNotifier,
            builder: (_, value, __) {
              return Container(
                padding: const EdgeInsets.only(top: 15, left: 16, right: 16, bottom: 10),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField.message(
                          hintText: 'Сообщение',
                          maxLines: 14,
                          minLines: 1,
                          onChanged: (value) => _messageNotifier.value = value,
                        ),
                      ),
                      AnimatedContainer(
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 200),
                        width: value.isNotEmpty ? 12 : 0,
                      ),
                      GestureDetector(
                        onTap: () async {},
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: value.isEmpty ? 0 : 1),
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 200),
                          builder: (context, tweenValue, child) => Transform.scale(
                            scale: tweenValue,
                            child: Container(
                              width: tweenValue * 40,
                              constraints: const BoxConstraints(
                                minWidth: 0,
                              ),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                Assets.icons.arrowUp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
