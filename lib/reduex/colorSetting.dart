import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

typedef State Reducer<State>(State state, dynamic action);

// 创建一个 State 对象 LiupengState 类，用于储存需要共享的数据。
class LiupengState {
  // 成员变量
  ThemeData themeData;
  // 成员变量
  String informationI;
  // 成员变量
  String informationII;
  // 构造函数
  LiupengState({this.themeData, this.informationI, this.informationII});
}

//定义 Reducer 方法 appReducer
// 我们自定义了 appReducer 用于创建 store
LiupengState appReducer(LiupengState liupengState, action) {
  // 将 LiupengState 内的每一个参数，和对应的 action 绑定起来，返回完整的 LiupengState
  return LiupengState(
    informationI: InformationIReducer(liupengState.informationI, action),
    informationII: InformationIIReducer(liupengState.informationII, action),
    themeData: ThemeDataDeducer(liupengState.themeData, action),
  );
}

/// 通过 flutter_redux 的 combineReducers, 创建 Reducer<State>
final InformationIReducer = combineReducers<String>([
  /// 通过 flutter_redux 的 TypedReducer: ProcessInformationIAction & _processString 绑定在一起
  TypedReducer<String, ProcessInformationIAction>(_processInformationI),
]);

final ThemeDataDeducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, UpdateThemeData>(_updateThemeData),
]);

ThemeData _updateThemeData(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}

class UpdateThemeData {
  final ThemeData themeData;
  UpdateThemeData(this.themeData);
}

/// 定义Action的处理方法, 返回一个String
String _processInformationI(String string, action) {
  string = "update";
  return string;
}

/// 定义一个Action类,和处理该Action的方法绑定
class ProcessInformationIAction {
  final String string;
  ProcessInformationIAction(this.string);
}

/// 通过 flutter_redux 的 combineReducers, 创建 Reducer<State>
final InformationIIReducer = combineReducers<String>([
  TypedReducer<String, ProcessInformationIIAction>(_processInformationII),
]);

String _processInformationII(String string, action) {
  string = action.string;
  return string;
}

class ProcessInformationIIAction {
  final String string;
  ProcessInformationIIAction(this.string);
}

void main() {
  runApp(new ReduxApp());
}

class ReduxApp extends StatelessWidget {
  /// create Store, using LiupengReducer's appReducer create Reducer
  /// initilState 初始化 State
  final store = new Store<LiupengState>(
    appReducer,
    initialState: new LiupengState(
      themeData: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      informationI: '11111',
      informationII: '22222',
    ),
  );

  ReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new UseW(
      store: store,
    );
  }
}

class UseW extends StatelessWidget {
  final Store<LiupengState> store;

  UseW({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreBuilder<LiupengState>(
        builder: (context, store) {
          return MaterialApp(
            title: 'Paly',
            theme: store.state.themeData,
            home: new Page123(),
          );
        },
      ),
    );
  }
}

class Page123 extends StatelessWidget {
  // final Store<LiupengState> store;

  // Page123({this.store});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Page one'),
        leading: new InkWell(
          onTap: () {
            //Navigator.pop(context);
          },
          child: new Icon(Icons.home),
        ),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            ThemeData themeData = new ThemeData(primarySwatch: Colors.orange);
            StoreProvider.of<LiupengState>(context)
                .dispatch(new UpdateThemeData(themeData));
          },
          child: new Text(
            '变',
            style: new TextStyle(color: Colors.lightGreenAccent),
          ),
        ),
      ),
    );
  }
}
