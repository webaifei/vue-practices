
module.exports = {
    title: "vue项目技术文档",
    description: "做一只不平凡的牛🐂",
    base: "/vue-practices/",
    themeConfig: {
        nav: [
            { text: 'Home', link: '/' },
            { text: '自定义UI组件', link: '/guide/' },
            { text: 'External', link: 'https://google.com' },
        ],
        sidebar: [
            {
                title: '主页',
                children: [
                    '/'
                ]
            },
            {
                title: 'UI',
                children: ['/UI/', '/UI/basic','/UI/component','/UI/layout']
            },
            {
                title: '其他',
                children: ['/others/log', '/others/webp', '/others/network', '/others/router']
            }
        ],
        lastUpdated: 'Last Updated',
    }
}
