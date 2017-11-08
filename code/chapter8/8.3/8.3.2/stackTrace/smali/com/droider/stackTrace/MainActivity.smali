.class public Lcom/droider/stackTrace/MainActivity;
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

.method private a()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/droider/stackTrace/MainActivity;->b()V

    .line 20
    return-void
.end method

.method private b()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/droider/stackTrace/MainActivity;->c()V

    .line 24
    return-void
.end method

.method private c()V
    .locals 2
    .prologue
    .line 27
    const-string v0, "who called me?"
    const/4 v1, 0x0
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
	new-instance v0, Ljava/lang/Exception;
	const-string v1, "print trace"
	invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V
	invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V


    .line 29
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 11
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 12
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/droider/stackTrace/MainActivity;->setContentView(I)V

    .line 14
    const-string v0, "stackTrace\u6f14\u793a\u5b9e\u4f8b"

    invoke-virtual {p0, v0}, Lcom/droider/stackTrace/MainActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 15
    invoke-direct {p0}, Lcom/droider/stackTrace/MainActivity;->a()V

    .line 16
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 33
    invoke-virtual {p0}, Lcom/droider/stackTrace/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f06

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 34
    const/4 v0, 0x1

    return v0
.end method
