UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
	sdk_download_url := https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
endif
ifeq ($(UNAME), Darwin)
	sdk_download_url := https://dl.google.com/android/repository/commandlinetools-mac-8512546_latest.zip
endif

# Set SDK path in ANDROID_SDK_ROOT env variable, or run "make getSDK"

all:
	./gradlew build

.PHONY: getDeps getSDK

getDeps:
	git clone https://github.com/libsdl-org/SDL.git app/jni/SDL
	curl https://raw.githubusercontent.com/gradle/gradle/v7.5.0/gradle/wrapper/gradle-wrapper.jar -o gradle/wrapper/gradle-wrapper.jar

getSDK:
	curl $(sdk_download_url) | jar x
	mkdir -p SDK/cmdline-tools
	mv cmdline-tools SDK/cmdline-tools/latest
	export ANDROID_SDK_ROOT=$(shell pwd)/SDK
	chmod +x SDK/cmdline-tools/latest/bin/sdkmanager
	yes | SDK/cmdline-tools/latest/bin/sdkmanager --licenses
