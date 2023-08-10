

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';
import '../model/card_model.dart';

final myCardRepoProvider = Provider<MyCardRepo>((ref) =>MyCardRepo());

class MyCardRepo{
  final _api= getIt<ApiManager>();
  static const String cardListApi='finance/card/list';
  static const String cardCreateApi='finance/card/create/';
  static const String cardDeleteApi='finance/card/delete/';
  
  Future<CardList?> getCardData() async {
    final response= await apiBase(_api.dio!.get(cardListApi));
    return response.fold((l) => null, (r) {
      CardList cardList= CardList.fromJson(r['card_list']);
      return cardList;
    });
  }

  Future<bool> deleteCard(String cardId) async {
    final response= await apiBase(_api.dio!.post(cardDeleteApi,data: {"card_id":cardId}),showProgressDialogue: true);
    return response.fold((l) {
      return false;
    }, (r) {
      return true;
    });
  }

  Future<bool> cardCreate(String cardToken) async {
    final response= await apiBase(_api.dio!.post(cardCreateApi,data: {"card_token":cardToken}),showProgressDialogue: true);
    return response.fold((l) => false, (r) =>true);
  }
}