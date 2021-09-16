#include <stdio.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>

int main (int argc, char *argv[]){


int sock01;
int conn;
int port;
int init = 1;
int final = 65535;
char *dest;
dest = argv[1];

        struct sockaddr_in target;


        for(port=init;port<=final;port++){
        sock01 = socket(AF_INET,SOCK_STREAM,0); //0 indica o protocolo ip
        target.sin_family = AF_INET;
        target.sin_port = htons(port);
        target.sin_addr.s_addr = inet_addr(dest);

        conn = connect(sock01, (struct sockaddr *)&target, sizeof target);

        if(conn == 0){

        printf("Porta %d: aberta! :)~ \n",port);
        close(sock01);
        close(conn);

        }else{

        close(sock01);
        close(conn);

        }

}
}
