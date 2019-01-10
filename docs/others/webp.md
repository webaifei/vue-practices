# webp 图片格式
> webp是google推出一种新的图片格式，同样清晰度的图片webp的更小。


::: warning
目前IOS端基本上不支持webp格式
:::

## webp 格式特点

## vue项目中使用
结合[vue-webp-plugin](https://www.npmjs.com/package/vue-webp-plugin) 和 [new-webp-webpack-plugin](https://www.npmjs.com/package/new-webp-webpack-plugin)

1. `webpack`配置
```js
const WebPWebpackPlugin = require("new-webp-webpack-plugin");
// webpack config
plugins: [
    // webp图片格式
    new WebPWebpackPlugin({
        match: /(jpe?g|png)$/,
        format: "[name].webp"
    }),
],
```
2. vue中使用webp详细参考[vue-webp-plugin](https://www.npmjs.com/package/vue-webp-plugin)

参考地址：
1. [A new image format for the Web](https://developers.google.com/speed/webp/)
2. [Using WebP Images](https://css-tricks.com/using-webp-images/)
3. [探究WebP一些事儿](https://aotu.io/notes/2016/06/23/explore-something-of-webp/index.html)
