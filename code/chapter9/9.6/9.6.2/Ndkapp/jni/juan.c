/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
#include <string.h>
#include <stdio.h>
#include <jni.h>
#include <android/log.h>
#include <pthread.h>
#include "md5.h"

#define LOGV(...) __android_log_print(ANDROID_LOG_VERBOSE, "com.droider.ndkapp", __VA_ARGS__)
#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG, "com.droider.ndkapp", __VA_ARGS__)
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, "com.droider.ndkapp", __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN, "com.droider.ndkapp", __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, "com.droider.ndkapp", __VA_ARGS__)

JNIEnv *g_env;
jclass native_class;

#ifndef NELEM //计算元素个数
# define NELEM(x) ((int) (sizeof(x) / sizeof((x)[0])))
#endif


/*
 * 获取MyApp类的字段m的值
 */
jint getValue(JNIEnv* env) {
	jclass myapp_class = (*env)->FindClass(env, "com/droider/ndkapp/MyApp");
	jfieldID intfieldID = (*env)->GetStaticFieldID(env,	//获取int类型的字段
			myapp_class, "m", "I");
	return(*env)->GetStaticIntField(env, myapp_class, intfieldID); //获取int字段的值
}

/**
 * 设置MyApp类的字段m的值
 */
void setValue(JNIEnv* env, int i) {
	jclass myapp_class = (*env)->FindClass(env, "com/droider/ndkapp/MyApp");
	jfieldID intfieldID = (*env)->GetStaticFieldID(env,	//获取int类型的字段
			myapp_class, "m", "I");
	(*env)->SetStaticIntField(env, myapp_class, intfieldID, (jint)i); // 设置int字段的值
}

void callWork(JNIEnv* env, char * workStr) {
	jclass mainactivity_class = (*env)->FindClass(env, "com/droider/ndkapp/MainActivity");
	jmethodID construction = (*env)->GetMethodID(env, mainactivity_class, "<init>", "()V");
	jobject main_obj = (*env)->NewObject(env, mainactivity_class, construction); 	//调用构造函数
	jmethodID workMethod=(*env)->GetMethodID(env, mainactivity_class, "work","(Ljava/lang/String;)V");
	if (workMethod == NULL) return;
	(*env)->CallVoidMethod(env, main_obj, workMethod, (*env)->NewStringUTF(env, workStr));	//调用MainActivity的work()方法
}

/*
 * 读文件
 */
JNIEXPORT void n1(JNIEnv* env, jobject obj){
	FILE *fp;
	int flen;
	char *p;
	if((fp = fopen("/sdcard/reg.dat","r+")) == NULL) {
		setValue(env, 0);	//未注册
		return;
	}
	fseek(fp, 0L, SEEK_END);
	flen = ftell(fp);
	p = (char *)malloc(flen + 1);
	if(p == NULL){
		fclose(fp);
		setValue(env, 0);	//未注册
		return;
	}
	fseek(fp, 0L, SEEK_SET);
	fread(p, flen, 1, fp);
	p[flen] = 0;
	//LOGD(p);
	if (strcmp(p, "25d55ad283aa400af464c76d713c07ad") == 0) { // "12345678"的MD5
		setValue(env, 1);	//正式版
	} else if (strcmp(p, "08e0750210f66396eb83957973705aad") == 0) {	//"22345678"的MD5
		setValue(env, 2);	//专业版
	} else if (strcmp(p, "b2db1185c9e5b88d9b70d7b3278a4947") == 0) {	//"32345678"的MD5
		setValue(env, 3);	//企业版
	} else if (strcmp(p, "18e56d777d194c4d589046d62801501c") == 0) {	//"42345678"的MD5
		setValue(env, 4);	//专供版
	} else {
		setValue(env, 0);	//未注册
	}
	fclose(fp);
}

/*
 * 写文件
 */
JNIEXPORT void n2(JNIEnv* env, jobject obj, jstring jstr){
	FILE *fp;
	char ch;
	const char *str;
	if((fp = fopen("/sdcard/reg.dat","w+")) == NULL) {
		LOGD("打开文件失败");
		return;
	}
	str = (*env)->GetStringUTFChars(env, jstr, NULL);
	MD5_CTX md5;
	MD5Init(&md5);
	int i;
	unsigned char decrypt[17];
	MD5Update(&md5, (unsigned char *)str, strlen(str));
	MD5Final(&md5, decrypt);
	for (i = 0; i < 16; i++) {
		fprintf(fp, "%02x", decrypt[i]);
	};
	fclose(fp);
}

/*
 * 执行函数功能
 */
JNIEXPORT void n3(JNIEnv* env, jobject obj){
	n1(env, obj);
	int i= (int)getValue(env);
	if (i == 0) {
		callWork(env, "程序未注册，功能无法使用！");
	} else if (i == 1) {
		callWork(env, "感谢您购买正式版程序！");
	} else if (i == 2) {
		callWork(env, "感谢您购买专业版程序！");
	} else if (i == 3) {
		callWork(env, "感谢您购买企业版程序！");
	} else if (i == 4) {
		callWork(env, "感谢您使用专供版程序！");
	} else {
		callWork(env, "软件版本状态异常！");
	}
}

static JNINativeMethod methods[] = {
	{"initSN", "()V", (void*)n1},
	{"saveSN", "(Ljava/lang/String;)V", (void*)n2},
	{"work", "()V", (void*)n3}
};

/*
 * 库加载时注册native函数
 */
jint JNI_OnLoad(JavaVM* vm, void* reserved){
	if(JNI_OK != (*vm)->GetEnv(vm, (void**)&g_env, JNI_VERSION_1_6)){
		return -1;
	}
	LOGV("JNI_OnLoad()");
	native_class = (*g_env)->FindClass(g_env, "com/droider/ndkapp/MyApp");
	if (JNI_OK ==(*g_env)->RegisterNatives(g_env,
			native_class, methods, NELEM(methods))){
		LOGV("RegisterNatives() --> nativeMethod() ok");
	} else {
		LOGE("RegisterNatives() --> nativeMethod() failed");
		return -1;
	}
	return JNI_VERSION_1_6;
}

void JNI_OnUnLoad(JavaVM* vm, void* reserved){
	LOGV("JNI_OnUnLoad()");
	(*g_env)->UnregisterNatives(g_env, native_class);
	LOGV("UnregisterNatives()");
}


