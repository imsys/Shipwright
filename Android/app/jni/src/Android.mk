PROJECT_ROOT := $(call my-dir)/../../../../

LOCAL_PATH := $(PROJECT_ROOT)/soh

WARN := \
	-Wno-return-type \
	-Wno-unused-command-line-argument \
	-Wno-implicit-function-declaration \
	-Wno-c++11-narrowing \
	-funsigned-char \
	-fno-stack-protector -fno-common -fno-zero-initialized-in-bss -fno-strict-aliasing -fno-inline-functions -fno-inline-small-functions -ffreestanding -fwrapv \



include $(CLEAR_VARS)

LOCAL_MODULE := main

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/. \
	$(LOCAL_PATH)/assets \
	$(LOCAL_PATH)/build \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/src \
	$(PROJECT_ROOT)/ZAPDTR/ZAPDUtils \
	$(PROJECT_ROOT)/libultraship/libultraship \
	$(PROJECT_ROOT)/libultraship/libultraship/Lib/spdlog/include \
	$(PROJECT_ROOT)/libultraship/libultraship/Lib/Fast3D/U64 \
	$(PROJECT_ROOT)/libultraship/libultraship/Lib/Fast3D/U64/PR \

# Add your application source files here...
LOCAL_SRC_FILES := \
	$(shell find $(LOCAL_PATH)/soh -type f -name "*.cpp") \
	$(shell find $(LOCAL_PATH)/soh -type f -name "*.c") \
	$(shell find $(LOCAL_PATH)/src/boot -type f -name "*.c") \
	$(shell find $(LOCAL_PATH)/src/buffers -type f -name "*.c") \
	$(shell find $(LOCAL_PATH)/src/code -type f -name "*.c") \
	$(shell find $(LOCAL_PATH)/src/overlays -type f -name "*.c") \
	src/libultra/gu/coss.c \
	src/libultra/gu/guLookAt.c \
	src/libultra/gu/guLookAtHilite.c \
	src/libultra/gu/guPerspectiveF.c \
	src/libultra/gu/guPosition.c \
	src/libultra/gu/guS2DInitBg.c \
	src/libultra/gu/ortho.c \
	src/libultra/gu/rotate.c \
	src/libultra/gu/sins.c \
	src/libultra/gu/sintable.c \
	src/libultra/libc/sprintf.c

#LOCAL_SHARED_LIBRARIES := libultraship ZAPDUtils libstorm bz2 pthread
LOCAL_SHARED_LIBRARIES := libultraship ZAPDUtils libstorm

LOCAL_CFLAGS := $(WARN) -D_GNU_SOURCE -no-pie -nostdlib

LOCAL_CPPFLAGS := $(WARN) -D_GNU_SOURCE -fpermissive -no-pie -nostdlib

LOCAL_LDLIBS := $(addprefix -l, \
	dl \
	z \
	log \
	android \
	GLESv1_CM \
	GLESv2 \
	OpenSLES \
)

include $(BUILD_SHARED_LIBRARY)


#####
##  libultraship
#####

LOCAL_PATH := $(PROJECT_ROOT)/libultraship

include $(CLEAR_VARS)
LOCAL_PATH := $(PROJECT_ROOT)/libultraship
LOCAL_MODULE := libultraship

LOCAL_C_INCLUDES := $$(PROJECT_ROOT)/Android/app/jni/SDL/include \
	$(PROJECT_ROOT)/ZAPDTR/ZAPDUtils \
	$(PROJECT_ROOT)/libultraship/Lib/Fast3D/U64 \
	$(PROJECT_ROOT)/libultraship/Lib/spdlog \
	$(PROJECT_ROOT)/libultraship/Lib/spdlog/include \
	$(PROJECT_ROOT)/libultraship/Lib/ImGui \
	$(PROJECT_ROOT)/libultraship/Lib/Mercury \
	$(PROJECT_ROOT)/libultraship \
	$(PROJECT_ROOT)/StormLib/src

LOCAL_SRC_FILES := \
	$(shell find $(PROJECT_ROOT)/libultraship/libultraship/Factories -name "*.cpp") \
	$(shell find $(PROJECT_ROOT)/libultraship/libultraship/Lib/Fast3D -name "*.cpp") \
	$(shell find $(PROJECT_ROOT)/libultraship/libultraship -maxdepth 1 -name "*.cpp") \
	$(shell find $(PROJECT_ROOT)/libultraship/libultraship/Lib/ImGui -maxdepth 1 -name "*.cpp") \
	$(shell find $(PROJECT_ROOT)/libultraship/libultraship/Lib/Mercury -maxdepth 1 -name "*.cpp") \
	$(PROJECT_ROOT)/libultraship/libultraship/Lib/ImGui/backends/imgui_impl_opengl3.cpp \
	$(PROJECT_ROOT)/libultraship/libultraship/Lib/ImGui/backends/imgui_impl_sdl.cpp \
	$(PROJECT_ROOT)/libultraship/libultraship/Lib/StrHash64.cpp \
	$(PROJECT_ROOT)/libultraship/libultraship/Lib/tinyxml2/tinyxml2.cpp \
	$(PROJECT_ROOT)/libultraship/libultraship/mixer.c \
	$(PROJECT_ROOT)/libultraship/libultraship/Lib/stb/stb_impl.c

LOCAL_SHARED_LIBRARIES := SDL2
LOCAL_LDLIBS := -lGLESv1_CM -lGLESv2 -lOpenSLES -llog -landroid

include $(BUILD_SHARED_LIBRARY)

#####
##  ZAPDUtils
#####

LOCAL_PATH := $(PROJECT_ROOT)/ZAPDTR/ZAPDUtils
include $(CLEAR_VARS)
LOCAL_MODULE := ZAPDUtils

SRC_DIRS  := $(shell find . -type d -not -path "*build*")

LOCAL_SRC_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.cpp))
LOCAL_C_INCLUDES := $(SRC_DIRS)

include $(BUILD_SHARED_LIBRARY)


#####
##  libstorm
#####
LOCAL_PATH := $(PROJECT_ROOT)/StormLib
include $(CLEAR_VARS)
LOCAL_MODULE := libstorm
include $(BUILD_SHARED_LIBRARY)
