# vim:filetype=readline
#
# 本文件控制所有使用 readline 库的程序的行输入行为。
# 这些程序包括 FTP，Bash 和 GDB。
#
# 可以用 C-x C-r 命令重新加载该文件。
# 以 '#' 开头的行是注释。
#
# 首先，包含 /etc/Inputrc 中的任何系统绑定和变量。
$include /etc/Inputrc
#
# 设置 emacs 风格的绑定。
set editing-mode emacs

$if mode=emacs
Meta-Control-h:  backward-kill-word 命令后面的文本会被忽略掉
#
# 小键盘上的方向键
#
#"\M-OD":        backward-char
#"\M-OC":        forward-char
#"\M-OA":        previous-history
#"\M-OB":        next-history
#
# ANSI 模式的方向键
#
"\M-[D":        backward-char
"\M-[C":        forward-char
"\M-[A":        previous-history
"\M-[B":        next-history
#
# 八位小键盘上的方向键
#
#"\M-\C-OD":       backward-char
#"\M-\C-OC":       forward-char
#"\M-\C-OA":       previous-history
#"\M-\C-OB":       next-history
#
# 八位 ANSI 模式的方向键
#
#"\M-\C-[D":       backward-char
#"\M-\C-[C":       forward-char
#"\M-\C-[A":       previous-history
#"\M-\C-[B":       next-history
C-q: quoted-insert
$endif

# 旧式的绑定。这恰好也是默认的。
TAB: complete
# 便于 shell 交互的宏。

$if Bash
# 编辑 PATH 路径
"\C-xp": "PATH=${PATH}\e\C-e\C-a\ef\C-f"
# 准备输入引用的单词：插入引号的开始和结束，然后移到开始引号的后面。
"\C-x\"": "\"\"\C-b"
# 插入反斜杠（测试反斜杠转义序列和宏）。
"\C-x\\": "\\"
# 用引号引用当前或前一个单词。
"\C-xq": "\eb\"\ef\""
# 绑定刷新本行的命令；这原来是没有绑定的。
"\C-xr": redraw-current-line
# 编辑本行中的变量。
"\M-\C-v": "\C-a\C-k$\C-y\M-\C-e\C-a\C-y="
$endif

# 如果可以响铃就使用
set bell-style visible
# 读取输入时不要把字符截成 7 位。
set input-meta on
# 允许插入 iso-latin1 字符，而不是把它们变成 Meta 化的序列。
set convert-meta off
# 直接显示八位的字符，而不是把它们当成 Meta 化的字符来显示。
set output-meta on
# 如果可以补全的项目超过 150 条，询问用户是否要显示全部。
set completion-query-items 150

# 用于 FTP
$if Ftp
"\C-xg": "get \M-?"
"\C-xt": "put \M-?"
"\M-.": yank-last-arg
$endif
