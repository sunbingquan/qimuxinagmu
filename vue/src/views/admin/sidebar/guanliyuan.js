export default [
    {
        label: "账号管理",
        to: "",
        children: [
            {
                label: "管理员账号管理",
                to: "/admin/admins",
            },
            {
                label: "管理员账号添加",
                to: "/admin/adminsadd",
            },
            {
                label: "密码修改",
                to: "/admin/mod",
            },
        ],
    },


    {
        label: "分类管理",
        to: "",
        children: [
            {
                label: "分类添加",
                to: "/admin/fenleiadd",
            },
            {
                label: "分类查询",
                to: "/admin/fenlei",
            },
        ],
    },
    {
        label: "家具管理",
        to: "",
        children: [
            {
                label: "家具添加",
                to: "/admin/jiajuadd",
            },
            {
                label: "家具查询",
                to: "/admin/jiaju",
            },
        ],
    },
    {
        label: "订单管理",
        to: "",
        children: [
            {
                label: "订单查询",
                to: "/admin/dingdan",
            },
        ],
    },
    {
        label: "地址管理",
        to: "",
        children: [

            {
                label: "地址查询",
                to: "/admin/shouhuodizhi",
            },
        ],
    },
    {
        label: "发货管理",
        to: "",
        children: [
            {
                label: "发货查询",
                to: "/admin/fahuo",
            },
            {
                label: "收货查询",
                to: "/admin/shouhuo",
            },
        ],
    },
    {
        label: "售后管理",
        to: "",
        children: [
            {
                label: "售后反馈查询",
                to: "/admin/liuyanban",
            },

        ],
    },

    {
        label: "评论管理",
        to: "",
        children: [
            {
                label: "评论查询",
                to: "/admin/pinglun",
            },
        ],
    },
    {
        label: "新闻管理",
        to: "",
        children: [
            {
                label: "分类添加",
                to: "/admin/xinwenfenleiadd",
            },
            {
                label: "分类查询",
                to: "/admin/xinwenfenlei",
            },
            {
                label: "新闻添加",
                to: "/admin/xinwenxinxiadd",
            },
            {
                label: "新闻查询",
                to: "/admin/xinwenxinxi",
            },
        ],
    },

    {
        label: "系统管理",
        to: "",
        children: [
            {
                label: "轮播图添加",
                to: "/admin/lunbotuadd",
            },
            {
                label: "轮播图查询",
                to: "/admin/lunbotu",
            },

        ],
    },
];
