import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  BehaviorSubject _appChannel = BehaviorSubject();

  Sink get configSink => _appChannel.sink;

  Stream get configStream => _appChannel.stream;

  @override
  void dispose() {
    _appChannel.close();
  }

  @override
  Future getData() {
    return null;
  }

  @override
  Future onRefresh() {
    print('ApplicationBloc~~~~~~~onRefresh~~~~~~ApplicationBloc');
    return null;
  }

  @override
  Future onLoadMore() {
    return null;
  }
}
