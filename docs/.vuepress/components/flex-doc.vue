<template>
    <div>
        <div class="font-16 mg-t-8 mg-b-8">垂直 水平居中</div>
            <div class="flex show-box bg-gradient">
                .flex  垂直 水平 居中
            </div>
            <div class="font-16 mg-t-8 mg-b-8">左右布局</div>
            <div
                class="flex show-case-border"
                style="width: 400px"
                >
                <img
                    :src="require('../../assets/images/光大@3x.png')"
                    alt=""
                    >
                <div
                    class="flex-item"
                    style="margin-left: 8px"
                    >
                    <p>这个是标题这个是标题</p>
                    <p class="color-desc">这里是描述描述，这里是描述描述这里是描述描述这里是描述描述</p>
                </div>
            </div>
            <div class="font-16 mg-t-8 mg-b-8">左右布局  右侧 上下对齐</div>
            <div
                class="flex flex-full-height show-case-border"
                style="width: 400px"
                >
                <img
                    :src="require('../../assets/images/光大@3x.png')"
                    alt=""
                    >
                <div
                    class="flex-item inline-flex flex-column flex-align-start flex-between"
                    style="margin-left: 8px"
                    >
                    <p>这个是标题这个是标题</p>
                    <p class="color-desc">这里是描述描述，这里是</p>
                </div>
            </div>
        
    </div>
</template>

<style lang="scss">
.show-box{
    width: 200px;
    height: 200px;
}
.show-case-border{
    border: 1px solid #ccc;
}
    
</style>