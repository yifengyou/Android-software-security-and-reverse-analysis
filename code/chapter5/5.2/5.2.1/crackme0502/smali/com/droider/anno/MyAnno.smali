.class public Lcom/droider/anno/MyAnno;
.super Ljava/lang/Object;
.source "MyAnno.java"


# annotations
.annotation runtime Lcom/droider/anno/MyAnnoClass;
.end annotation


# instance fields
.field public sayWhat:Ljava/lang/String;
    .annotation runtime Lcom/droider/anno/MyAnnoField;
        info = "Hello my friend"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public outputInfo()V
    .locals 2
    .annotation runtime Lcom/droider/anno/MyAnnoMethod;
        age = 0x1a
        name = "droider"
    .end annotation

    .prologue
    .line 11
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "My AnnoMethod"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 12
    return-void
.end method
