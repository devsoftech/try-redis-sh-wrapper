echo "Press ctrl+c to exit anytime"
sessionvariable=$RANDOM
exitcommand="exit"

while true; do
    read -p "redis> " rediscommand
    if [ "$rediscommand" == "$exitcommand" ]; then
        break
    else
        rediscommand=`echo "$rediscommand"  | sed 's/ /+/g'`
        curl "http://try.redis.io/eval?command=$rediscommand&session_id=$sessionvariable"
        echo '\n'
    fi
done
