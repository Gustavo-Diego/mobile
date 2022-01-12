import 'package:mobile/app/modules/home/home_status.dart';
import 'package:mobile/app/services/sonhos_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final SonhosRepository sonhosRepository;

  _HomeControllerBase(this.sonhosRepository){
    fetchPosts();
  }

  @observable
  HomeStatus status = HomeStatus.none;

  @action
  Future<void> fetchPosts() async {
    status = HomeStatus.loading;

    try{
      final response = await sonhosRepository.fetchPosts(); 
      status = HomeStatus.success..value = response;
    } catch (error) {
      status = HomeStatus.error..value = error;
    }

  }

  // @observable
  // int value = 0;

  // @action
  // void increment() {
  //   value++;
  // }
}
