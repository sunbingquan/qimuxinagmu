<template>
    <div class="input-group" :class="{'fg-toggled':isFocus}">
        <span class="input-group-addon"><slot name="icon"></slot></span>
        <div class="fg-line">
            <el-select size="mini" @focus="isFocus=true" @blur="isFocus=false" class="form-control" :value="value" @input="$emit('input' , $event)">
                <slot></slot>
            </el-select>
        </div>
    </div>
</template>
<style type="type/scss" scoped lang="scss">
    .input-group {
        display: flex;
        align-items: center;
        justify-content: start;
        position: relative;

        .input-group-addon {
            white-space: nowrap;
            vertical-align: middle;
            padding: 6px 12px;
            font-size: 14px;
            font-weight: 400;
            line-height: 1;
            color: #555;
            text-align: center;
            background-color: #eee;
            border: 1px solid #ccc;
            border-radius: 4px;

            flex-shrink: 0;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
            border: none;
            background: none;
            font-size: 16px;
        }
        .input-group-addon:first-child {
            border-right: 0;
        }
        .fg-line {
            flex-grow: 1;
            position: relative;
        }
    }

    .form-control {
        position: relative;
        font-size: 13px;
        border: 1px solid #e0e0e0;
        border-left: 0;
        border-right: 0;
        border-top: 0;
        padding: 0;
        outline: none;
        background: #fff;
        color: #555;
        height: 35px;
        line-height: 35px;
        transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        box-shadow: none;
    }
    .form-control:focus {
        outline: none;
    }
    .input-group .form-control {
        position: relative;
        z-index: 2;
        float: left;
        width: 100%;
        margin-bottom: 0;
    }
    .input-group .form-control:first-child {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }
    .input-group:before {
        position: absolute;
        z-index: 3;
        bottom: 0;
        left: 0;
        height: 2px;
        width: 100%;
        content: "";
        -webkit-transition: all;
        -o-transition: all;
        transition: all;
        -webkit-transition-duration: 0.3s;
        transition-duration: 0.3s;
        background: #eaeaea;
    }
    .input-group:after {
        position: absolute;
        z-index: 3;
        bottom: 0;
        left: 0;
        height: 2px;
        width: 0;
        content: "";
        -webkit-transition: all;
        -o-transition: all;
        transition: all;
        -webkit-transition-duration: 0.3s;
        transition-duration: 0.3s;
        background: #29a176;
    }

    .input-group.fg-toggled:after {
        width: 100%;
    }
</style>
<script>
    export default {
        name: "zheng-select",
        data() {
            return {
                isFocus: false,
            };
        },
        props: {
            value: String,
            type: {
                type: String,
                default: "text",
            },
            placeholder: {
                type: String,
            },
            autofocus: {
                type: Boolean,
                default: false,
            },
        },
        watch: {},
        computed: {},
        methods: {},
        created() {},
        mounted() {},
        destroyed() {},
    };
</script>
