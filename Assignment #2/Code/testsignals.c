#include "user.h"

int finish;
int numOfProcess;
int num = 1;

void test2handler(int pid, int value){
	printf(1, "test fail: after exec() defult handler%d\n",value,pid);
	finish = 0;
}

void test1handler(int pid, int value){
  //pid should be the right one
	int mypid = getpid();
	finish = 0;
	if( value == mypid ){
	  printf(1, "test passed: got value: %d and its equal to getpid() value: %d\n",value,mypid);
	  return;
	}
       
	printf(1, "test fail: got value: %d and its not equal to getpid() value: %d\n",value,mypid);
	return;
}

void test3handler(int pid, int value){
  //pid should be the right one
	int mypid = getpid();
	finish = 0;
	if( value == mypid ){
	  printf(1, "test passed: got value: %d  from %d and its equal to getpid() value: %d\n",value,pid,mypid);
	  return;
	}
       
	printf(1, "test fail: got value: %d and its not equal to getpid() value: %d\n",value,mypid);
	return;
}

void test0(){
	int processtable[10];
	int i;
	for (i = 0; i < numOfProcess; i++){
	  processtable[i] = fork();
	  if (processtable[i] == 0) { // child code
	     sleep(50);
	     exit(num);
	   } else { // father code
             sigsend(processtable[i], 1);
	     wait(&num);
           }
	}
        return;
}

void test1(){
	sigset((sig_handler)&test1handler);


    int processtable[10];
	int i;
	for (i = 0; i < numOfProcess; i++){
	  finish=1;
	  processtable[i] = fork();
	  if (processtable[i] == 0) { // child code
          while(finish){

             sleep(50);

         }

          exit(num);
	   } else { // father code
          sleep(16);
          sigsend(processtable[i], processtable[i]);
          wait(&num);
           }
	}// end of for
        return;
}

void test2(){
	sigset((sig_handler)&test2handler);
	int pid = fork();
	char *argv[2];
	argv[0] = "echo";
        argv[1] = "test passed: exec() set defult handler";
	if(pid==0){
	  exec("echo",argv);
	} else {
		sigsend(pid, 0);
	  wait(&num);
	}
	return;
}

void test3(){
	sigset((sig_handler)&test3handler);
	int processtable[10];
	int i;
	for (i = 0; i < numOfProcess; i++){
	  finish=1;
	  processtable[i] = fork();
	  if (processtable[i] == 0) { // child code
             if(i>0){
	       sigsend(processtable[i-1], processtable[i-1]);
	     }else{
                 sigsend(processtable[i], processtable[i]);

             }
	     while(finish){
	     	sleep(20);
             }
	     exit(num);
	   }
	}// end of for
	for (i = 0; i < numOfProcess-1; i++)
	  wait(&num);
        return;
}


int main(int argc, char *argv[]) {
	if(argc != 2){
          printf(1, "error argc is :%d instead of 2\n",argc);
	  exit(num);
	}
        numOfProcess = atoi(argv[1]);

        printf(1, "test 0: create %d process without sigset - should not print noting - defult handler\n",numOfProcess);
        test0();
//
        printf(1, "test 1: create %d process with fork() and send the pid to the process with sigsend systemcall\n",numOfProcess);
        test1();

        printf(1, "test 2: create process and then use exec()\n",numOfProcess);
        test2();

	printf(1, "test 3: create %d process with fork(), each process i send to i-1 hes pid\n",numOfProcess);
        test3();
	

	printf(1, "test finished\n");
	exit(num);
	
}
