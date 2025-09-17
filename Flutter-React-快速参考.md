# Flutter vs React 快速参考卡片

## 🚀 核心概念快速对照

| React | Flutter | 说明 |
|-------|---------|------|
| `function Component()` | `class Widget extends StatelessWidget` | 无状态组件 |
| `class Component extends React.Component` | `class Widget extends StatefulWidget` | 有状态组件 |
| `useState()` | `setState()` | 状态更新 |
| `useEffect()` | `initState() / dispose()` | 生命周期 |
| `props` | `final` 参数 | 属性传递 |
| `JSX` | `Widget Tree` | UI描述 |
| `className` | `style` 属性 | 样式设置 |
| `onClick` | `onPressed` | 事件处理 |

## 📝 代码对比示例

### 简单计数器

#### React
```javascript
function Counter() {
  const [count, setCount] = useState(0);
  
  return (
    <div>
      <h1>{count}</h1>
      <button onClick={() => setCount(count + 1)}>
        Increment
      </button>
    </div>
  );
}
```

#### Flutter
```dart
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$_count'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _count++;
            });
          },
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

## 🎨 布局对比

### React 布局
```javascript
// Flexbox 布局
<div style={{ display: 'flex', flexDirection: 'column' }}>
  <header>Header</header>
  <main style={{ flex: 1 }}>Content</main>
  <footer>Footer</footer>
</div>
```

### Flutter 布局
```dart
// Column 布局
Column(
  children: [
    Text('Header'),
    Expanded(child: Text('Content')),
    Text('Footer'),
  ],
)
```

## 🔄 状态管理对比

### React Context
```javascript
const ThemeContext = createContext();

function App() {
  const [theme, setTheme] = useState('light');
  
  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      <MyComponent />
    </ThemeContext.Provider>
  );
}
```

### Flutter Provider
```dart
class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  
  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: MyWidget(),
    );
  }
}
```

## 🛠️ 开发命令对比

| 操作 | React | Flutter |
|------|-------|---------|
| 创建项目 | `npx create-react-app my-app` | `flutter create my_app` |
| 安装依赖 | `npm install` | `flutter pub get` |
| 运行项目 | `npm start` | `flutter run` |
| 构建项目 | `npm run build` | `flutter build` |
| 测试 | `npm test` | `flutter test` |

## 📱 平台支持对比

| 平台 | React | Flutter |
|------|-------|---------|
| **Web** | ✅ 原生支持 | ✅ 支持 |
| **Android** | ❌ 需要React Native | ✅ 原生支持 |
| **iOS** | ❌ 需要React Native | ✅ 原生支持 |
| **Desktop** | ❌ 需要Electron | ✅ 支持 |
| **性能** | 中等 | 接近原生 |

## 🎯 学习迁移路径

### 1. 基础概念映射
- **组件** → **Widget**
- **Props** → **构造函数参数**
- **State** → **State**
- **JSX** → **Widget Tree**

### 2. 布局系统学习
- **Flexbox** → **Row/Column**
- **Grid** → **GridView**
- **Position** → **Stack**

### 3. 状态管理学习
- **useState** → **setState**
- **Context** → **Provider**
- **Redux** → **Bloc/Riverpod**

### 4. 样式系统学习
- **CSS** → **Widget属性**
- **Styled Components** → **自定义Widget**
- **CSS Modules** → **Theme系统**

## 🔍 调试技巧对比

### React 调试
```javascript
// 控制台调试
console.log('Debug info');
console.table(data);

// React DevTools
// 组件树查看
// Props/State 检查
```

### Flutter 调试
```dart
// 控制台调试
print('Debug info');
debugPrint('Formatted debug');

// Flutter Inspector
// Widget 树查看
// 属性检查
// 热重载
```

## 📚 常用库对比

| 功能 | React | Flutter |
|------|-------|---------|
| **路由** | React Router | Navigator 2.0 |
| **状态管理** | Redux/Zustand | Provider/Bloc |
| **HTTP请求** | Axios/Fetch | http package |
| **本地存储** | localStorage | SharedPreferences |
| **动画** | Framer Motion | Animation API |
| **UI组件** | Material-UI | Material Design |

## ⚡ 性能优化对比

### React 优化
```javascript
// 使用 memo 避免不必要的重渲染
const MyComponent = memo(({ data }) => {
  return <div>{data}</div>;
});

// 使用 useMemo 缓存计算结果
const expensiveValue = useMemo(() => {
  return computeExpensiveValue(data);
}, [data]);
```

### Flutter 优化
```dart
// 使用 const 构造函数
const Text('Static Text');
const Icon(Icons.star);

// 使用 const 关键字优化
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Text('Optimized Widget');
  }
}
```

## 🎨 样式对比

### React 样式
```javascript
// CSS-in-JS
const Button = styled.button`
  background: blue;
  color: white;
  padding: 10px;
`;

// 内联样式
<button style={{ 
  background: 'blue', 
  color: 'white',
  padding: '10px' 
}}>
  Click me
</button>
```

### Flutter 样式
```dart
// Widget 属性样式
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: EdgeInsets.all(10),
  ),
  onPressed: () {},
  child: Text('Click me'),
)

// 主题系统
Theme(
  data: ThemeData(
    primaryColor: Colors.blue,
  ),
  child: MyWidget(),
)
```

## 🚀 快速上手建议

### 对于React开发者
1. **先学习Dart语言基础**
2. **理解Widget概念**
3. **掌握Flutter布局系统**
4. **学习状态管理**
5. **实践项目开发**

### 学习资源推荐
- [Flutter官方文档](https://flutter.dev/docs)
- [Dart语言指南](https://dart.dev/guides)
- [Flutter示例项目](https://github.com/flutter/samples)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)

---

**记住：Flutter的Widget就像React的组件，但更加强大和灵活！** 🎯
