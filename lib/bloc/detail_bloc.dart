import '../resources/repository.dart';
import '../model/item_model.dart';

import 'package:rxdart/rxdart.dart';



class DetailBloc {
  final _repository = Repository();
  final _detailFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get detailMeals => _detailFetcher.stream;

  fetchDetailMeals(String mealsId) async {
    ItemModel mealsDetail = await _repository.fetchDetailMeals(mealsId);
    _detailFetcher.sink.add(mealsDetail);
  }

  dispose() {
    _detailFetcher.close();
  }
}