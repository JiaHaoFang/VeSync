# Swift

## 新概念

* 闭包
* 可选
* 属性&方法
* 协议
* as is
* 泛型
* 元组

## 基本格式
* 注释和C相同

* 行尾不需要；

* 运算符不能跟在变量常量后面，需要空格

* for循环，if判断之类的控制流，临时变量可以不声明（？

* 声明变量var

* 声明常量let

* "String + \\(othertype)"将其他类型加入字符串

* guard-else 判断语法

* 

  

## 可选类型Optionals

```swift
var optInt:Int? 
//没有提供初始值的可选变量默认为nil
```

```swift
var optStr:String?
optStr = "hello"
print(optStr)
//print(optStr!)
//强制解析，一定要包含一个可选非nil的值
```

```swift
var optStr:String！
//声明可选变量，自动解析
```

```
if let 
```



## 运算符

* 闭区间运算符(a..b)，有ab
* 开区间运算符(a..<b)，有a无b
* 三目运算符(a ? b = c)

## for in 循环

```swift
var numbers:[Int] = [1,2,3,4,5]
for number in numbers{
  print("\(number) in numbers")
}
```

## 数组

```swift
var someArray = [SomeType](repeating: InitialValue, count: NumbeOfElements)
//or
var someInt:[Int] = [1,2,3,4]
```

* .append()或运算符+=在数组**末尾**添加元素

* .enumerated()方法遍历数组，得到数据项和索引值

  ```swift
  for (index , item) in someInt.enumerated(){
    print ("在 \(index) 位置上的数值为 \(item)")
  }
  ```

* 合并数组 +

* .count计算数组元素个数

* .isEmpty判断数组是否为空，返回bool

## 字典

```swift
var dict:[Int:String] = [:]
```

* .updateValue(_ : forKey:)，修改字典，返回值为旧值
* .removeValueForKey(forKey:)，移除一对，返回值为移除的值/nil
* count，isEmpty

## 函数

```swift
func name(形参) -> returntpye
{
  blabla
  return parameters
}
```

* 外部参数名

  ```swift
  func pow(firstArg a: Int, secondArg b: Int) -> Int {*}
  pow(firstArg:5, secondArg:3)
  
  func swap(_ a: inout Int, _ b: inout Int){*}
  swap(&alpha,&beta)
  //_ 表示忽略外部参数名
  ```

  

* 可变参数

  ```swift
  func vari<N>(members: N...){
  ```

* 函数类型

  ```swift
  var addition: (Int, Int) -> Int = sum
  //func sum is defined
  ```

  

## 闭包

```swift
{(paramters) -> return type in 
  statements
}
```

* sorted方法

* 参数名称缩写

  ```swift
  var reversed = names.sorted( by: { $0 > $1 } )
  print(reversed)
  //此处用的是闭包表达式，自动捕获上下文的值
  ```

* 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用

* 闭包是引用类型

## 枚举

```swift
enum eunmname{
  //定义
}
```

* 原始值，使用rawValue访问成员原始值
* 缩写调用

## 属性

> 用于储存值

* 储存属性

  延迟储存属性 lazy

* 计算属性 get set

  只读计算属性 var name:TYPE { }

  属性观察器 willset-newValue，didset-oldValue

* 类型属性 ，通过类名访问

  static 来定义值类型(struct,enum)的类型属性 

  class 来为类(class)定义类型属性

## 方法

> 用于提供功能

=类成员函数 **func**

* 默认仅给方法的第一个参数名称一个局部参数名称;默认同时给第二个和后续的参数名称为全局参数名称

* self

* 变异mutating func

  修改结构体和枚举类型中的值类型的属性

* 类方法，类似公有成员函数

## 下标脚本

```swift
subscript(index: Int) -> Int {
    get {
        // 用于下标脚本值的声明
    }
    set(newValue) {
        // 执行赋值操作
    }
}
```

## 类

* super.init 子类的初始化 
* override 重写
* final class 防止重写类，也不能被继承
* convenience init 便利构造
* 子类不会默认继承父类的构造器，需要重写
* init? 可失败构造器

## 自动引用计数

* 强引用
* 循环强引用
* weak弱引用 
* unowned无主引用

## 类型转换

* is 判断
* as，as？，as！类型转换

## 扩展

* extension

## 协议

```swift
protocol SomeProtocol: SomeSuperClass, FirstProtocol, AnotherProtocol{
  //
}
```

* 用于指定实例属性或类属性

* 在协议中用var声明变量属性，{set get}可读可写，{get}只读

* 对构造器的规定

  ```swift
  protocol SomeProtocol{
    init(someParamter: Int)
  }
  
  class someClass:SomeProtocol{
    required init(someParameter: Int){
      //
    }
  }
  ```

  * 不需要写构造器的实体
  * required
  * 重写 required override

* 类专属协议

  ```swift
  protocol SomeClassOnlyProtocol: class, SomeProtocol{
    //
  }
  ```

  * class 必须第一个出现在协议的继承列表中

* is as 检验协议一致性

## 泛型

> 同c的模版类

```swift
func swap<T>(_ a: inout T, _ b: inout T)
```

* T占位类型名 （<T>）

* 类型约束

  ```swift
  func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
      // 这里是泛型函数的函数体部分
  }
  ```

* associatedtype 关联类

* where

* 

## 访问权限

* public internal fileprivate private
* 外层级别与内层访问权限最低的一致
* 子类访问级别不得高于父类的访问级别ß