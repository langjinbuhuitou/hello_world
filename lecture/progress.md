# 移动应用开发实训 第一课 进度报告

> 仓库：https://github.com/langjinbuhuitou/hello_world（lecture1 分支）  
> 日期：2026-09-23  
> 学号：________________  
> 姓名：________________

---

## 一、任务理解

本次作业要搭好一套 AI 增强的 Flutter 开发环境并把它「跑起来、留痕起来」：flutter doctor 体检通过，复现 hello_world 计数器应用并在 Web 端与 Android 模拟器两端运行，建立 Git 仓库、按规范完成多次提交并推送到远程，同时按自主实践要求完成安装过程记录、问题定位、原理说明、main.dart 逐行中文注释与 AI 使用边界说明。

验收标准：doctor 全绿（或除不用平台外全绿）；Chrome 与模拟器均成功运行计数器示例；远程仓库可访问、含3次以上语义化提交、README 与 docs 截图齐全且无 build/ 等垃圾文件；能解释 main.dart 中 runApp 与 Widget 的概念；进度报告十节完整、截图真实。

---

## 二、环境与工具

- **操作系统**：Windows 11 25H2（内部版本 10.0.26200.9457，简体中文）。
- **Flutter**：3.47.5（stable 通道），Dart 3.13.4，DevTools 2.60.0；SDK 位于 C:\flutter。
- **平台工具链**：Android SDK 36.0.0（已接受 android-licenses），模拟器 Pixel 7（Android API 34，x86_64）；Visual Studio Community 2022 17.14（含 C++ 桌面开发）；Google Chrome 152。
- **AI 工具**：TraeCode CN 1.107.1（TraeWork 同账号体系）。版本控制：git 2.55.0，远程仓库 GitHub（langjinbuhuitou/hello_world）。
- **运行目标**：Web（Chrome）与 Android 模拟器（Pixel 7）。镜像：PUB_HOSTED_URL=https://pub.flutter-io.cn，FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn。

---

## 三、过程记录

### 安装：

（1）安装与原理：在 TraeCode 中描述安装目标后按分步建议执行——Flutter SDK 压缩包解压到无中文、无空格的 C:\flutter，并把 C:\flutter\bin 加入用户级 PATH（PATH 的作用是让任意目录下都能直接调用 flutter 命令，改后必须重开终端生效）；配置国内镜像 PUB_HOSTED_URL 与 FLUTTER_STORAGE_BASE_URL 加速 pub 包与引擎下载。三层关系：Flutter SDK（含内置 Dart SDK 与 flutter 命令）是核心本体；平台工具链（Android Studio 含 Android SDK 36 与模拟器、Visual Studio 2022 的 C++ 桌面开发工作负载、Chrome）负责各端构建与运行；PATH 与镜像环境变量则把这些工具「接线」到命令行。安装后执行 flutter doctor --android-licenses 全部接受，再用 flutter doctor 逐项修复至全绿。

（2）验证：重开终端执行 flutter --version 显示 Flutter 3.47.5 / Dart 3.13.4；flutter devices 能列出 Windows、Chrome、Edge；网络恢复后 doctor 七项全绿。

### 创建：

flutter create hello_world 生成项目（lib/main.dart 为入口，pubspec.yaml 声明依赖，android/ios/web/windows 为各平台工程）；阅读 main.dart 找到 runApp(const MyApp())；git init 并配置用户名邮箱后完成首次提交。

修改：为 main.dart 全文添加逐行中文注释；过程中补全 ColorScheme.fromSeed、MainAxisAlignment.center 两处缺失的类名；完成「故意实验」（改成不存在的 NotExistWidget 观察报错后改回）。

运行：flutter run -d chrome 在 Web 端看到计数器；通过 Device Manager 启动 Pixel_7 模拟器，flutter run -d emulator-5554 在模拟器运行成功；编写 README 后共完成 6 次语义化提交并推送到 GitHub 的 lecture1 分支。

---

## 四、关键代码

下面是 lib/main.dart 中与 runApp 相关的核心片段（完整全文已在仓库 lib/main.dart 逐行加中文注释）：

```dart
import 'package:flutter/material.dart'; // 导入 Material 组件库
void main() {                        // 应用入口，启动时首先执行
  runApp(const MyApp());             // 把根组件 MyApp 挂载到屏幕
}
class MyApp extends StatelessWidget { // 根组件：无可变状态
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) { // build 返回界面 Widget 树
    return MaterialApp(                // 全局配置：主题+首页
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

逐行解释：第1行导入 Flutter 自带的 Material 组件库；第2-4行 main 是程序入口，runApp 把传入的 Widget 挂上屏幕并触发渲染；MyApp 继承 StatelessWidget，表示它只依赖配置、不保存会变化的数据；build 方法在需要渲染时由框架调用，返回一棵 Widget 树；MaterialApp 提供应用级的主题与路由配置，home 指定首屏为 MyHomePage。

AI 标注：代码本体为 flutter create 模板自动生成（属于脚手架，不算 AI 代写）；逐行中文注释由本人在 TraeCode 辅助解释 API 后自行编写；已通过 flutter analyze 零问题、Web 与模拟器实际运行两次验证，本人能对每一行作口头解释。

---

## 五、检查点结果

① flutter doctor 全绿：已通过。flutter doctor 七项全部为 [√]，结论 No issues found!，含 Flutter 3.47.5、Android SDK 36.0.0、Chrome、Visual Studio 2022 与3个可用设备（全屏截图见图1）。

② HelloWorld 在 Web 与模拟器运行：Web 端 flutter run -d chrome 编译后浏览器自动打开 localhost 页面，显示计数器示例（图2）；模拟器端在 Device Manager 启动 Pixel 7 后 flutter run -d emulator-5554，应用安装启动成功（图3）。运行中按 r 可热重载。

③ 仓库提交：已通过。仓库地址 https://github.com/langjinbuhuitou/hello_world ，作业内容位于 lecture1 分支（lecture1 目录），含6次语义化提交：feat: flutter create hello_world；feat: run on web and emulator with screenshots；docs: add README with run instructions and screenshots；chore: 将课堂作业一提交材料整理到 lecture1 目录；fix: 补全缺失标识符并添加逐行中文注释；docs: 更新全屏截图并补充 README（图4、图5）。build/、.dart_tool 等均被 .gitignore 排除，无垃圾文件。

---

## 六、问题与调试

### 问题1：flutter doctor 的 Network resources 出现 [!] 警告

**现象**：doctor 前六项（Flutter、Windows、Android toolchain、Chrome、Visual Studio、Connected device）全部 [√]，唯独 Network resources 提示无法检查 https://github.com/（信号灯超时时间已到）。

**定位**：本机未启用任何代理，浏览器与 PowerShell 直连 github.com:443 超时；而 flutter 资源与 pub 包实际走的是国内镜像域名。检查用户级环境变量，PUB_HOSTED_URL=https://pub.flutter-io.cn、FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn 均已正确配置。

**解决**：确认该警告只影响 GitHub 连通性探测，不影响 SDK 与依赖下载及构建；在网络恢复后重新执行 flutter doctor 复查，七项全部通过，显示 No issues found!（见图1）。

> 图6：当时 flutter doctor 的 Network resources 警告全屏输出（复查后已通过，见图1）

### 问题2：main.dart 引用了不存在的组件（故意实验+真实修复）

**现象**：按指南故意实验，把 home 后的组件临时改成 const NotExistWidget()，保存后执行 flutter analyze，终端报 error - The name 'NotExistWidget' isn't a class. Try correcting the name to match an existing class - lib\main.dart:26:，1 issue found（见图7）。

**定位**：错误信息直接给出了文件名与行号；编译期未定义名称说明 Widget 树中引用的类没有声明或没有导入。此前本人还发现模板文件中 ColorScheme、MainAxisAlignment 两处限定类名丢失（写法为 .fromSeed、.center），属于同一类问题。

**解决**：按错误行号把 NotExistWidget 改回 MyHomePage，补全 ColorScheme.fromSeed 与 MainAxisAlignment.center，重新 flutter analyze 显示 No issues found!，热重载后页面正常。修复以 fix: 提交留痕（见图4）。

> 图7：故意实验的编译错误输出（NotExistWidget 未定义，定位到 main.dart 第26行）

---

## 七、AI 使用记录

使用工具：TraeCode CN 1.107.1（TraeWork 同账号体系）。AI 仅用于咨询与解释，所有系统级操作确认、Git 提交推送、运行验证与截图均由本人完成。

| 用途 | 指令摘要 | AI 输出 | 本人验证方式 |
|------|---------|---------|-------------|
| 环境安装咨询 | 帮我在这台 Windows 上安装 Flutter，计划在 Android 模拟器、Windows、Web 端运行 | 分步给出 SDK 解压、PATH 与镜像环境变量、Android 许可、doctor 修复建议 | 逐步执行后 flutter doctor 全绿，flutter devices 列出3个设备 |
| 工具链原理 | 解释 Flutter SDK、平台工具链、PATH 三层是什么关系 | SDK 是本体、平台工具链负责各端构建、PATH 让任意目录可执行 flutter | 与 docs.flutter.dev/get-started/install 官方步骤核对一致 |
| 代码理解 | 逐行解释 flutter create 生成的计数器模板 | 解释 runApp、StatelessWidget、setState 等 API 作用 | 本人改写为逐行中文注释，flutter analyze 零问题 |
| 报错分析 | The name 'NotExistWidget' isn't a class 是什么意思 | 指出引用了未定义的类，给出核对类名/导入的建议 | 把组件改回 MyHomePage 后 analyze 通过、页面恢复 |
| Git 规范 | 首次提交与远程仓库推送的标准命令顺序 | init/add/commit/remote/push 与语义化提交说明示例 | 本人在自己的账号下完成6次提交并成功推送 lecture1 |
| 边界说明 | — | 系统配置确认、许可接受、账号密码、提交与推送均不由 AI 代做 | 全程本人在场确认，截图留证可追溯 |

---

## 八、证据截图

以下均为本人电脑全屏截图（含任务栏/窗口标题），原图存于仓库 lecture/docs 目录：

- **图1**：flutter doctor 体检结果：七项全部通过，No issues found! → `docs/doctor_full.png`
- **图2**：hello_world 在 Chrome（localhost）运行，计数器示例正常显示 → `docs/web_run.png`
- **图3**：hello_world 在 Android 模拟器（Pixel 7）运行（全屏截图）→ `docs/emulator_run.png`
- **图4**：Git 提交记录：lecture1 分支含 6 次语义化提交并与 origin/lecture1 同步 → `docs/git_log.png`
- **图5**：GitHub 远程仓库 lecture1 分支页面（含 README 与 docs 截图）→ `docs/repo_page.png`

---

## 九、自评

对照《实践指南一》6.1 案例复现与 6.2 自主实践基本要求逐项自查如下：

| 项目 | 要求 | 完成情况 |
|------|------|---------|
| 案例复现 | 复现 hello_world，多端运行、按步骤 Git 提交、README | 已完成：Chrome 与 Pixel 7 模拟器均运行成功；仓库含 6 次语义化提交与 README |
| 自主任务1 | TraeWork/TraeCode 辅助安装记录（指令、结果、验证） | 已完成：见第七节 AI 使用记录第1条，doctor 全绿验证 |
| 自主任务2 | flutter doctor 问题定位与修复（至少1个真实问题） | 已完成：记录网络项警告与 analyze 编译错误两类问题，见第六节 |
| 自主任务3 | 手工安装原理说明（SDK、平台工具链、PATH） | 已完成：见第二节环境信息与第三节安装记录中的说明 |
| 自主任务4 | HelloWorld 代码逐行中文注释（main.dart 全文） | 已完成：lecture/hello_world/lib/main.dart 全文逐行注释，flutter analyze 零问题 |
| 自主任务5 | AI 使用边界说明（AI 做了什么、什么必须自己做） | 已完成：见第七节，系统级确认、提交、截图与验证均本人完成 |
| 独立研究 | 6.3 三个选做任务 | 本次未选做 |

---

## 十、下一步计划

1. 复习并预习 Widget 树、StatelessWidget 与 StatefulWidget 的区别（第5课主线），对照 main.dart 理解 MyApp 与 MyHomePage 的父子关系；
2. 熟练 flutter run 交互命令（r 热重载、R 热重启、q 退出）与 DevTools 的基本使用；
3. 网络波动期改用 Gitee 托管或在网络稳定时访问 GitHub，并为仓库补充 .gitignore 检查，坚持不提交 build/ 等构建产物；
4. 结合雨课堂题库复习 flutter 与 git 常用命令、command not found 等错误的定位思路。
