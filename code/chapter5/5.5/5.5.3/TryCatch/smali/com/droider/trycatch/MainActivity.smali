.class public Lcom/droider/trycatch/MainActivity;
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

.method private tryCatch(ILjava/lang/String;)V
    .locals 10
    .parameter "drumsticks"
    .parameter "peple"

    .prologue
    const/4 v9, 0x0

    .line 19
    :try_start_0
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    .line 21
    .local v1, i:I
    :try_start_1
    div-int v2, p1, v1

    .line 22
    .local v2, m:I
    mul-int v5, v2, v1

    sub-int v3, p1, v5

    .line 23
    .local v3, n:I
    const-string v5, "\u5171\u6709%d\u53ea\u9e21\u817f\uff0c%d\u4e2a\u4eba\u5e73\u5206\uff0c\u6bcf\u4eba\u53ef\u5206\u5f97%d\u53ea\uff0c\u8fd8\u5269\u4e0b%d\u53ea"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    .line 23
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 25
    .local v4, str:Ljava/lang/String;
    const/4 v5, 0x0

    invoke-static {p0, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/ArithmeticException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 33
    .end local v1           #i:I
    .end local v2           #m:I
    .end local v3           #n:I
    .end local v4           #str:Ljava/lang/String;
    :goto_0
    return-void

    .line 26
    .restart local v1       #i:I
    :catch_0
    move-exception v0

    .line 27
    .local v0, e:Ljava/lang/ArithmeticException;
    :try_start_2
    const-string v5, "\u4eba\u6570\u4e0d\u80fd\u4e3a0"

    const/4 v6, 0x0

    invoke-static {p0, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 29
    .end local v0           #e:Ljava/lang/ArithmeticException;
    .end local v1           #i:I
    :catch_1
    move-exception v0

    .line 30
    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v5, "\u65e0\u6548\u7684\u6570\u503c\u5b57\u7b26\u4e32"

    invoke-static {p0, v5, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 12
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 13
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/droider/trycatch/MainActivity;->setContentView(I)V

    .line 14
    const/16 v0, 0x64

    const-string v1, "6"

    invoke-direct {p0, v0, v1}, Lcom/droider/trycatch/MainActivity;->tryCatch(ILjava/lang/String;)V

    .line 15
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/droider/trycatch/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f07

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 38
    const/4 v0, 0x1

    return v0
.end method
