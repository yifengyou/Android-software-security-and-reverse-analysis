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
#include <jni.h>
#include <android/log.h>
#include <pthread.h>
#include "jniMethods.h"

#define LOGV(...) __android_log_print(ANDROID_LOG_VERBOSE, "com.droider.jnimethods", __VA_ARGS__)
#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG, "com.droider.jnimethods", __VA_ARGS__)
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, "com.droider.jnimethods", __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN, "com.droider.jnimethods", __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, "com.droider.jnimethods", __VA_ARGS__)

JNIEnv *g_env;
JavaVM *g_vm;	//下面多线程程序用到
pthread_mutex_t thread_mutex;
jclass native_class;

#ifndef NELEM //计算结构元素个数
# define NELEM(x) ((int) (sizeof(x) / sizeof((x)[0])))
#endif

/*
jint getJcharLength(const jchar* jStr){
   jint jiLen = 0;
   while (1){
     if ( jStr[jiLen++] == L'\0')
        break;
   }
   return jiLen;
}
*/

JNIEXPORT jstring nativeMethod(JNIEnv* env, jclass clazz){
	const char * chs = "你好!NativeMethod";
	return (*env)->NewStringUTF(env, chs);
}

JNIEXPORT void Java_com_droider_jnimethods_TestJniMethods_test(JNIEnv* env, jobject object) {
	int version = (*env)->GetVersion(env);
	LOGV("GetVersion() --> jni version:%2x", version);
	jclass build_class = (*env)->FindClass(env, "android/os/Build");  //加载一个本地类
	jfieldID brand_id = (*env)->GetStaticFieldID(env, 			//获取类的静态字段ID
			build_class, "MODEL", "Ljava/lang/String;");
	jstring brand_obj = (jstring)(*env)->GetStaticObjectField(env,  //获取类的静态字段的值ֵ
			build_class, brand_id);
	//__asm__ ("bkpt");
	//raise(SIGTRAP);

	const char *nativeString = (*env)->GetStringUTFChars(env, brand_obj, 0); //通过jstring生成char*
	LOGV("GetStringUTFChars() --> MODEL:%s", nativeString);
	LOGV("GetStaticFieldID() --> %s", nativeString);
	LOGV("ReleaseStringUTFChars() --> %s", nativeString);
	(*env)->ReleaseStringUTFChars(env, brand_obj, nativeString); //释放GetStringUTFChars()生成的char*
	jclass test_class = (*env)->FindClass(env, "com/droider/jnimethods/TestClass");
	if((*env)->ExceptionCheck(env)){
		(*env)->ExceptionDescribe(env);
		(*env)->ExceptionClear(env);
		LOGE("ExceptionCheck()");
		LOGE("ExceptionDescribe()");
		LOGE("ExceptionClear()");
	}
	jmethodID constructor = (*env)->GetMethodID(env, test_class, "<init>", "()V"); //获取构造函数
	jobject obj = (*env)->NewObject(env, test_class, constructor);  //创建一个对象
	jthrowable throwable = (*env)->ExceptionOccurred(env);
	if (throwable){  	//有异常发生,还可以使用ExceptionCheck()函数来判断
		(*env)->ExceptionDescribe(env);
		(*env)->ExceptionClear(env);
		LOGE("ExceptionOccurred()");
	}
	if (obj){
		(*env)->MonitorEnter(env, obj); //同步操作
		jfieldID stringfieldID = (*env)->GetFieldID(env,	//获取String类型的字段
				test_class, "aStringField", "Ljava/lang/String;");
		jstring stringfieldValue = (jstring)(*env)->GetObjectField(env,    //获取String字段的值ֵ
				obj, stringfieldID);
		const char *stringValue = (*env)->GetStringUTFChars(env,
				stringfieldValue, 0);
		LOGV("GetObjectField() --> aStringField:%s", stringValue);
		const char *myValue = "def";		//设置字段的值
		(*env)->SetObjectField(env, obj, stringfieldID, (*env)->NewStringUTF(env, myValue));
		LOGV("SetObjectField() --> aStringField:def");
		(*env)->ReleaseStringUTFChars(env, stringfieldValue, stringValue);

		jfieldID intfieldID = (*env)->GetFieldID(env,	//获取int类型的字段
				test_class, "aIntField", "I");
		jint fieldValue = (*env)->GetIntField(env, obj, intfieldID); //获取int字段的值ֵ
		LOGV("GetIntField() --> aField:%d", fieldValue);
		(*env)->SetIntField(env, obj, intfieldID, (jint)123); // 设置int字段的值ֵ
		fieldValue = (*env)->GetIntField(env, obj, intfieldID);
		LOGV("SetIntField() --> aField:%d", fieldValue);
		jclass parent_class = (*env)->GetSuperclass(env, test_class);
		LOGV("GetSuperclass() --> ");

		if(JNI_OK == (*env)->EnsureLocalCapacity(env, 5)){ //检测是否还可以创建5个局部引用
				LOGV("EnsureLocalCapacity() --> ensure 5 locals");
				jmethodID obj2_voidmethod = (*env)->GetMethodID(env, //获取一个void方法
						test_class, "aVoidMethod", "()V");
				(*env)->CallVoidMethod(env, obj, obj2_voidmethod);
				LOGV("CallVoidMethod()");
				jmethodID obj2_Staticmethod = (*env)->GetStaticMethodID(env,  //获取static方法
						test_class, "aStaticMethod", "(Ljava/lang/String;)V");
				LOGV("GetStaticMethodID()");
				const char *fromJni = "this string from jni";
				jstring jstr_static = (*env)->NewStringUTF(env, fromJni);
				(*env)->CallStaticVoidMethod(env, test_class, obj2_Staticmethod, jstr_static); //调用一个静态方法

				jmethodID obj2_chinesemethod = (*env)->GetMethodID(env,  //传递中文字符串
						test_class, "getChineseString", "()Ljava/lang/String;");
				jstring obj2_chinesejstring = (jstring)(*env)->CallObjectMethod(env, obj, obj2_chinesemethod);
				jsize chinese_size = (*env)->GetStringLength(env, obj2_chinesejstring);  //获取UTF-16字符串长度
				LOGV("GetStringLength() --> %d", chinese_size);
				jchar buff_jchar[4] = {0};
				(*env)->GetStringRegion(env, obj2_chinesejstring, 0, 3, buff_jchar);
				LOGV("GetStringRegion() -->");
				const jchar * obj2_chinesechars = (*env)->GetStringChars(env, obj2_chinesejstring, NULL);
				jstring new_chinesestring = (*env)->NewString(env, obj2_chinesechars, chinese_size);
				(*env)->CallStaticVoidMethod(env, test_class, obj2_Staticmethod, new_chinesestring); //调用一个静态方法
				(*env)->ReleaseStringChars(env, obj2_chinesejstring, obj2_chinesechars); //释放GetStringChars获取的jchar*
				LOGV("CallStaticVoidMethod()");
				jmethodID obj2_sqrtmethod = (*env)->GetStaticMethodID(env,  //获取一个static方法
						test_class, "sqrt", "(I)I");
				jint int_sqrt = (*env)->CallStaticIntMethod(env, //计算5的平方
						test_class, obj2_sqrtmethod, (jint)5);
				LOGV("CallStaticIntMethod() -->5 sqrt is:%d", int_sqrt);
			}

		if(JNI_TRUE == (*env)->IsAssignableFrom(env, test_class, parent_class)){
			LOGV("IsAssignableFrom() --> yes");
		} else {
			jclass newExceptionClazz = (*env)->FindClass(env,"java/lang/RuntimeException"); //实例化一个异常
			if(newExceptionClazz != NULL)
				(*env)->ThrowNew(env, newExceptionClazz,"这里永远不会被执行的！");
			LOGE("ThrowNew()");
		}

		jclass obj_clazz = (*env)->GetObjectClass(env, obj); //获取对象的类
		if(JNI_TRUE == (*env)->IsInstanceOf(env, obj, obj_clazz)){
			LOGV("IsInstanceOf() --> Yes");
		} else {
			(*env)->FatalError(env, "fatal error!"); //抛出致命错误
			LOGE("FatalError()");
		}

		(*env)->PushLocalFrame(env, 2);	//申请局部引用空间，增加局部引用的管理
		jobject obj_localref = (*env)->NewLocalRef(env, obj); //创建一个局部引用
		jobject obj_globalref = (*env)->NewGlobalRef(env, obj); //创建一个全局引用
		LOGV("PushLocalFrame()");
		LOGV("NewLocalRef()");
		LOGV("NewGlobalRef()");
		if (JNI_TRUE == (*env)->IsSameObject(env, obj_localref, obj_globalref)){
			LOGV("IsSameObject() --> Yes");
		}
		(*env)->DeleteLocalRef(env, obj_localref);   //删除一个局部引用
		(*env)->DeleteGlobalRef(env, obj_globalref); //删除一个全局引用
		(*env)->PopLocalFrame(env, NULL);
		LOGV("DeleteLocalRef()");
		LOGV("DeleteGlobalRef()");
		LOGV("PopLocalFrame()");

		(*env)->MonitorExit(env, obj);
	}



	jclass sub_class = (*env)->FindClass(env,
			"com/droider/jnimethods/TestSubClass"); //查询子类
	jobject sub_obj = (*env)->AllocObject(env, sub_class);
	jmethodID sub_methodID = (*env)->GetMethodID(env,
			sub_class, "aVoidMethod", "()V");
	(*env)->CallNonvirtualVoidMethod(env,
			sub_obj, sub_class, sub_methodID); //调用子类的方法
	(*env)->CallNonvirtualVoidMethod(env,
			sub_obj, test_class, sub_methodID);	//根据调用类的不同调用父类的方法
	jfieldID sub_fieldID = (*env)->GetStaticFieldID(env, //获取子类静态字段
			sub_class, "subFloatField", "F");
	(*env)->SetStaticFloatField(env, sub_class, sub_fieldID, (jfloat)33.88f);
	LOGV("SetStaticFloatField() --> %.2f",
			(*env)->GetStaticFloatField(env, sub_class, sub_fieldID));


	jclass class_string = (*env)->FindClass(env, "java/lang/String");
	jarray string_array = (*env)->NewObjectArray(env, 3, class_string, 0); //创建String数组
	LOGV("NewObjectArray()");
	jsize array_size = (*env)->GetArrayLength(env, string_array);
	LOGV("GetArrayLength() --> %d", array_size);
	jstring array_string1 = (*env)->NewStringUTF(env, "one");
	char buff_char[4] = {0};
	(*env)->GetStringUTFRegion(env, array_string1, 0, 3, buff_char);
	LOGV("GetStringUTFRegion() --> %s", buff_char);
	(*env)->SetObjectArrayElement(env, string_array, 0, array_string1); //设置数组元素的值
	LOGV("SetObjectArrayElement() --> one");
	array_string1 = (jstring)(*env)->GetObjectArrayElement(env, string_array, 0); //获取数组元素的值
	const char* array_elemchars = (*env)->GetStringUTFChars(env, array_string1, NULL);
	LOGV("GetObjectArrayElement() --> %s", array_elemchars);
	(*env)->ReleaseStringUTFChars(env, array_string1, array_elemchars);

	jintArray int_array = (*env)->NewIntArray(env, 5); 	//创建int数组
	LOGV("NewIntArray() --> %d", (*env)->GetArrayLength(env, int_array)); //获取数组长度
	const jint ints[] = {11, 12, 13, 14, 15};
	(*env)->SetIntArrayRegion(env, int_array, 0, 5, ints); //设置数组一个范围的值ֵ
	LOGV("SetIntArrayRegion() --> %d,%d,%d,%d,%d",
			ints[0], ints[1], ints[2], ints[3], ints[4]);
	jint ints2[2] = {0, 0};
	(*env)->GetIntArrayRegion(env, int_array, 1, 2, ints2); //获取数组一个范围的值
	LOGV("GetIntArrayRegion() --> %d,%d", ints2[0], ints2[1]);
	jint* array_ints = (*env)->GetIntArrayElements(env, int_array, NULL); //获取指向所有元素的指针
	LOGV("GetIntArrayElements() --> %d,%d,%d,%d,%d",
			array_ints[0], array_ints[1], array_ints[2], array_ints[3], array_ints[4]);
	(*env)->ReleaseIntArrayElements(env, int_array, array_ints, 0); //释放指向所有元素的指针
	LOGV("ReleaseIntArrayElements()");

}

void *thread_func(void *arg){
	JNIEnv *env;
	pthread_mutex_lock(&thread_mutex);
	if (JNI_OK != (*g_vm)->AttachCurrentThread(g_vm, &env, NULL)){
		LOGE("AttachCurrentThread() failed");
		return NULL;
	}
	LOGV("AttachCurrentThread() --> thread:%d", (jint)arg);
	(*g_vm)->DetachCurrentThread(g_vm);
	LOGV("DetachCurrentThread() --> thread:%d", (jint)arg);
	pthread_mutex_unlock(&thread_mutex);
	pthread_exit(0);
	return NULL;
}

JNIEXPORT void newJniThreads(JNIEnv* env, jobject obj, jint nums){
	(*env)->GetJavaVM(env, &g_vm);	//保存全局JavaVM
	LOGV("GetJavaVM()");
	pthread_t* pt = (pthread_t*)malloc(sizeof(pthread_t)* nums);
	pthread_mutex_init(&thread_mutex, NULL);
	int i;
	for (i = 0 ; i < nums; i++){
		pthread_create(&pt[i], NULL, &thread_func, (void*)i); //创建线程
	}
	free(pt);
}

JNIEXPORT jobject allocNativeBuffer(JNIEnv* env, jobject obj, jlong size){
	void* buffer = malloc(size);
	jobject directBuffer = (*env)->NewDirectByteBuffer(env, buffer, size);
	LOGV("NewDirectByteBuffer() --> %d", (int)size);
	return directBuffer;
}

JNIEXPORT void freeNativeBuffer(JNIEnv* env, jobject obj, jobject bufferRef)
{
    void *buffer = (*env)->GetDirectBufferAddress(env, bufferRef);
    strcpy(buffer, "123");
    LOGV("GetDirectBufferAddress() --> %s", buffer);
    free(buffer);
}

static JNINativeMethod methods[] = {
	{"nativeMethod", "()Ljava/lang/String;", (void*)nativeMethod},
	{"newJniThreads", "(I)V", (void*)newJniThreads},
	{"allocNativeBuffer", "(J)Ljava/lang/Object;", (void*)allocNativeBuffer},
	{"freeNativeBuffer", "(Ljava/lang/Object;)V", (void*)freeNativeBuffer}
};

jint JNI_OnLoad(JavaVM* vm, void* reserved){
	if(JNI_OK != (*vm)->GetEnv(vm, (void**)&g_env, JNI_VERSION_1_6)){ //加载指定版本的JNI
		return -1;
	}
	LOGV("JNI_OnLoad()");
	native_class = (*g_env)->FindClass(g_env, "com/droider/jnimethods/TestJniMethods");
	if (JNI_OK ==(*g_env)->RegisterNatives(g_env, 	//注册未声明的本地方法
			native_class, methods, NELEM(methods))){
		LOGV("RegisterNatives() --> nativeMethod() ok");
	} else {
		LOGE("RegisterNatives() --> nativeMethod() failed");
		return -1;
	}
	return JNI_VERSION_1_6;
}

jstring stoJstring( JNIEnv* env, const char* pat )
{
	jclass strClass = (*env)->FindClass(env, "java/lang/String");
	jmethodID ctorID =  (*env)->GetMethodID(env,
			strClass, "<init>", "([BLjava/lang/String;)V");
	jbyteArray bytes = (*env)->NewByteArray(env, strlen(pat));
	(*env)->SetByteArrayRegion(env, bytes, 0, strlen(pat), pat);
	jstring encoding = (*env)->NewStringUTF(env, "GB2312");
	return (jstring)(*env)->NewObject(env,
			strClass, ctorID, bytes, encoding);
}

void JNI_OnUnLoad(JavaVM* vm, void* reserved){
	LOGV("JNI_OnUnLoad()");
	(*g_env)->UnregisterNatives(g_env, native_class);
	LOGV("UnregisterNatives()");
}


int main(int argc, char *argv[]){
	return 0;
}


