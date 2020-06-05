ROS_DISTRO=$1
echo "["
cd /opt/ros/$ROS_DISTRO/include && grep -r '^ *# *include' * | grep /detail/  | grep -v _rosidl_ |  egrep -v "/detail/.*:" | perl -nle 'm/^([^:]+).*["<]([^>]+)[">]/ && print qq@    { include: ["<$2>", private, "<$1>", public ] },@' 
cd /opt/ros/$ROS_DISTRO/include && grep -r '^ *# *include' * | grep /detail/  | grep -v _rosidl_ |  egrep -v "/detail/.*:" | perl -nle 'm/^([^:]+).*["<]([^>]+)[">]/ && print qq@    { include: ["\\"$2\\"", private, "\\"$1\\"", public ] },@'  
# cd /opt/ros/foxy/include && grep -r '^ *# *include' . | perl -nle 'm/^([^:]+).*["<]([^>]+)[">]/ && print qq@    { include: ["<$2>", private, "<$1>", public ] },@' | grep -e \/detail\/ -e \/impl\/ | grep -e \\[\"\<boost/ | sort -u
echo "]"    
