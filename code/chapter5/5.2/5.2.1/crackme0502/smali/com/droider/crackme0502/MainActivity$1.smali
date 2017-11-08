.class Lcom/droider/crackme0502/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/droider/crackme0502/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/droider/crackme0502/MainActivity;


# direct methods
.method constructor <init>(Lcom/droider/crackme0502/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/droider/crackme0502/MainActivity$1;->this$0:Lcom/droider/crackme0502/MainActivity;

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 36
    iget-object v0, p0, Lcom/droider/crackme0502/MainActivity$1;->this$0:Lcom/droider/crackme0502/MainActivity;

    invoke-static {v0}, Lcom/droider/crackme0502/MainActivity;->access$0(Lcom/droider/crackme0502/MainActivity;)V

    .line 37
    return-void
.end method
