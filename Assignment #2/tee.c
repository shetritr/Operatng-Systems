//
// Created by shetritr on 13/11/18.
//
#include "types.h"
#include "user.h"
#include "fcntl.h"



int dest,src,read_status,write_status;
char buff[512];

int
main(int argc, char *argv[]){
//    if (argc == 2){
//        gets(buff,512);
//        printf(2,"\n");
//        dest=open(argv[1], O_CREATE | O_RDWR);
//        if (dest < 0 ){
//            printf(2,"tee failed : destination file not found");
//            exit(0);
//        }
//
//        write_status=write(dest,buff,sizeof(char)*strlen(buff));
//
//        if (write_status < 0 ) {
//            printf(2, "tee failed : destination file not writable");
//            exit(0);
//        }
//        printf(2,buff);
//
//    }else if (argc == 3){
//        src = open(argv[1], O_CREATE | O_RDWR);
//        if (src < 0 ) {
//            printf(2, "tee failed : source file not found");
//            exit(0);
//        }
//        read_status=read(src,buff,sizeof(char)*512);
//        if (read_status < 0 ) {
//            printf(2, "tee failed : source file not readable");
//            exit(0);
//        }
//        dest=open(argv[2], O_CREATE | O_RDWR);
//        if (dest < 0 ) {
//            printf(2, "tee failed : destination file not found");
//            exit(0);
//        }
//
//        write_status=write(dest,buff,sizeof(char)*strlen(buff));
//        if (write_status < 0 ) {
//            printf(2, "tee failed : destination file not writable");
//            exit(0);
//        }
//
//    }else {
//        printf(2, "tee failed : support only 1 or 2 arguments");
//        exit(0);
//    }
//    printf(2,"Writing successful :-) \n");

    exit(0);
}