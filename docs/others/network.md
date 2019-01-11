# 接口请求
> 单页应用中 在没有SSR的情况下，前端性能很大一部分取决于接口响应的速度。

## 请求时机
在优化接口服务响应的速度的同时，前端同学可以通过其他的一些方式来优化：
1. 内存缓存：对于更新频率不是很高的接口做缓存，而不是每次都去加载
2. 本地存储：对于更新频率极低的接口服务， 比如：全国省市列表 ，前端可以使用本地存储进行缓存
3. 预取： 对于固定的操作链路，比如进入我们的产品首页 通过统计发现 很大一部分用户都会进入产品列表页， 那我们就可以在首页对产品列表接口服务进行预加载，从而节省进入产品列表页的Fisrt Meaningful Paint 的时间；同样的， 如果你是hibyrad 产品，可以通过app来进行更多的预取操作。

## 请求失败的toast提示优化
通常我们会将接口请求分装成一个通用的工具方法，包含一些共同的逻辑：接口服务请求成功判断，失败统一处理，失败toast等。
1. 如果你是这样做的，提供了一个通用的toast失败处理，可能会出现这样的问题：
A页面的接口服务请求已经发出，没有响应之前跳转到了B页面，这个时候之前的请求响应失败，诡异的弹出了一个toast，用户懵逼了。

如果你是在使用axios进行前端网络请求，一个简单的处理方案：
```js
instance.interceptors.request.use(
    config =>
        new Promise(resolve => {
          // 标记当前请求的触发者
          // 当然 如果你的逻辑不能使用pathname唯一区别的话 修改成自己的唯一判断标记
           config.initiator = location.pathname;
        });
);

instance.interceptors.response.use(
  response => {
    const config = response.config;
    // you can also handle your own error logic here.

  },
  error=> {
    const config = error.config;
    if(config.initiator === location.pathname) {
      this.$toast.info("请求出错");
    }
  }

)
```

## 接口请求loading和防止重复多次请求

### loading效果
关于loading效果设计属于用户体验设计范畴，我们不做深入说明，有兴趣的可以看下[这篇文章](https://www.uisdc.com/mobile-applications-loading-design)和[这篇](http://www.woshipm.com/pd/708231.html)
目前针对不同的操作，我们提供了一下几个方案。
1. 对于初始化界面的加载过程 使用的placeholder [vue-content-loader](https://github.com/egoist/vue-content-loader)来进行占位。
2. 其他的按钮点击交互 建议使用[v-promise-btn](https://www.npmjs.com/package/vue-promise-btn)
```vue
<div v-promise-btn  @click="createOrder">
    <md-button>立即开通</md-button>
</div>
```
有两个注意点：
- 使用v-promise-btn 指令不能在自定义组件上添加 
- 绑定的事件返回值一定是一个promise对象

::: tip
有兴趣的可以阅读下v-promise-btn的源码 比较有意思

TODO: 后面改进这个插件 达到更加方便易用。
:::

3. 针对不可逆或者目的性非常明确的交互过程而且不影响用户其他的主动操作的场景使用 toast.loading的方式；
这里不提供具体的toast loading组件。

### 防止重复请求
1. v-promise-btn包含了这个功能
2. 其他的loading方案 自行实现

