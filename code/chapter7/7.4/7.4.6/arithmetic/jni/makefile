NDK_ROOT=D:/android-ndk-r8
TOOLCHAINS_ROOT=$(NDK_ROOT)/toolchains/arm-linux-androideabi-4.4.3/prebuilt/windows
TOOLCHAINS_PREFIX=$(TOOLCHAINS_ROOT)/bin/arm-linux-androideabi
TOOLCHAINS_INCLUDE=$(TOOLCHAINS_ROOT)/lib/gcc/arm-linux-androideabi/4.4.3/include-fixed

PLATFORM_ROOT=$(NDK_ROOT)/platforms/android-14/arch-arm
PLATFORM_INCLUDE=$(PLATFORM_ROOT)/usr/include
PLATFORM_LIB=$(PLATFORM_ROOT)/usr/lib
PATH_LIBGCC=$(TOOLCHAINS_ROOT)/lib/gcc/arm-linux-androideabi/4.4.3
MODULE_NAME=arithmetic
RM=del

FLAGS=-I$(TOOLCHAINS_INCLUDE) \
	-I$(PLATFORM_INCLUDE) \
	-L$(PLATFORM_LIB) \
	-nostdlib \
	-lgcc \
	-Bdynamic \
	-lc \
	
FLAGO0=-O0
FLAGO1=-O1
FLAGO2=-O2
FLAGO3=-O3
FLAGOs=-Os
OBJ0=$(MODULE_NAME)0.o
OBJ1=$(MODULE_NAME)1.o
OBJ2=$(MODULE_NAME)2.o
OBJ3=$(MODULE_NAME)3.o
OBJs=$(MODULE_NAME)s.o

OBJCRT=$(PLATFORM_LIB)/crtbegin_dynamic.o \
	$(PLATFORM_LIB)/crtend_android.o \
	$(PATH_LIBGCC)/libgcc.a

all:
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(FLAGO0) -c $(MODULE_NAME).c -o $(OBJ0)
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(OBJ0) $(OBJCRT) -o $(MODULE_NAME)0
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(FLAGO1) -c $(MODULE_NAME).c -o $(OBJ1)
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(OBJ1) $(OBJCRT) -o $(MODULE_NAME)1
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(FLAGO2) -c $(MODULE_NAME).c -o $(OBJ2)
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(OBJ2) $(OBJCRT) -o $(MODULE_NAME)2
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(FLAGO3) -c $(MODULE_NAME).c -o $(OBJ3)
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(OBJ3) $(OBJCRT) -o $(MODULE_NAME)3
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(FLAGOs) -c $(MODULE_NAME).c -o $(OBJs)
	$(TOOLCHAINS_PREFIX)-gcc $(FLAGS) $(OBJs) $(OBJCRT) -o $(MODULE_NAME)s
clean:
	$(RM) *.o
install:
	adb push $(MODULE_NAME)0 /data/local/
	adb push $(MODULE_NAME)1 /data/local/
	adb push $(MODULE_NAME)2 /data/local/
	adb push $(MODULE_NAME)3 /data/local/
	adb push $(MODULE_NAME)s /data/local/
	adb shell chmod 755 /data/local/$(MODULE_NAME)0
	adb shell chmod 755 /data/local/$(MODULE_NAME)1
	adb shell chmod 755 /data/local/$(MODULE_NAME)2
	adb shell chmod 755 /data/local/$(MODULE_NAME)3
	adb shell chmod 755 /data/local/$(MODULE_NAME)s
