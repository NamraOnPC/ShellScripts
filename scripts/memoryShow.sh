//shows memory used by an application 

if [[ "${1}" = "" ]]; then
        echo "please add the name of the process as a parameter"
        exit 1
fi

for i in $(pidof $1); do echo $(awk '/Private/ {sum+=$2} END {print sum}' /proc/$i/smaps); done | awk '{sum+=$1} END {printf("%.2f MBytes\n", sum/1000)}'
