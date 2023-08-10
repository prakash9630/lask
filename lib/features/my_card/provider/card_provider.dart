
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/card_model.dart';
import '../repo/my_card_repo.dart';
part 'card_provider.g.dart';

@riverpod
Future<CardList?> myCardList(MyCardListRef ref) async {
  return ref.read(myCardRepoProvider).getCardData();
}