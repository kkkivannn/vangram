import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/utils/usecase/usecase.dart';
import 'package:vangram/features/chats/domain/entities/chats/chat_entity.dart';
import 'package:vangram/features/chats/domain/repositories/chats_repository.dart';

final class GetUserChats implements UseCase<List<ChatEntity>, NoParams> {
  final ChatsRepository _chatsRepository;

  GetUserChats({required ChatsRepository chatsRepository}) : _chatsRepository = chatsRepository;

  @override
  Future<Either<Failure, List<ChatEntity>>> call({required NoParams params}) async {
    return await _chatsRepository.getUserChats();
  }
}
