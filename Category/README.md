# Category

在不创建继承类的情况下实现对已有类的扩展，但不能像继承一样添加新的实例变量，只能添加方法，新添加的方法同样也会被扩展的类的所有子类自动继承。 
 
一般格式 

``` 
@interface ClassName (ExtendedClassName) 
// Methods' Code here 
@end
```
