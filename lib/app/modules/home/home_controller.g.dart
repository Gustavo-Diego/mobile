// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$statusAtom = Atom(name: '_HomeControllerBase.status');

//   @override
//   dynamic get status {
//     _$statusAtom.reportRead();
//     return super.status;
//   }

//   @override
//   set status(dynamic value) {
//     _$statusAtom.reportWrite(value, super.status, () {
//       super.status = value;
//     });
//   }

//   final _$fetchPostsAsyncAction = AsyncAction('_HomeControllerBase.fetchPosts');

//   @override
//   Future<void> fetchPosts() {
//     return _$fetchPostsAsyncAction.run(() => super.fetchPosts());
//   }

//   @override
//   String toString() {
//     return '''
// status: ${status}
//     ''';
//   }

@override
  HomeStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(HomeStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$fetchPostsAsyncAction = AsyncAction('fetchPosts');

  @override
  Future<void> fetchPosts() {
    return _$fetchPostsAsyncAction.run(() => super.fetchPosts());
  }

  @override
  String toString() {
    final string = 'status: ${status.toString()}';
    return '{$string}';
  }
  
}
