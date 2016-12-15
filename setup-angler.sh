#!/bin/bash

adb root
adb push images/angler/fuzzer /data/local/tmp/fuzzer
adb push images/angler/vts_hal_agent /data/local/tmp/vts_hal_agent
adb shell mkdir /data/local/tmp/lib
adb push images/angler/libvts_common32.so /data/local/tmp/lib/libvts_common.so
adb push images/angler/libvts_common.so /data/local/tmp/libvts_common.so
adb push images/angler/libvts_interfacespecification32.so /data/local/tmp/lib/libvts_interfacespecification.so
adb push images/angler/libvts_interfacespecification.so /data/local/tmp/libvts_interfacespecification.so
adb push images/angler/libvts_datatype32.so /data/local/tmp/lib/libvts_datatype.so
adb push images/angler/libvts_datatype.so /data/local/tmp/libvts_datatype.so

adb shell mkdir /data/local/tmp/spec
adb push sysfuzzer/libinterfacespecification/specification/CameraHalV1.vts /data/local/tmp/spec/CameraHalV1.vts
adb push sysfuzzer/libinterfacespecification/specification/GpsHalV1.vts /data/local/tmp/spec/GpsHalV1.vts
adb push sysfuzzer/libinterfacespecification/specification/GpsHalV1GpsInterface.vts /data/local/tmp/spec/GpsHalV1GpsInterface.vts
adb push sysfuzzer/libinterfacespecification/specification/LightHalV1.vts /data/local/tmp/spec/LightHalV1.vts

adb shell chmod 755 /data/local/tmp/fuzzer
adb shell chmod 755 /data/local/tmp/vts_hal_agent
adb shell killall vts_hal_agent
adb shell LD_LIBRARY_PATH=/data/local/tmp nohup /data/local/tmp/vts_hal_agent /data/local/tmp/fuzzer /data/local/tmp/spec
