#include <CustomMem.h>

void *CustMalloc(size_t size)
{
    return pvPortMalloc(size);
}
void Custfree(void *ptr)
{
    vPortFree(ptr);
}
void *CustCalloc(size_t nmemb, size_t size)
{
    size_t total_size = nmemb * size;
    void *ptr = pvPortMalloc(total_size);
    if (ptr != NULL)
    {
        memset(ptr, 0, total_size);
    }
    return ptr;
}

void *CustAlignMalloc(size_t size)
{
    void *ptr = NULL;
    void *aligned_ptr = NULL;
    size += CUSTOM_ALIGN; // - (size % CUSTOM_ALIGN);
    // Выделение памяти без выравнивания
    ptr = CustMalloc(size);
    if (ptr == NULL)
    {
        return NULL;
    }

    // Выравнивание адреса
    //  aligned_ptr = (void *)(((uintptr_t)ptr + (CUSTOM_ALIGN - 1)) & ~(uintptr_t)(CUSTOM_ALIGN - 1));
    while ((uintptr_t)ptr % 16 != 0)
    {
        ++ptr;
    }
    aligned_ptr = ptr;
    // Проверка, что выровненный адрес в пределах выделенной памяти
    if (aligned_ptr < ptr)
    {
        aligned_ptr += CUSTOM_ALIGN;
    }

    // Освобождение невыровненной памяти
    if (aligned_ptr != ptr)
    {
        Custfree(ptr);
    }

    return aligned_ptr;
}

void *CustAlignCalloc(size_t nmemb, size_t size)
{
    size_t total_size = nmemb * size;
    void *ptr = CustAlignMalloc(total_size);
    if (ptr != NULL)
    {
        memset(ptr, 0, total_size);
    }
    return ptr;
}
