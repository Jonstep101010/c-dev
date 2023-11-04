#ifdef TEST

#include "unity.h"

#include "../src/file.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_file_tobetested(void)
{
    TEST_ASSERT_EQUAL_STRING(tobetested(), "whatever he said\n");
}

#endif // TEST
