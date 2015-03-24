
git clone https://github.com/Gingonic/ucloud-init.git && \
   cd ucloud-init && \
   ./build.sh && \
   mkdir /opt/bin && \
   cp binaries/* /opt/bin/ && \
   ./configure $1 $2 $3


