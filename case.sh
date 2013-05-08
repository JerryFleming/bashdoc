echo -n "请输入一个动物的名称："
read ANIMAL
echo -n "$ANIMAL有"
case $ANIMAL in
    ( 马 | 狗 | 猫 ) echo -n "四";;
    人 | 袋鼠 ) echo -n "两";;
    *) echo -n "末知数目的";;
esac
echo "腿。"
