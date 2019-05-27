#include<stdint.h>
#include<stdio.h>
#include<string.h>
#include "../indexed_skiplist/indexed_skiplist.h"
#include "../indexed_skiplist/indexed_skiplist_long_int.h"
#include "skiplist_batch_test.h"

#define VIEW_PROGRESS  

#define READ 0
#define WRITE 1
#define DELETE 2
#define FAILURE 0
#define SUCCESS 1

const char * sbt_operation_sequence_fname_parameter = "--sbt_operation_sequence_fname";

int skiplist_batch_test(int argc, char** argv){
  int64_t g, i, type, num_operations, max_key, capacity, max_load, deletions_enabled;
  int64_t num_anomalies, num_trials;
  int64_t * operation, * key, * status, * result, * val;
  char fname[200];
  FILE * fp;
  for(i=1; i<argc; i++){
    if(strcmp(argv[i], sbt_operation_sequence_fname_parameter)==0){
      if(i+1 < argc){
        strcpy(fname, &argv[++i][0]);
      }
    }
  }
  fp = fopen(fname, "r");
  if(fp==NULL){
    fprintf(stderr, "Could not open %s\n", fname);
    exit(EXIT_FAILURE);
  }
  fscanf(fp, "%ld\n", &type);
  if(type == 0){
    printf("Artificial feedback detected\n");
  }
  fscanf(fp, "%ld\n", &num_operations);
  fscanf(fp, "%ld\n", &max_key);
  fscanf(fp, "%ld\n", &capacity);
  fscanf(fp, "%ld\n", &max_load);
  fscanf(fp, "%ld\n", &deletions_enabled);
  printf("%ld %ld %ld %ld\n", num_operations, max_key, capacity, max_load);
  operation = calloc(num_operations, sizeof(int64_t));
  key = calloc(num_operations, sizeof(int64_t));
  status = calloc(num_operations, sizeof(int64_t));
  result = calloc(num_operations, sizeof(int64_t));
  for(g=0; g<num_operations; g++){
    fscanf(fp, "%ld %ld %ld\n", &operation[g], &key[g], &status[g]);
  }
  fclose(fp);
  //for(g=0; g<num_operations; g++){
  //  printf("%ld %ld %ld %ld\n", g, operation[g], key[g], status[g]);
  //}
  initialize_skiplist_long_int();
  #ifdef VIEW_PROGRESS
    printf("Starting trials\n");
  #endif
  for(g=0; g<num_operations; g++){
    #ifdef VIEW_PROGRESS
      printf("Performing operation: %ld %ld %ld %ld\n", g, operation[g], key[g], status[g]);
    #endif
    switch(operation[g]){
      case READ:
        val = skiplist_read_long_int(&key[g]);
        if(val == NULL){
          result[g] = FAILURE;
        } else {
          result[g] = SUCCESS;
        }
        break;
      case WRITE:
        val = skiplist_write_long_int(&key[g], &key[g]);
        if(val == NULL){
          result[g] = FAILURE;
        } else {
          result[g] = SUCCESS;
        }
        break;
      case DELETE:
        val = skiplist_delete_long_int(&key[g]);
        if(val == NULL){
          result[g] = FAILURE;
        } else {
          result[g] = SUCCESS;
        }
        break;
      default:
        printf("bad operation: %ld %ld\n", g, operation[g]);
        exit(1);
        break;
    }
    #ifdef VIEW_PROGRESS
      if(status[g] != result[g]){
        printf("Anomaly found after operation %ld\n", g);
      }
      /*
      else {
        printf("Operation %d successful\n", g);
      }
      printf("skiplist_dump: ");
      skiplist_full_dump();
      */
    #endif
  }
  num_anomalies = num_trials = 0;
  for(g=0; g<num_operations; g++){
    printf("%ld %ld %ld %ld %ld\n", g, operation[g], key[g], status[g], result[g]);
    if(status[g]!=result[g]){
      num_anomalies++;
    }
    num_trials++;
  }
  printf("trials: %ld  anomalies: %ld\n", num_trials, num_anomalies);
}
