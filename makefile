all: pkcs11test
test: pkcs11test
	./pkcs11test

GTEST_DIR=gtest-1.6.0
GTEST_INCS=-I$(GTEST_DIR)/include -I$(GTEST_DIR)
OBJECTS=pkcs11test.o

pkcs11test: $(OBJECTS) libgtest.a
	$(CXX) -g $(GTEST_INCS) -o $@ $(OBJECTS) -I ../chaps/pkcs11 -ldl libgtest.a -lpthread

gtest-all.o:
	$(CXX) -I$(GTEST_DIR)/include -I$(GTEST_DIR) -c ${GTEST_DIR}/src/gtest-all.cc
libgtest.a: gtest-all.o
	$(AR) -rv libgtest.a gtest-all.o

clean:
	rm -rf pkcs11test $(OBJECTS) gtest-all.o libgtest.a