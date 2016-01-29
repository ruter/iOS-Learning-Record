单例模式确保每个指定的类只存在一个实例对象，并且可以全局访问那个实例。一般情况下会使用延时加载的策略，只在第一次需要使用的时候初始化。 
 
单例的创建方法 
 
1. 创建一个该类打实例对象变量`static Singleton *_instance = nil;`
2. 创建实现类方法`+(instancetype)shareInstance;`
3. 重载类方法`+(id)allocWithZone:(struct _NSZone *)zone;`
4. 重载方法`-(id)copyWithZone:(struct _NSZone *)zone;`
5. 重载方法`-(id)mutableCopyWithZone:(struct _NSZone *)zone;`

单例应该只用来保存全局的状态，并且不能和任何作用域绑定。如果这些状态的作用域比一个完整的应用程序的生命周期要短，那么这个状态就不应该使用单例来管理。
