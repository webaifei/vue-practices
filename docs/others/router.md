# 过场动画

要实现页面前进后退动画我们需要给各个页面定义层级,在切换路由时判断用户是进入哪一层页面,如果用户进入更高层级那么做前进动画,如果用户退到低层级那么做后退动画.

我们也可以通过重写vueRouter push方法给页面添加时间戳参数 监控路由跳转,判断切换页面时间戳参数之间的大小关系,并以此来判断路由前进或者后退 


### 重写vueRouter push方法
实现点击则添加etime参数 值为当前时间的时间戳

```
vueRouter.prototype._push = vueRouter.prototype.push;
vueRouter.prototype.push = function push (location, onComplete, onAbort) {
    let locationObj = {
        query: {}
    };
    if(typeof location === "string") {
        locationObj.path = location;
    } else if(isObject(location)) {
        locationObj = {...locationObj,...location};
    }
    locationObj.query.ctime = Date.now();
    this._push(locationObj, onComplete, onAbort);
};
```

### 设置过渡效果

基于当前路由与目标路由的变化关系，动态设置过渡效果

```
<!-- 使用动态的 transition name -->
<transition :name="transitionName">
    <keep-alive max="2">
        <router-view></router-view>
    </keep-alive>
</transition>
```
### 监控路由跳转

监控路由跳转,判断切换页面时间戳参数之间的大小关系
```
"$route" (to, from) {
    console.log("route change");
    if(to.query.ctime && from.query.ctime && to.query.ctime < from.query.ctime) {
        this.transitionName = "slide-left";
    } else if(!to.query.ctime && from.query.ctime) {
        this.transitionName = "slide-left";
    } else {
        this.transitionName = "slide-right";
    }
}
```

