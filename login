
##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if $status == 1 then
    set path = ( "usr/local/bin" $path )
endif

screen -a -A -R -q -t `hostname | awk -F. '{print $1}' ` -S $USER
