local load_core = function()
    --Packer插件管理
    require('plugins')
    --基础设置
    require('genaralmapping')
    --Packer插件配置
    require('config')
    require('scp')

end

load_core()
