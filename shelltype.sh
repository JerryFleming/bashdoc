# 第一种方法
case "$-" in
    *i*)
        echo 这个是交互式的 shell。
        ;;
    *)
        echo 这个不是交互式的 shell。
        ;;
esac

# 第二种方法
if [ -z "$PS1" ]; then
    echo 这个不是交互式的 shell。
else
    echo 这个是交互式的 shell。
fi
