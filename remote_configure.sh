#!/bin/bash
# 1. MASTER and MINION:      \033[1m1\033[0m"
# 2. only MASTER:                 \033[1m2\033[0m"
# 3. only MINION:                 \033[1m3\033[0m"

for i in $etcdIPs
do
    name="infra"$ii
    item="$name=http://$i:2380"
    if [ "$ii" == 1 ]; then
        echo "Master $i - $3"
        ssh nodeadmin@$3 "git clone https://github.com/Gingonic/ucloud-init.git && \
                            cd ucloud-init && \
                            sudo ./build.sh && \
                            sudo mkdir /opt/bin && \
                            sudo cp binaries/* /opt/bin && \
                            sudo ./configure.sh $2 $3 2"
    else
        echo "Minion $i - $3"
         ssh nodeadmin@$3 "git clone https://github.com/Gingonic/ucloud-init.git && \
                                    cd ucloud-init && \
                                    sudo ./build.sh && \
                                    sudo mkdir /opt/bin && \
                                    sudo cp binaries/* /opt/bin && \
                                    sudo ./configure.sh $2 $3 3"

    fi
    mm[$i]=$name
    let ii++
done
echo

