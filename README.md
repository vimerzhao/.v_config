# 个人配置
vimer's config file set

## Vim

安装好spf13-vim后，直接创建软链接：

```
ln -s `pwd`/vimrc ~/.vimrc.local
```

## Tmux
安装好`gpakosz/.tmux`后，直接把自定义配置添加在最后：

```
echo "source-file `pwd`/tmux.conf" >> ~/.tmux.conf.local
```

然后重启终端。

## Zsh

### 主题魔改
* 修改位置：`~/.oh-my-zsh/themes/agnoster.zsh-theme`
* 首先注释掉 `prompt_context` 里面的逻辑，开头就不显示 `用户名@主机名`
* 末尾添加`RPROMPT='[%D{%H:%M:%S}]'`，命令结尾显示时间

TODO：如果修改点太多应该自己维护一个主题。
