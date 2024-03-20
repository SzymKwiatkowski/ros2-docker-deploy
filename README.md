# Deploy notes

To setup environment after docker installation run:
```bash
bash setup.bash
```

Afterwards run:
- `bash docker/docker_run.sh`
- `bash docker/docker_attach.sh`

## Configuration overview
As container base image ros2 humble was used by default `root` user is the one to be used but there is also a second registered user with name of `pi` to be used.

---
Container is using:
- `RMW_IMPLEMENTATION=rmw_fastrtps_cpp` as default dds implementation
- `ROS_DOMAIN_ID=21` as default domain id for network

If there is a need to test connection in a very simple way both of environment variables should be set accordingly and then connection can be verified by running:
```bash
# Run it on client side
ros2 multicast receive

# Run it on server side
ros2 multicast send
```
If there is going to be a hello world prompt connection should be just fine.

### Additional info
If getting warning about locale run:
```bash
sudo dpkg-reconfigure locales
```
