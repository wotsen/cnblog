#include <gtest/gtest.h>
#include <iostream>

using namespace std;

TEST(TestAssert, running) {
  // PASS
}

int main(int argc, char ** argv)
{
  testing::InitGoogleTest(&argc, argv);

  return RUN_ALL_TESTS();
}