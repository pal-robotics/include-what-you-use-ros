ROS_DISTRO=$1
# Looks for headers that include internal headers, and writes mappings to avoid using internal headers
cd /opt/ros/$1/include && grep -r '^ *# *include' * | grep /detail/  | grep -v _rosidl_ |  egrep -v "/detail/.*:" | perl -nle 'm/^([^:]+).*["<]([^>]+)[">]/ && print qq@    { include: ["<$2>", private, "<$1>", public ] },@' 
