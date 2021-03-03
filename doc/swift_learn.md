# Swift

## 基本格式
* 注释和C相同
* 行尾不需要；
* 运算符不能跟在变量常量后面，需要空格
* for循环，if判断之类的控制流，临时变量可以不声明（？
* 声明变量var
* 声明常量let
* "String + \\(othertype)"将其他类型加入字符串

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

* 储存属性

  延迟储存属性 lazy

* 计算属性 get set

  属性观察器 willset-newValue，didset-oldValue

* 类属性 ，通过类名访问

  static 来定义值类型(struct,enum)的类型属性

  class 来为类(class)定义类型属性

## 方法

=类成员函数

* 默认仅给方法的第一个参数名称一个局部参数名称;默认同时给第二个和后续的参数名称为全局参数名称



