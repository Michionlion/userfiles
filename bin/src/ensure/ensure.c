#include <stdlib.h>
#include <stdio.h>
#include <dirent.h>
#include <string.h>
#include <stdbool.h>
#include <errno.h>

void doIO(char* name);
void doEnsure(char* repo);

int main(int argc, char** argv) {
    if(argc <= 1) {
        fprintf(stderr, "Useage: ensure [filename]\n");
        return 0;
    }

    doIO(argv[1]);

    return 0;
}

void doIO(char* name) {
    //printf("In: %s\n", name);

    DIR* parent = opendir(name);
    if(parent==NULL) {
        if(errno==20) return; //expected error not a directory
        fprintf(stderr, "Error: %d (%s)", errno, strerror(errno));
        return;
    }
    struct dirent* dir;
    while((dir = readdir(parent)) != NULL) {
        if(strcmp(dir->d_name, ".git") == 0) {
            //this is a git repo, so do op and return
            //fprintf(stdout, "%s is a git repo!\n", name);
            doEnsure(name);
            closedir(parent);
            return;
        }
    }

    int len = strlen(name);
    rewinddir(parent);
    while((dir = readdir(parent)) != NULL) {
        //skip . and .. and hidden files
        if(strncmp(dir->d_name, ".", 1)==0) continue;
        //printf("Name: %s/%s\n", name, dir->d_name);
        char* new_name = (char*) malloc(len + strlen(dir->d_name) + 2);
        new_name[0] = '\0';
        strcat(new_name, name);
        strcat(new_name, "/");
        strcat(new_name, dir->d_name);

        doIO(new_name);

        free(new_name);
    }
    closedir(parent);
}

void doEnsure(char* repo) {
    fprintf(stdout, "--- Processing %s ---\n", repo);

    int slen = strlen(repo) + 9;
    char* start = (char*) malloc(slen);
    start[0] = '\0'; //ensure empty string
    strcat(start, "git -C ");
    strcat(start, repo);
    strcat(start, " ");


    char* command = (char*) malloc(slen+6);
    command[0] = '\0';
    strcat(command, start);
    strcat(command, "status");

    system(command);
    free(command);

    command = (char*) malloc(slen+4);
    command[0] = '\0';
    strcat(command, start);
    strcat(command, "pull");

    system(command);
    free(command);

    fprintf(stdout, "\n");
    free(start);
}
