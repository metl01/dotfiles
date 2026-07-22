#!/bin/sh

data=$(curl -s "wttr.in/?format=%C|%t")

condition=${data%|*}
temp=${data#*|}

condition_lc=$(printf "%s" "$condition" | tr '[:upper:]' '[:lower:]')

case "$condition_lc" in
    *mostly*sunny*) icon=$(printf '\ue302') ;;
    *partly*cloud*) icon=$(printf '\ue302') ;;
    *intervals*cloud*) icon=$(printf '\ue302') ;;

    *sunny*) icon=$(printf '\ue30d') ;;
    *clear*) icon=$(printf '\U000f0594') ;;

    *overcast*|*cloud*) icon=$(printf '\ue312') ;;

    *thunder*|*storm*|*thundery*) icon=$(printf '\ue31d') ;;

    *rain*|*drizzle*|*shower*|*patchy*rain*) icon=$(printf '\ue318') ;;

    *snow*|*blizzard*|*sleet*|*ice*|*freezing*|*patchy*snow*) icon=$(printf '\ue31a') ;;

    *fog*|*mist*|*haze*) icon=$(printf '\ue313') ;;

    *wind*) icon=$(printf '\ue27e') ;;

    *) icon=$(printf '\U000f18f6') ;;
esac

echo "$icon  $temp"

