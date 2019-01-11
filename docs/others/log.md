# 埋点
> 埋点是数据采集的手段， 从开发者角度来讲分为前端埋点和后端埋点；各有优劣。前端埋点的实现方式划分的话，目前存在：手动埋点，自动埋点。其中手动埋点又包含：命令式埋点和声明式埋点和可视化埋点。

::: tip
TODO: 各个埋点技术实现原理和对比
:::

目前我们使用的埋点方式是命令式埋点，它的特点：
1. 灵活，可以实现各种业务埋点需求
2. 需要前端研发同学coding 完成埋点，增加开发量

## 之前的埋点方案
之前的埋点方案同样使用的是命令式埋点方案，只不过将埋点配置放到了单独的配置文件中，方便集中化的管理。

但是因为几个原因导致实际效果不太理想：
- 同样需要在编码卖点的代码中去设置特定的个性化参数
- 对于不同页面中的相同组件，需要在配置中不同的页面下添加相同的埋点配置
- 实际迭代过程中 修改已有埋点的频率并不是非常高，集中式维护埋点配置的优势得不到提现，及时需要修改埋点配置，因为上面的原因 导致我们还是需要到具体的发送埋点的逻辑代码中进行修改。

## 重构之后的埋点方式
::: tip
1. 不再需要在配置文件中维护埋点配置，
2. 兼容配置埋点方式， 对于老的页面 新增埋点同样不需要在配置文件中添加维护
:::
回头重新梳理埋点的逻辑，其实针对每一个埋点能够唯一标记并且有固定的规律即可。
```js
Log.send(currentPage, current_event, options);
// options中核心的两个字段
options.content.events = {
    current_event: current_event,
    current_page: currentPage,
    event_value: eventValue,
    msg: eventMsg,
    event_remark: eventRemark
};

options.content.retention.rsd = Object.assign(
    {},
    config.content.retention.rsd,
    rsd
);
```
我们核心关注的就是上面的三个参数： 标记是哪个页面`currentPage` 什么事件`current_event` 其他说明字段`options`

1. `currentPage` 通过代码获取当前`url`的`pathname` 自动转换成指定的格式（已下划线_链接的字符串）
2. `current_event` 在调用埋点的时候作为参数传入
3. `options`中的字段也同样通过代码进行获取配置

具体实现查看`utils/log.js`

::: warning
因为涉及到业务具体逻辑 目前没有进行抽象成一个npm包；后面考虑做到脚手架中。
:::


## 模块曝光埋点解决方案
模块曝光埋点使用[vue-intersection-plugin](https://webaifei.github.io/vue-intersection-plugin/)