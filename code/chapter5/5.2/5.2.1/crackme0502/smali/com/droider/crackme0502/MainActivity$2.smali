.class Lcom/droider/crackme0502/MainActivity$2;
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
    iput-object p1, p0, Lcom/droider/crackme0502/MainActivity$2;->this$0:Lcom/droider/crackme0502/MainActivity;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 44
    new-instance v0, Lcom/droider/crackme0502/MainActivity$SNChecker;

    iget-object v2, p0, Lcom/droider/crackme0502/MainActivity$2;->this$0:Lcom/droider/crackme0502/MainActivity;

    iget-object v3, p0, Lcom/droider/crackme0502/MainActivity$2;->this$0:Lcom/droider/crackme0502/MainActivity;

    invoke-static {v3}, Lcom/droider/crackme0502/MainActivity;->access$1(Lcom/droider/crackme0502/MainActivity;)Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/droider/crackme0502/MainActivity$SNChecker;-><init>(Lcom/droider/crackme0502/MainActivity;Ljava/lang/String;)V

    .line 45
    .local v0, checker:Lcom/droider/crackme0502/MainActivity$SNChecker;
    invoke-virtual {v0}, Lcom/droider/crackme0502/MainActivity$SNChecker;->isRegistered()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v1, "\u6ce8\u518c\u7801\u6b63\u786e"

    .line 46
    .local v1, str:Ljava/lang/String;
    :goto_0
    iget-object v2, p0, Lcom/droider/crackme0502/MainActivity$2;->this$0:Lcom/droider/crackme0502/MainActivity;

    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 47
    return-void

    .line 45
    .end local v1           #str:Ljava/lang/String;
    :cond_0
    const-string v1, "\u6ce8\u518c\u7801\u9519\u8bef"

    goto :goto_0
.end method
