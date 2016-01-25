# Property & instance variable

成员变量(实例变量)用于自身类内使用，属性用于类外调用。 
 
类内的操作使用成员变量，类外操作使用属性，属性操作实际是对成员变量的`setter`和`getter`
 
类方法不可访问实例变量，对象方法可以直接访问实例变量 
 
成员变量以下划线开始，如`_username` 
 
属性与成员变量同名，无下划线，如`username` 
 
现只要定义了属性，会自动生成对应的成员变量，为属性名前加下划线 
 
如 

``` 
@property(nonatomic, strong) NSString *username; 
```
 
属性`username`对应的成员变量为`_username`
 
若无属性，需声明成员变量，则在`.m`文件中直接声明

如 

```
@implementation ClassName 
{ 
NSString *_username; 
int _age; 
} 
// Code here 
@end
```
