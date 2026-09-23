// 导入 Flutter 的 Material 组件库，提供 Scaffold、AppBar、Text、FloatingActionButton 等现成组件
import 'package:flutter/material.dart';

// main 函数是整个 Flutter 应用的入口，应用启动时首先执行这里
void main() {
  // runApp 把根组件 MyApp 挂载到屏幕上，界面从这一行开始构建与渲染
  runApp(const MyApp());
}

// MyApp 是应用的根组件；继承 StatelessWidget 表示它没有可变状态，界面只依赖配置
class MyApp extends StatelessWidget {
  // 构造函数：const 表示可在编译期创建常量实例；super.key 把组件唯一标识传给父类
  const MyApp({super.key});

  // build 方法返回该组件要显示的界面，框架在组件需要渲染或重建时调用
  @override
  Widget build(BuildContext context) {
    // MaterialApp 提供 Material 风格的全局配置：应用标题、主题、首页组件
    return MaterialApp(
      title: 'Flutter Demo', // 应用标题，在任务管理器或网页标签上显示
      theme: ThemeData(
        // 以深紫色为“种子色”，自动派生整套 Material 配色方案
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home 指定应用启动后显示的首页，并把标题字符串传给它
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePage 是首页；继承 StatefulWidget 表示它持有随交互变化的状态（计数器）
class MyHomePage extends StatefulWidget {
  // 构造函数：key 用于组件复用识别，required 表示 title 必须由外部传入
  const MyHomePage({super.key, required this.title});

  // 首页标题；StatefulWidget 里的字段用 final 修饰，赋值后不可再改
  final String title;

  // createState 创建并返回与该组件绑定的状态对象
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// _MyHomePageState 持有首页的状态数据与界面构建逻辑；下划线开头表示库级私有
class _MyHomePageState extends State<MyHomePage> {
  // 计数器状态变量，记录按钮被点击的次数，初始值为 0
  int _counter = 0;

  // 点击右下角悬浮按钮时执行的方法
  void _incrementCounter() {
    // setState 通知框架“状态已改变”，框架随后重新执行 build 方法刷新界面
    setState(() {
      _counter++; // 计数加 1
    });
  }

  // 每次调用 setState 后框架都会重新执行 build，返回反映最新状态的界面
  @override
  Widget build(BuildContext context) {
    // Scaffold 实现 Material Design 的页面骨架：应用栏、内容区、悬浮按钮
    return Scaffold(
      appBar: AppBar(
        // 顶部应用栏，背景色取当前主题配色方案的反色
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // 应用栏标题，显示从 MyHomePage 传入的 title
        title: Text(widget.title),
      ),
      // body 是页面主体；Center 把唯一的子组件放到正中间
      body: Center(
        // Column 沿垂直方向依次排列多个子组件
        child: Column(
          // mainAxisAlignment 控制子组件在主轴（Column 的主轴为竖直方向）上的对齐方式：居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 固定不变的提示文字；const 表示该文本组件无需重建
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter', // 字符串插值：把 _counter 的当前值拼进字符串
              // 使用主题中预定义的大号标题文字样式
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // 右下角的悬浮动作按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 点击回调：执行计数加 1 的方法
        tooltip: 'Increment', // 长按按钮时显示的无障碍提示文案
        child: const Icon(Icons.add), // 按钮内部显示一个加号图标
      ),
    );
  }
}
