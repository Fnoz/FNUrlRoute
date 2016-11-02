# FNUrlRoute
## 🍎 Swift 路由框架：iOS 基于页面、模块的路由框架，解耦神器。 🍎

### 介绍
用 FNUrlRoute，可以用来解耦模块，使得模块之前的调用独立开来，举个简单的例子，你在 VC、Model 或者 Cell 中直接调用类似`Open(xxxPage)` 的方式直接打开一个页面（或者唤起一个模块），从而减少代码的冗余。

另外还有一个神用途：比如Banner的跳转问题，只要跳转链接遵循规则，运营想跳什么页面，配对应的urlRoute链接就行了。

这边有一篇 jim 写的关于 UrlRoute 的博文，可以看一下，思路是一样的。

[《客户端动态化系列之——URLRoute》](http://www.jianshu.com/p/18b915735932)

如果这样说不够直观，直接上 Demo 来描述。

### 简单的例子

```
FN.open(url: "xxx://yyy/goodDetail?goodId=123")
FN.open(url: "xxx://yyy/shopDetail?shopId=456", modal:true, params:["shopId": "123" as AnyObject])
FN.open(url: "http://www.baidu.com/shopDetail.html?shopId=123")
FN.open(url: "xxx://yyy/login")
FN.open(url: "http://www.weidian.com")
```
![](http://7xl2dx.com1.z0.glb.clouddn.com/fnurlroute_home.png)

点击对应 cell 分别执行上面的代码，效果如下：

![](http://7xl2dx.com1.z0.glb.clouddn.com/fnurlroute_0.gif)
![](http://7xl2dx.com1.z0.glb.clouddn.com/fnurlroute_1.gif)

![](http://7xl2dx.com1.z0.glb.clouddn.com/fnurlroute_2.gif)
![](http://7xl2dx.com1.z0.glb.clouddn.com/fnurlroute_3.gif)

![](http://7xl2dx.com1.z0.glb.clouddn.com/fnurlroute_4.gif)

### 为了用上 FNUrlRoute，你需要做的事
1、引入代码，代码引用或者 pod 引用

2、在`didFinishLaunch`中初始化，like this：

```
FNUrlRoute.initUrlRoute(dictionary: ["yyy/goodDetail": GoodDetailViewController.self,
                                     "yyy/shopDetail": ShopDetailViewController.self,
                                     "www.baidu.com/shopDetail.html": ShopDetailViewController.self,
                                     "yyy/login": LoginModule.self])
```

3、你也可以另外新增和删除对应的模块，like this：

```
FNUrlRoute.register(key: "yyy/login", module: LoginModule.self)
            FNUrlRoute.remove(key: "yyy/login")
```

4、让你的模块（比如`ShopDetailViewController`），遵守`FNUrlRouteDelegate`协议，并实现`init(params: [String: AnyObject]?)`方法，同时你可以在这里拿到`FN.open(url:params:)`时传入的参数。

5、在任意地方，调用`FN.open`以唤起你的模块，like this：

```
FN.open(url: "xxx://yyy/goodDetail?goodId=123")

```

### 需要了解的一些逻辑
1、注册（初始化）时，对应的 `key` 为 `url` 的 `host` + `path`，比如`http://www.baidu.com/shopDetail.html?shopId=123`，`key`应该为`www.baidu.com/shopDetail.html`，`url`的`scheme`我是不 care 的，这个只是为了让你处理app间跳转方便，调用`open(url)`时没有`scheme`也是可以唤起的。

2、如果有`navigationController`，并且`modal`为`false`，则`push`页面，否则`present`（`modal`形式弹出）

3、url中如果有参数，最后会传到params中，如果有同key的key-value，以params中为准

### 一些自问自答
**问 1：初始化的时候，为什么不采用直接文件（比如 plist）读取呢？**

**答：**常会有同学对模块进行改名，比如`ShopDetailViewController` -> `FNShopDetailViewController`，结果文件里忘记改了，结果就坑了。虽然这样麻烦点，但是在编译时就发现问题。

**问 2：类似下面这种用法，怎么在对应模块里拿到params？**

```
FN.open(url: "xxx://yyy/shopDetail?shopId=456", modal:true, params:["shopId": "123" as AnyObject])
```

**答：**模块遵守`FNUrlRouteDelegate`协议，并实现`init(params: [String: AnyObject]?)`方法，同时你可以在这里拿到`FN.open(url:params:)`时传入的参数。

**问 3：如果 url 里面本身就有参数，会怎么样？**

**答：**如果 url 里有query，会取出来，放到params中传入页面，这样做的好处是，你可以通过选择合适的key，使用`http://www.baidu.com/shopDetail.html?shopId=123`直接打开一个`ShopDetailViewController `。

**问 4：如果 url 没有匹配到任意模块，会怎么样？**

**答：**没有匹配到模块，默认是会用`SFSafariViewController`打开一个 web 页面，如果你想用另外的处理方式，重写一下`HandleOverBlock`就行了，like this：

```
FNUrlRoute.setHandleOverBlock { (url, modal, params) in
	//your handle          
}
```

### 关于Pod引用
```
pod 'FNUrlRoute', :git => 'git@github.com:Fnoz/FNUrlRoute.git', :tag => '1.0.0'
```

###TODO
1、`url` 中如果含有需要 `urlEncode` 的，暂时还没处理
2、用于切换`tabController`的参数