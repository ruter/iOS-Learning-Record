# Protocol

## 协议的声明 

```
@protocol ProtocolName <NSObject> 
// Methods here
@required
-(void)method1;
-(void)method2;

@optional
-(void)optionalMethod;
@end 
```

只声明要实现的方法，而不负责方法的实现。 
 
协议有两个指令：`@required`和`@optional` 
 
前者指定的方法为必须实现的方法，后者指定的方法为可选的。 
 
## 协议的使用 
 
在要实现协议的类的`.h`文件中加上`<ProtocolName>` 

```
@interface ClassName : NSObject <ProtocolName> 
// Code here 
@end 
```

协议中声明的方法在`.m`文件中实现，如 

```
@implementation ClassName 
-(void)method1 { 
// Code here 
} 
-(void)method2 { 
// Code here 
} 
@end 
```

一个类可实现多个协议，如 

```
@interface ClassName : NSObject <ProtocolName1, ProtocolName2, ProtocolName3> 
// Code here 
@end
``` 
