#!/bin/bash

if [ -z $1 ]; then
     echo add filename in script args
     exit 1
else
     OUTPUT_FILE_NAME_STRING=`cat ./$1 | grep "//#output" -m 1`
     
     
     if [ $? -eq 0 ]; then
        
        OUTPUT_FILE_NAME_WITH_WHITESPACE=${OUTPUT_FILE_NAME_STRING#*//#output}
        
        OUTPUT_FILE_NAME=`echo $OUTPUT_FILE_NAME_WITH_WHITESPACE | tr -d '[:space:]'`
        echo $OUTPUT_FILE_NAME
        
        if [ -z $OUTPUT_FILE_NAME ]; then
            echo enter valid output filename in source file
            exit 1
           
        else
            TEMPFOLDER_PATH=`mktemp -d`
            
            trap "rm -Rf $TEMPFOLDER_PATH; exit 1" SIGKILL SIGINT SIGHUP SIGTERM

            cp $1 $TEMPFOLDER_PATH/
            
            CURRENT_DIR=$(pwd)
            
            cd $TEMPFOLDER_PATH
            
            gcc $1 -o $OUTPUT_FILE_NAME
            
            if [ $? -eq 0 ]; then
            
            mv $OUTPUT_FILE_NAME "$CURRENT_DIR"
            
            cd "$CURRENT_DIR"
            
            rm -Rf $TEMPFOLDER_PATH
            
            chmod u+x $OUTPUT_FILE_NAME
            
            echo $OUTPUT_FILE_NAME - build file name
            
            else
                echo compilation failed
                cd "$CURRENT_DIR"
                rm -Rf $TEMPFOLDER_PATH
                exit 1
            fi
        fi
        
    else
        echo 'enter existing file name or write //#output name - in file content' 
        exit 1
    fi
     
fi
exit 0
