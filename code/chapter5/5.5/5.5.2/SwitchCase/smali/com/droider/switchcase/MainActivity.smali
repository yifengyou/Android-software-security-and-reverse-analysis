.class public Lcom/droider/switchcase/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private packedSwitch(I)Ljava/lang/String;
    .locals 1
    .parameter "i"

    .prologue
    .line 21
    const/4 v0, 0x0

    .line 22
    .local v0, str:Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 36
    const-string v0, "she is a person"

    .line 39
    :goto_0
    return-object v0

    .line 24
    :pswitch_0
    const-string v0, "she is a baby"

    .line 25
    goto :goto_0

    .line 27
    :pswitch_1
    const-string v0, "she is a girl"

    .line 28
    goto :goto_0

    .line 30
    :pswitch_2
    const-string v0, "she is a woman"

    .line 31
    goto :goto_0

    .line 33
    :pswitch_3
    const-string v0, "she is an obasan"

    .line 34
    goto :goto_0

    .line 22
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private sparseSwitch(I)Ljava/lang/String;
    .locals 1
    .parameter "age"

    .prologue
    .line 43
    const/4 v0, 0x0

    .line 44
    .local v0, str:Ljava/lang/String;
    sparse-switch p1, :sswitch_data_0

    .line 58
    const-string v0, "he is a person"

    .line 61
    :goto_0
    return-object v0

    .line 46
    :sswitch_0
    const-string v0, "he is a baby"

    .line 47
    goto :goto_0

    .line 49
    :sswitch_1
    const-string v0, "he is a student"

    .line 50
    goto :goto_0

    .line 52
    :sswitch_2
    const-string v0, "he is a father"

    .line 53
    goto :goto_0

    .line 55
    :sswitch_3
    const-string v0, "he is a grandpa"

    .line 56
    goto :goto_0

    .line 44
    nop

    :sswitch_data_0
    .sparse-switch
        0x5 -> :sswitch_0
        0xf -> :sswitch_1
        0x23 -> :sswitch_2
        0x41 -> :sswitch_3
    .end sparse-switch
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x0

    .line 12
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 13
    const/high16 v2, 0x7f03

    invoke-virtual {p0, v2}, Lcom/droider/switchcase/MainActivity;->setContentView(I)V

    .line 14
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/droider/switchcase/MainActivity;->packedSwitch(I)Ljava/lang/String;

    move-result-object v0

    .line 15
    .local v0, str1:Ljava/lang/String;
    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 16
    const/16 v2, 0x23

    invoke-direct {p0, v2}, Lcom/droider/switchcase/MainActivity;->sparseSwitch(I)Ljava/lang/String;

    move-result-object v1

    .line 17
    .local v1, str2:Ljava/lang/String;
    invoke-static {p0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 18
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/droider/switchcase/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f07

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 67
    const/4 v0, 0x1

    return v0
.end method
