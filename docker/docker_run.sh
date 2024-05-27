if [ -z "$SUDO_USER" ]
then
      user=$USER
else
      user=$SUDO_USER
fi

# xhost +local:root
# XAUTH=/tmp/.docker.xauth
# if [ ! -f $XAUTH ]
# then
#     xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
#     if [ ! -z "$xauth_list" ]
#     then
#         echo $xauth_list | xauth -f $XAUTH nmerge -
#     else
#         touch $XAUTH
#     fi
#     chmod a+r $XAUTH
# fi

WS_MOUNT="$PWD"; [ "$PWD" = "/" ] && WS_MOUNT=""

WS_MOUNT=$WS_MOUNT/../ws
echo $WS_MOUNT

docker run -it \
	--name=humble_docker \
	--privileged \
	--shm-size=1g \
	--ulimit memlock=-1 \
	--mount source=$WS_MOUNT,target=/home/user/ws,type=bind \
	--volume=/dev/bus/usb:/dev/bus/usb \
	--volume=/dev/ttyUSB0:/dev/ttyUSB0 \
	-v /dev/shm:/dev/shm \
    --network=host \
	--ipc=host \
	--pid=host \
	-e RMW_IMPLEMENTATION=rmw_fastrtps_cpp \
	humble_base \
	bash