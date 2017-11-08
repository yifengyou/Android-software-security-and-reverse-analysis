.class public Lcom/droider/crackme0502/MyApp;
.super Landroid/app/Application;
.source "MyApp.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 12

    .prologue
    .line 12
    :try_start_0
    const-string v9, "com.droider.crackme0502.MainActivity"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 13
    .local v2, c:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v8

    .line 14
    .local v8, o:Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Class;->getClasses()[Ljava/lang/Class;

    move-result-object v5

    .line 15
    .local v5, cs:[Ljava/lang/Class;
    const/4 v9, 0x2

    new-array v0, v9, [Ljava/lang/Class;

    .line 16
    .local v0, args:[Ljava/lang/Class;
    const/4 v9, 0x0

    const-class v10, Lcom/droider/crackme0502/MainActivity;

    aput-object v10, v0, v9

    .line 17
    const/4 v9, 0x1

    const-class v10, Ljava/lang/String;

    aput-object v10, v0, v9

    .line 18
    const/4 v9, 0x0

    aget-object v9, v5, v9

    invoke-virtual {v9, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 19
    .local v4, co:Ljava/lang/reflect/Constructor;
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v8, v9, v10

    const/4 v10, 0x1

    const-string v11, "11111"

    aput-object v11, v9, v10

    invoke-virtual {v4, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 20
    .local v3, classSNChecker:Ljava/lang/Object;
    const/4 v9, 0x0

    aget-object v9, v5, v9

    const-string v10, "isRegistered"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v9, v10, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 21
    .local v7, method:Ljava/lang/reflect/Method;
    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v7, v3, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 22
    .local v1, bMod:Z
    if-eqz v1, :cond_0

    .line 23
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "\u7a0b\u5e8f\u88ab\u4fee\u6539\uff01"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v9

    invoke-static {v9}, Landroid/os/Process;->killProcess(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .end local v0           #args:[Ljava/lang/Class;
    .end local v1           #bMod:Z
    .end local v2           #c:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v3           #classSNChecker:Ljava/lang/Object;
    .end local v4           #co:Ljava/lang/reflect/Constructor;
    .end local v5           #cs:[Ljava/lang/Class;
    .end local v7           #method:Ljava/lang/reflect/Method;
    .end local v8           #o:Ljava/lang/Object;
    :cond_0
    :goto_0
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 32
    return-void

    .line 26
    :catch_0
    move-exception v6

    .line 27
    .local v6, e:Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 28
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v9

    invoke-static {v9}, Landroid/os/Process;->killProcess(I)V

    goto :goto_0
.end method
