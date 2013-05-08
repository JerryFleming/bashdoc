select fname in *;
do
    echo you picked $fname \($REPLY\)
    break;
done
