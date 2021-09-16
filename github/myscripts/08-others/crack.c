#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define BUFF 25

int main(int argc, char *argv[]) {
	FILE *arq;
	arq = fopen(argv[1],"r");
	
	char senha[BUFF + 25];
	char comp[BUFF + 75];
	char *result;
	char salt[BUFF];

	printf("Digite a Hash: ");
	scanf("%s",&comp);
	printf("Digite o Salt: ");
	scanf("%s",&salt);

	int test = 0;

	while(fscanf(arq, "%s", &senha) != EOF) {
		result = (char *) crypt(senha,salt);
		if (strcmp(comp,result)==0) {
			printf("Senha Encontrada: %s \n",senha);
			test=1;
			return(0);
		} else {
			test=0;
		}
	}
	if (test == 0) {
		printf("Unhash Fail!\n");
	}
}
