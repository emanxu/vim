# 前言

这个配置是个人使用配置，欢迎参考，但是仅限个人使用，包含大量个性化设置，未必能开箱即用，大量内容学习自 [skywind3000](https://github.com/skywind3000/vim-init)：

- 本人主要开发语言为：C、go，少量 C++、js、python，更少量 Rust。
- 由于个人开发语言和经验的限制，配置主要针对个人使用，这里只是做记录。

# 安装

将项目克隆到你喜欢的目录内，比如 `~/.vim` 内：

```bash
mkdir -p ~/.vim && cd ~/.vim
git clone https://github.com/emanxu/vimrc.git
```

然后创建你的 `~/.vimrc` 文件，里面只有一句话：

```VimL
echo 'source ~/.vim/init.vim' | tee ~/.vimrc
```

请调整你的终端软件，确保对 ALT 键的支持，以及 Backspace 键发送正确扫描码（默认没有 source init/alt.vim）：

[终端软件下正确支持 ALT 键和 Backspace 键](https://github.com/skywind3000/vim-init/wiki/Setup-terminals-to-support-ALT-and-Backspace-correctly)

然后启动 Vim，在命令行运行 `:PlugInstall` 安装依赖插件即可。

# 结构

本配置按顺序，由如下几个主要模块组成：

- `init.vim`: 配置入口，设置 runtimepath 检测脚本路径，加载其他脚本，**配置加载的插件**也在这里。
- `basic.vim`: 基础配置。
- `plug.vim`: 插件，使用 vim-plug，按照设定的插件分组进行配置，init.vim 配置加载的插件。
- `style.vim`: 色彩主题，高亮优化，状态栏，更紧凑的标签栏文字等和显示相关的东西。
- `keymaps.vim`: 快捷键定义。

# 配置插件

```vim
" init.vim，如果你使用这个插件，标记为 1，否则为 0，如果你只需要简单的改改配置文件，可以直接使用 simple 分组。
" simple
" let g:bundle_enabled = {'simple': 1 }

" set to 1 to enable, set to 0 to disable
let g:bundle_enabled = {
                        \'basic': 1,
                        \'git': 1,
                        \'colors': 1,
                        \'color-tool': 1,
                        \'lsp': 1,
                        \'coc': 0,
                        \'snippet': 1,
                        \'ai': 0,
                        \'fzf': 1,
                        \'tags': 0,
                        \'opt': 1,
                        \'asynctasks': 1
                        \}
```

# 帮助

由于使用了很久，很多注释改动和删减了，详细可以观看 skywind3000 [init-keymaps.vim](https://github.com/skywind3000/vim-init/blob/master/init/init-keymaps.vim) 和 [init-plugins.vim](https://github.com/skywind3000/vim-init/blob/master/init/init-plugins.vim) 两个文件，每个点都写满了注释了（十分友好），也是未来你自己可能修改的最多的两个文件。每次你修改或者调试了单个 .vim 配置文件后，命令行输入 `:so %` 即可重新载入，so 是 `source` 的简写，意思是加载脚本，`%` 代表当前正在编辑脚本的名字。

# Credit

TODO
