#Infinite loop to keep script running untill user stop  it forcefully 
while :
do
  #Printing options so that user can select to perform any operation from given option.
  echo -e "please select operation to perform by typing its number. \n1) Total Ram available.\n2) Total storage space available for a mount point.\n3) List top 5 processes for current user.\n4) List the ports exposed and the process associate with it.\n5) Free up cached memory.\n6) List the files with their size in (MBs), sorted in descending order.\n7) List the Folders with their size in (MBs), Sorted descending order.\n8) Exit."

  #Variable to take input.
  read number

  #Switch case to run command accordingly and validate input
  case $number in
   1)
    echo "Total Ram available."
    grep MemTotal /proc/meminfo
    ;;
   2)
    echo "Total storage space available."
    df -h /dev/xvda1
    ;;
   3)
    echo "List top 5 processes for current user."
    ps -u ubuntu | head -n 6
    ;;
   4)
    echo "List the ports exposed and the process associate with it."
    sudo netstat -tulpn
    ;;
   5)
    echo "Free up cached memory."
    echo "Before Clearing cache."
    free
    sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches'
    echo "After Clearing cache."
    free
    ;;
   6)
    echo "List the files with their size in (MBs), sorted in descending order."
    ls -hsp | grep -v / | grep -v total | sort -nr
    ;;
   7)
    echo "List the Folders with their size in (MBs), Sorted descending order."
    ls -hsd */ | sort -nr
    ;;
   8)
    break
    ;;
   *)
    echo "Invalid input, please try again."
    ;;
  esac
done
