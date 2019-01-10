<template>
    <div>
        <div class="button-view">
            <md-button>Primary</md-button>
            <br>
            <md-button disabled>Primary Disabled</md-button>
            <br>
            <md-button class="button-no-radius">无圆角</md-button>
            <br>
            <div class="flex flex-between">
                <md-button
                    type="ghost-primary"
                    >中型按钮</md-button>
                <md-button
                    type="ghost-primary"
                    class="bg-gradient"
                    >中型按钮</md-button>
            </div>
            <br>
            <div class="flex flex-between">
                <md-button
                    type="ghost-primary"
                    size="small"
                    >小型按钮</md-button>
                <md-button
                    type="ghost-primary"
                    size="small"
                    class="bg-gradient"
                    >小型按钮</md-button>
            </div>
        </div>
    </div>
</template>
<script>
import {Button} from "mand-mobile";
export default {
    components: {
        [Button.name]: Button,
    }
};
</script>

<style lang="scss">
.button-view{
    margin-top: 10px;
    width: 70%;

}
    
</style>