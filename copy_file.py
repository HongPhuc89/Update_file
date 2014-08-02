import shutil   #lib copy file
import os       #system lib

src_path        = '1.txt'
des_path        = '2.txt'
delay_time      = 0.3
statinfo_src = os.stat(src_path)
statinfo_des = os.stat(des_path)
if statinfo_src.st_mtime < statinfo_des.st_mtime+0.3:
    print 'Same file'
else:
    print 'Copy file'
    print statinfo_des.st_mtime
    print statinfo_src.st_mtime
    shutil.copy2(src_path,des_path)

