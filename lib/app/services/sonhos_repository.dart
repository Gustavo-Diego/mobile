import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/modules/home/models/sonho.dart';

class SonhosRepository extends Disposable {
  final Dio _sonhos;
  SonhosRepository(this._sonhos);

  Future fetchPosts() async {

    // exemplo e explicação: 
    // https://jsonplaceholder.typicode.com/posts para api externa, 
    // http://192.168.100.117 para api interna local pq se usar localhost o flutter se confunde 
    // então se usa o ip da maquina

    final response = await _sonhos.get('http://192.168.100.117:3030/sonhos');
    return (response.data as List).map((e) => Sonho.fromJson(e)).toList();
  }

  @override
  void dispose(){}
}