vim.api.nvim_create_user_command('UpLoadToPicBed', function(opts)
  local raw_path = vim.fn.expand(opts.args)

  -- 精准路径转换器（修复大小写问题）
  local function convert_path(s)
    return s
    -- 处理盘符（强制小写）
    :gsub("^([A-Z]):", function(m)
      return "/mnt/"..m:lower().."/"  -- 关键修复：盘符部分强制小写
    end)
    -- 用户目录分割（保留原始大小写）
    :gsub("Users(%l+)", "Users/%1")
    -- 系统目录处理（精确匹配）
    :gsub("AppData", "/AppData")
    :gsub("Local", "/Local")
    :gsub("Programs", "/Programs")
    :gsub("PixPin", "/PixPin")
    :gsub("Temp", "/Temp")
    -- 统一路径分隔符
    :gsub([[\]], '/')
    :gsub("//+", '/')
    -- 清理末尾斜杠
    :gsub("/$", "")
  end

  -- 执行转换
  local wsl_path = convert_path(raw_path)

  -- 上传逻辑
  if vim.fn.filereadable(wsl_path) == 1 then
    local output = vim.fn.system("picgo upload "..vim.fn.shellescape(wsl_path))
    local url = output:match("https?://[%w-_./]+%.jpe?g")
    if url then
      -- 提取文件名（带扩展名）
      local filename = wsl_path:match(".+/([^/]+)$") or "image.jpg"
      -- 构建指定格式的Markdown链接
      local markdown_url = "![](https://raw.githubusercontent.com/YLShiJustFly/picturebed/main/images"..filename..")"

      vim.fn.setreg('+', markdown_url)
      print("upload success! url:"..markdown_url)
      return
    end
  end
end, { nargs = 1 })
