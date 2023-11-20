#ifndef __CustomMem_h__
#define __CustomMem_h__
#include <stdlib.h>
#include <stdint.h>

#define CUSTOM_ALIGN 16

void* CustCalloc(size_t nmemb, size_t size);
void* CustMalloc(size_t size);
void Custfree(void *ptr);
void *CustAlignMalloc(size_t size);
void* CustAlignCalloc(size_t nmemb, size_t size);
#endif //__CustomMem_h__