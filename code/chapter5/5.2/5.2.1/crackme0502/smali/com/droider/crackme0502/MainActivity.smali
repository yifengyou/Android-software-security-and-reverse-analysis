.class public Lcom/droider/crackme0502/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/droider/crackme0502/MainActivity$SNChecker;
    }
.end annotation


# instance fields
.field private btnAnno:Landroid/widget/Button;

.field private btnCheckSN:Landroid/widget/Button;

.field private edtSN:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/droider/crackme0502/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/droider/crackme0502/MainActivity;->getAnnotations()V

    return-void
.end method

.method static synthetic access$1(Lcom/droider/crackme0502/MainActivity;)Landroid/widget/EditText;
    .locals 1
    .parameter

    .prologue
    .line 22
    iget-object v0, p0, Lcom/droider/crackme0502/MainActivity;->edtSN:Landroid/widget/EditText;

    return-object v0
.end method

.method private getAnnotations()V
    .locals 10

    .prologue
    .line 54
    :try_start_0
    const-string v8, "com.droider.anno.MyAnno"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 55
    .local v0, anno:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-class v8, Lcom/droider/anno/MyAnnoClass;

    invoke-virtual {v0, v8}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 56
    const-class v8, Lcom/droider/anno/MyAnnoClass;

    invoke-virtual {v0, v8}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lcom/droider/anno/MyAnnoClass;

    .line 57
    .local v4, myAnno:Lcom/droider/anno/MyAnnoClass;
    invoke-interface {v4}, Lcom/droider/anno/MyAnnoClass;->value()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-static {p0, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 59
    .end local v4           #myAnno:Lcom/droider/anno/MyAnnoClass;
    :cond_0
    const-string v8, "outputInfo"

    const/4 v9, 0x0

    invoke-virtual {v0, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 60
    .local v3, method:Ljava/lang/reflect/Method;
    const-class v8, Lcom/droider/anno/MyAnnoMethod;

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 61
    const-class v8, Lcom/droider/anno/MyAnnoMethod;

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lcom/droider/anno/MyAnnoMethod;

    .line 62
    .local v6, myMethod:Lcom/droider/anno/MyAnnoMethod;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-interface {v6}, Lcom/droider/anno/MyAnnoMethod;->name()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, " is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v6}, Lcom/droider/anno/MyAnnoMethod;->age()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " years old."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 63
    .local v7, str:Ljava/lang/String;
    const/4 v8, 0x0

    invoke-static {p0, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 65
    .end local v6           #myMethod:Lcom/droider/anno/MyAnnoMethod;
    .end local v7           #str:Ljava/lang/String;
    :cond_1
    const-string v8, "sayWhat"

    invoke-virtual {v0, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 66
    .local v2, field:Ljava/lang/reflect/Field;
    const-class v8, Lcom/droider/anno/MyAnnoField;

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 67
    const-class v8, Lcom/droider/anno/MyAnnoField;

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/droider/anno/MyAnnoField;

    .line 68
    .local v5, myField:Lcom/droider/anno/MyAnnoField;
    invoke-interface {v5}, Lcom/droider/anno/MyAnnoField;->info()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-static {p0, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .end local v0           #anno:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v2           #field:Ljava/lang/reflect/Field;
    .end local v3           #method:Ljava/lang/reflect/Method;
    .end local v5           #myField:Lcom/droider/anno/MyAnnoField;
    :cond_2
    :goto_0
    return-void

    .line 70
    :catch_0
    move-exception v1

    .line 71
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 25
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/droider/crackme0502/MainActivity;->setContentView(I)V

    .line 28
    const/high16 v0, 0x7f08

    invoke-virtual {p0, v0}, Lcom/droider/crackme0502/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/droider/crackme0502/MainActivity;->btnAnno:Landroid/widget/Button;

    .line 29
    const v0, 0x7f080002

    invoke-virtual {p0, v0}, Lcom/droider/crackme0502/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/droider/crackme0502/MainActivity;->btnCheckSN:Landroid/widget/Button;

    .line 30
    const v0, 0x7f080001

    invoke-virtual {p0, v0}, Lcom/droider/crackme0502/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/droider/crackme0502/MainActivity;->edtSN:Landroid/widget/EditText;

    .line 32
    iget-object v0, p0, Lcom/droider/crackme0502/MainActivity;->btnAnno:Landroid/widget/Button;

    new-instance v1, Lcom/droider/crackme0502/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/droider/crackme0502/MainActivity$1;-><init>(Lcom/droider/crackme0502/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    iget-object v0, p0, Lcom/droider/crackme0502/MainActivity;->btnCheckSN:Landroid/widget/Button;

    new-instance v1, Lcom/droider/crackme0502/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/droider/crackme0502/MainActivity$2;-><init>(Lcom/droider/crackme0502/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/droider/crackme0502/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f07

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 78
    const/4 v0, 0x1

    return v0
.end method
