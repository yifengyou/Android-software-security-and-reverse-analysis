.class public Lcom/droider/crackme0502/MainActivity$SNChecker;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/droider/crackme0502/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SNChecker"
.end annotation


# instance fields
.field private sn:Ljava/lang/String;

.field final synthetic this$0:Lcom/droider/crackme0502/MainActivity;


# direct methods
.method public constructor <init>(Lcom/droider/crackme0502/MainActivity;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "sn"

    .prologue
    .line 83
    iput-object p1, p0, Lcom/droider/crackme0502/MainActivity$SNChecker;->this$0:Lcom/droider/crackme0502/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p2, p0, Lcom/droider/crackme0502/MainActivity$SNChecker;->sn:Ljava/lang/String;

    .line 85
    return-void
.end method


# virtual methods
.method public isRegistered()Z
    .locals 10

    .prologue
    const/16 v9, 0x8

    const/4 v7, 0x0

    .line 88
    const/4 v4, 0x0

    .line 89
    .local v4, result:Z
    const/4 v0, 0x0

    .line 90
    .local v0, ch:C
    const/4 v6, 0x0

    .line 91
    .local v6, sum:I
    iget-object v8, p0, Lcom/droider/crackme0502/MainActivity$SNChecker;->sn:Ljava/lang/String;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/droider/crackme0502/MainActivity$SNChecker;->sn:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v8, v9, :cond_1

    :cond_0
    move v5, v4

    .line 126
    .end local v4           #result:Z
    .local v5, result:I
    :goto_0
    return v5

    .line 92
    .end local v5           #result:I
    .restart local v4       #result:Z
    :cond_1
    iget-object v8, p0, Lcom/droider/crackme0502/MainActivity$SNChecker;->sn:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v3

    .line 93
    .local v3, len:I
    if-ne v3, v9, :cond_3

    .line 94
    iget-object v8, p0, Lcom/droider/crackme0502/MainActivity$SNChecker;->sn:Ljava/lang/String;

    invoke-virtual {v8, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 95
    sparse-switch v0, :sswitch_data_0

    .line 101
    const/4 v4, 0x0

    .line 104
    :goto_1
    if-eqz v4, :cond_2

    .line 105
    iget-object v7, p0, Lcom/droider/crackme0502/MainActivity$SNChecker;->sn:Ljava/lang/String;

    const/4 v8, 0x3

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 106
    packed-switch v0, :pswitch_data_0

    .line 115
    const/4 v4, 0x0

    :cond_2
    :goto_2
    move v5, v4

    .line 126
    .restart local v5       #result:I
    goto :goto_0

    .line 98
    .end local v5           #result:I
    :sswitch_0
    const/4 v4, 0x1

    .line 99
    goto :goto_1

    .line 112
    :pswitch_0
    const/4 v4, 0x1

    .line 113
    goto :goto_2

    .line 119
    :cond_3
    const/16 v8, 0x10

    if-ne v3, v8, :cond_2

    .line 120
    const/4 v2, 0x0

    .local v2, i:I
    :goto_3
    if-lt v2, v3, :cond_4

    .line 124
    rem-int/lit8 v8, v6, 0x6

    if-nez v8, :cond_5

    const/4 v4, 0x1

    :goto_4
    goto :goto_2

    .line 121
    :cond_4
    iget-object v8, p0, Lcom/droider/crackme0502/MainActivity$SNChecker;->sn:Ljava/lang/String;

    invoke-virtual {v8, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 122
    .local v1, chPlus:C
    add-int/2addr v6, v1

    .line 120
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .end local v1           #chPlus:C
    :cond_5
    move v4, v7

    .line 124
    goto :goto_4

    .line 95
    :sswitch_data_0
    .sparse-switch
        0x61 -> :sswitch_0
        0x66 -> :sswitch_0
    .end sparse-switch

    .line 106
    :pswitch_data_0
    .packed-switch 0x31
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
