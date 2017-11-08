.class public Lcom/droider/crackme0201/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field private btn_register:Landroid/widget/Button;

.field private edit_sn:Landroid/widget/EditText;

.field private edit_userName:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/droider/crackme0201/MainActivity;)Landroid/widget/EditText;
    .locals 1
    .parameter

    .prologue
    .line 18
    iget-object v0, p0, Lcom/droider/crackme0201/MainActivity;->edit_userName:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1(Lcom/droider/crackme0201/MainActivity;)Landroid/widget/EditText;
    .locals 1
    .parameter

    .prologue
    .line 19
    iget-object v0, p0, Lcom/droider/crackme0201/MainActivity;->edit_sn:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$2(Lcom/droider/crackme0201/MainActivity;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lcom/droider/crackme0201/MainActivity;->checkSN(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$3(Lcom/droider/crackme0201/MainActivity;)Landroid/widget/Button;
    .locals 1
    .parameter

    .prologue
    .line 20
    iget-object v0, p0, Lcom/droider/crackme0201/MainActivity;->btn_register:Landroid/widget/Button;

    return-object v0
.end method

.method private checkSN(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .parameter "userName"
    .parameter "sn"

    .prologue
    const/4 v7, 0x0

    .line 54
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_1

    .line 76
    :cond_0
    :goto_0
    return v7

    .line 56
    :cond_1
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v9, 0x10

    if-ne v8, v9, :cond_0

    .line 58
    const-string v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 59
    .local v1, digest:Ljava/security/MessageDigest;
    invoke-virtual {v1}, Ljava/security/MessageDigest;->reset()V

    .line 60
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/security/MessageDigest;->update([B)V

    .line 61
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 62
    .local v0, bytes:[B
    const-string v8, ""

    invoke-static {v0, v8}, Lcom/droider/crackme0201/MainActivity;->toHexString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 63
    .local v3, hexstr:Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .local v5, sb:Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    if-lt v4, v8, :cond_2

    .line 67
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 70
    .local v6, userSN:Ljava/lang/String;
    invoke-virtual {v6, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 76
    const/4 v7, 0x1

    goto :goto_0

    .line 65
    .end local v6           #userSN:Ljava/lang/String;
    :cond_2
    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    add-int/lit8 v4, v4, 0x2

    goto :goto_1

    .line 72
    .end local v0           #bytes:[B
    .end local v1           #digest:Ljava/security/MessageDigest;
    .end local v3           #hexstr:Ljava/lang/String;
    .end local v4           #i:I
    .end local v5           #sb:Ljava/lang/StringBuilder;
    :catch_0
    move-exception v2

    .line 73
    .local v2, e:Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v2}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0
.end method

.method private static toHexString([BLjava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "bytes"
    .parameter "separator"

    .prologue
    .line 80
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .local v2, hexString:Ljava/lang/StringBuilder;
    array-length v4, p0

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v4, :cond_0

    .line 88
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 81
    :cond_0
    aget-byte v0, p0, v3

    .line 82
    .local v0, b:B
    and-int/lit16 v5, v0, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, hex:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 84
    const/16 v5, 0x30

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    :cond_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 23
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 24
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/droider/crackme0201/MainActivity;->setContentView(I)V

    .line 25
    const v0, 0x7f05000a

    invoke-virtual {p0, v0}, Lcom/droider/crackme0201/MainActivity;->setTitle(I)V

    .line 26
    const v0, 0x7f080001

    invoke-virtual {p0, v0}, Lcom/droider/crackme0201/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/droider/crackme0201/MainActivity;->edit_userName:Landroid/widget/EditText;

    .line 27
    const v0, 0x7f080002

    invoke-virtual {p0, v0}, Lcom/droider/crackme0201/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/droider/crackme0201/MainActivity;->edit_sn:Landroid/widget/EditText;

    .line 28
    const v0, 0x7f080003

    invoke-virtual {p0, v0}, Lcom/droider/crackme0201/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/droider/crackme0201/MainActivity;->btn_register:Landroid/widget/Button;

    .line 29
    iget-object v0, p0, Lcom/droider/crackme0201/MainActivity;->btn_register:Landroid/widget/Button;

    new-instance v1, Lcom/droider/crackme0201/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/droider/crackme0201/MainActivity$1;-><init>(Lcom/droider/crackme0201/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 48
    invoke-virtual {p0}, Lcom/droider/crackme0201/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f07

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 49
    const/4 v0, 0x1

    return v0
.end method
