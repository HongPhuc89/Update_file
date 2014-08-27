# coding=utf-8
import time
import shutil   #lib copy file
import os       #system lib
import glob     #Search file
import sys      #System lib
####################################################################################################
#All function to update file anh dir
####################################################################################################
#copy file
fileCount = 0
def copy_file(src_path,des_path):
    global fileCount
    if sys.platform == 'linux':
        pass
        #from subprocess import call
        #call(['xcopy', src_path, des_path, '/K/O/X'])
    else:
        fileCount += 1
        shutil.copy2(src_path,des_path)

#copy if old file
def update_file(src_path,des_path):
    if os.path.isfile(des_path):
        delay_time      = 0.3
        statinfo_src = os.stat(src_path)
        statinfo_des = os.stat(des_path)
        if statinfo_src.st_mtime > statinfo_des.st_mtime+0.3:
            try:
                copy_file(src_path,des_path)
            except:
                print src_path
    else:
        copy_file(src_path,des_path)

#Creat new directory if not exist in destination
def new_dir(des_path):
    try:
        os.stat(des_path)
    except:
        os.makedirs(des_path)

#Get direction in des folder
def get_des_dir(src_path,des_path,file_path):
    return file_path.replace(src_path,des_path)
#get the extra name of file
def get_extra_name(file):
    return(file[file.find('.')+1:len(file)])
#check C file
def check_c_file(file):
    cFileExt = ['c','h','yml']
    readme  = 'readme.txt'
    if file.find(readme) > -1:
        return 1
    if get_extra_name(file) in cFileExt:
        return 1
    else:
        return 0

#search all find in folder
####################################################################################################
def update_folder(src_path,des_path):
    for root, dirs, files in os.walk(src_path):
        #copy folder
        #for dir in dirs:
        #    src_dir     = root+'/'+dir
        #    des_dir     = get_des_dir(src_path,des_path,src_dir)
        #    new_dir(des_dir)
        #copy file
        for file in files:
            if check_c_file(file) == 1:
                des_root    = get_des_dir(src_path,des_path,root)
                new_dir(des_root)
                src_file    = root+'/'+file
                des_file    = get_des_dir(src_path,des_path,src_file)
                update_file(src_file,des_file)

#main programme
start=time.time()

src_path        = ur"D:/C/sdk"
des_path        = ur"C:/Documents and Settings/Hong Phuc/Desktop/output/"
print "Copying file..."
update_folder(src_path,des_path)
finish          = time.time()
print "Copy",fileCount,"files to new folder"
print "Finished in:", int(finish-start),'s'
ch = raw_input('Press enter to exit')
