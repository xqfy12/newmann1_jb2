.class Lcom/android/server/pm/PackageManagerService$InstallParams;
.super Lcom/android/server/pm/PackageManagerService$HandlerParams;
.source "PackageManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/pm/PackageManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InstallParams"
.end annotation


# instance fields
.field final encryptionParams:Landroid/content/pm/ContainerEncryptionParams;

.field flags:I

.field final installerPackageName:Ljava/lang/String;

.field private mArgs:Lcom/android/server/pm/PackageManagerService$InstallArgs;

.field private final mPackageURI:Landroid/net/Uri;

.field private mRet:I

.field private mTempPackage:Ljava/io/File;

.field final observer:Landroid/content/pm/IPackageInstallObserver;

.field final synthetic this$0:Lcom/android/server/pm/PackageManagerService;

.field final verificationParams:Landroid/content/pm/VerificationParams;


# direct methods
.method constructor <init>(Lcom/android/server/pm/PackageManagerService;Landroid/net/Uri;Landroid/content/pm/IPackageInstallObserver;ILjava/lang/String;Landroid/content/pm/VerificationParams;Landroid/content/pm/ContainerEncryptionParams;Landroid/os/UserHandle;)V
    .locals 0
    .parameter
    .parameter "packageURI"
    .parameter "observer"
    .parameter "flags"
    .parameter "installerPackageName"
    .parameter "verificationParams"
    .parameter "encryptionParams"
    .parameter "user"

    .prologue
    .line 6512
    iput-object p1, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    .line 6513
    invoke-direct {p0, p1, p8}, Lcom/android/server/pm/PackageManagerService$HandlerParams;-><init>(Lcom/android/server/pm/PackageManagerService;Landroid/os/UserHandle;)V

    .line 6514
    iput-object p2, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mPackageURI:Landroid/net/Uri;

    .line 6515
    iput p4, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    .line 6516
    iput-object p3, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->observer:Landroid/content/pm/IPackageInstallObserver;

    .line 6517
    iput-object p5, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->installerPackageName:Ljava/lang/String;

    .line 6518
    iput-object p6, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    .line 6519
    iput-object p7, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->encryptionParams:Landroid/content/pm/ContainerEncryptionParams;

    .line 6520
    return-void
.end method

.method private installLocationPolicy(Landroid/content/pm/PackageInfoLite;I)I
    .locals 9
    .parameter "pkgLite"
    .parameter "flags"

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 6550
    iget-object v2, p1, Landroid/content/pm/PackageInfoLite;->packageName:Ljava/lang/String;

    .line 6551
    .local v2, packageName:Ljava/lang/String;
    iget v0, p1, Landroid/content/pm/PackageInfoLite;->installLocation:I

    .line 6552
    .local v0, installLocation:I
    and-int/lit8 v6, p2, 0x8

    if-eqz v6, :cond_1

    move v1, v4

    .line 6554
    .local v1, onSd:Z
    :goto_0
    iget-object v6, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v6, v6, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v6

    .line 6555
    :try_start_0
    iget-object v7, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v7, v7, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v7, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/PackageParser$Package;

    .line 6556
    .local v3, pkg:Landroid/content/pm/PackageParser$Package;
    if-eqz v3, :cond_7

    .line 6557
    and-int/lit8 v7, p2, 0x2

    if-eqz v7, :cond_a

    .line 6559
    and-int/lit16 v7, p2, 0x80

    if-nez v7, :cond_2

    .line 6560
    iget v7, p1, Landroid/content/pm/PackageInfoLite;->versionCode:I

    iget v8, v3, Landroid/content/pm/PackageParser$Package;->mVersionCode:I

    if-ge v7, v8, :cond_2

    .line 6561
    const-string v4, "PackageManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Can\'t install update of "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " update version "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, p1, Landroid/content/pm/PackageInfoLite;->versionCode:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " is older than installed version "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v3, Landroid/content/pm/PackageParser$Package;->mVersionCode:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6565
    const/4 v4, -0x7

    monitor-exit v6

    .line 6611
    :cond_0
    :goto_1
    return v4

    .line 6552
    .end local v1           #onSd:Z
    .end local v3           #pkg:Landroid/content/pm/PackageParser$Package;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 6569
    .restart local v1       #onSd:Z
    .restart local v3       #pkg:Landroid/content/pm/PackageParser$Package;
    :cond_2
    iget-object v7, v3, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v7, v7, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v7, v7, 0x1

    if-eqz v7, :cond_4

    .line 6570
    if-eqz v1, :cond_3

    .line 6571
    const-string v4, "PackageManager"

    const-string v5, "Cannot install update to system app on sdcard"

    invoke-static {v4, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6572
    const/4 v4, -0x3

    monitor-exit v6

    goto :goto_1

    .line 6599
    .end local v3           #pkg:Landroid/content/pm/PackageParser$Package;
    :catchall_0
    move-exception v4

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 6574
    .restart local v3       #pkg:Landroid/content/pm/PackageParser$Package;
    :cond_3
    :try_start_1
    monitor-exit v6

    goto :goto_1

    .line 6576
    :cond_4
    if-eqz v1, :cond_5

    .line 6578
    monitor-exit v6

    move v4, v5

    goto :goto_1

    .line 6581
    :cond_5
    if-ne v0, v4, :cond_6

    .line 6583
    monitor-exit v6

    goto :goto_1

    .line 6584
    :cond_6
    if-ne v0, v5, :cond_8

    .line 6599
    :cond_7
    monitor-exit v6

    .line 6602
    if-eqz v1, :cond_b

    move v4, v5

    .line 6603
    goto :goto_1

    .line 6588
    :cond_8
    #calls: Lcom/android/server/pm/PackageManagerService;->isExternal(Landroid/content/pm/PackageParser$Package;)Z
    invoke-static {v3}, Lcom/android/server/pm/PackageManagerService;->access$2400(Landroid/content/pm/PackageParser$Package;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 6589
    monitor-exit v6

    move v4, v5

    goto :goto_1

    .line 6591
    :cond_9
    monitor-exit v6

    goto :goto_1

    .line 6596
    :cond_a
    const/4 v4, -0x4

    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 6608
    :cond_b
    invoke-direct {p0}, Lcom/android/server/pm/PackageManagerService$InstallParams;->isSDExistWhenSwap()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 6609
    iget v4, p1, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    goto :goto_1
.end method

.method private isSDExistWhenSwap()Z
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 6531
    const-string v4, "mount"

    invoke-static {v4}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    .line 6532
    .local v2, service:Landroid/os/IBinder;
    if-eqz v2, :cond_0

    .line 6533
    invoke-static {v2}, Landroid/os/storage/IMountService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/storage/IMountService;

    move-result-object v1

    .line 6534
    .local v1, mountService:Landroid/os/storage/IMountService;
    if-nez v1, :cond_1

    .line 6544
    .end local v1           #mountService:Landroid/os/storage/IMountService;
    :cond_0
    :goto_0
    return v3

    .line 6538
    .restart local v1       #mountService:Landroid/os/storage/IMountService;
    :cond_1
    :try_start_0
    invoke-interface {v1}, Landroid/os/storage/IMountService;->isSDExist()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    goto :goto_0

    .line 6539
    :catch_0
    move-exception v0

    .line 6540
    .local v0, e:Landroid/os/RemoteException;
    const-string v4, "PackageManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Util:RemoteException when isSDExist: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public getManifestDigest()Landroid/content/pm/ManifestDigest;
    .locals 1

    .prologue
    .line 6523
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    if-nez v0, :cond_0

    .line 6524
    const/4 v0, 0x0

    .line 6526
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v0}, Landroid/content/pm/VerificationParams;->getManifestDigest()Landroid/content/pm/ManifestDigest;

    move-result-object v0

    goto :goto_0
.end method

.method public getPackageUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 6926
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mTempPackage:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 6927
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mTempPackage:Ljava/io/File;

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 6929
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mPackageURI:Landroid/net/Uri;

    goto :goto_0
.end method

.method handleReturnCode()V
    .locals 3

    .prologue
    .line 6903
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/pm/PackageManagerService$InstallArgs;

    if-eqz v0, :cond_0

    .line 6904
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v1, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/pm/PackageManagerService$InstallArgs;

    iget v2, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mRet:I

    #calls: Lcom/android/server/pm/PackageManagerService;->processPendingInstall(Lcom/android/server/pm/PackageManagerService$InstallArgs;I)V
    invoke-static {v0, v1, v2}, Lcom/android/server/pm/PackageManagerService;->access$1100(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/PackageManagerService$InstallArgs;I)V

    .line 6906
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mTempPackage:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 6907
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mTempPackage:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 6908
    const-string v0, "PackageManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Couldn\'t delete temporary file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mTempPackage:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6913
    :cond_0
    return-void
.end method

.method handleServiceError()V
    .locals 1

    .prologue
    .line 6917
    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #calls: Lcom/android/server/pm/PackageManagerService;->createInstallArgs(Lcom/android/server/pm/PackageManagerService$InstallParams;)Lcom/android/server/pm/PackageManagerService$InstallArgs;
    invoke-static {v0, p0}, Lcom/android/server/pm/PackageManagerService;->access$2600(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/PackageManagerService$InstallParams;)Lcom/android/server/pm/PackageManagerService$InstallArgs;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/pm/PackageManagerService$InstallArgs;

    .line 6918
    const/16 v0, -0x6e

    iput v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mRet:I

    .line 6919
    return-void
.end method

.method public handleStartCopy()V
    .locals 38
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 6626
    const/16 v29, 0x1

    .line 6627
    .local v29, ret:I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_a

    const/16 v21, 0x1

    .line 6628
    .local v21, onSd:Z
    :goto_0
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v3, v3, 0x10

    if-eqz v3, :cond_b

    const/16 v20, 0x1

    .line 6629
    .local v20, onInt:Z
    :goto_1
    const/16 v25, 0x0

    .line 6631
    .local v25, pkgLite:Landroid/content/pm/PackageInfoLite;
    if-eqz v20, :cond_c

    if-eqz v21, :cond_c

    .line 6633
    const-string v3, "PackageManager"

    const-string v5, "Conflicting flags specified for installing on both internal and external"

    invoke-static {v3, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6634
    const/16 v29, -0x13

    .line 6720
    :goto_2
    const/4 v3, 0x1

    move/from16 v0, v29

    if-ne v0, v3, :cond_0

    .line 6721
    move-object/from16 v0, v25

    iget v0, v0, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    move/from16 v17, v0

    .line 6722
    .local v17, loc:I
    const/4 v3, -0x3

    move/from16 v0, v17

    if-ne v0, v3, :cond_13

    .line 6723
    const/16 v29, -0x13

    .line 6755
    .end local v17           #loc:I
    :cond_0
    :goto_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, p0

    #calls: Lcom/android/server/pm/PackageManagerService;->createInstallArgs(Lcom/android/server/pm/PackageManagerService$InstallParams;)Lcom/android/server/pm/PackageManagerService$InstallArgs;
    invoke-static {v3, v0}, Lcom/android/server/pm/PackageManagerService;->access$2600(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/PackageManagerService$InstallParams;)Lcom/android/server/pm/PackageManagerService$InstallArgs;

    move-result-object v13

    .line 6756
    .local v13, args:Lcom/android/server/pm/PackageManagerService$InstallArgs;
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/pm/PackageManagerService$InstallArgs;

    .line 6758
    const/4 v3, 0x1

    move/from16 v0, v29

    if-ne v0, v3, :cond_9

    .line 6763
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/pm/PackageManagerService$InstallParams;->getUser()Landroid/os/UserHandle;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v34

    .line 6764
    .local v34, userIdentifier:I
    const/4 v3, -0x1

    move/from16 v0, v34

    if-ne v0, v3, :cond_1

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v3, v3, 0x20

    if-eqz v3, :cond_1

    .line 6766
    const/16 v34, 0x0

    .line 6773
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #getter for: Lcom/android/server/pm/PackageManagerService;->mRequiredVerifierPackage:Ljava/lang/String;
    invoke-static {v3}, Lcom/android/server/pm/PackageManagerService;->access$2700(Lcom/android/server/pm/PackageManagerService;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1b

    const/16 v27, -0x1

    .line 6775
    .local v27, requiredUid:I
    :goto_4
    const/4 v3, -0x1

    move/from16 v0, v27

    if-eq v0, v3, :cond_1d

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    #calls: Lcom/android/server/pm/PackageManagerService;->isVerificationEnabled(I)Z
    invoke-static {v3, v5}, Lcom/android/server/pm/PackageManagerService;->access$2800(Lcom/android/server/pm/PackageManagerService;I)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 6776
    new-instance v4, Landroid/content/Intent;

    const-string v3, "android.intent.action.PACKAGE_NEEDS_VERIFICATION"

    invoke-direct {v4, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6778
    .local v4, verification:Landroid/content/Intent;
    invoke-virtual/range {p0 .. p0}, Lcom/android/server/pm/PackageManagerService$InstallParams;->getPackageUri()Landroid/net/Uri;

    move-result-object v3

    const-string v5, "application/vnd.android.package-archive"

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 6779
    const/4 v3, 0x1

    invoke-virtual {v4, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 6781
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    const-string v5, "application/vnd.android.package-archive"

    const/16 v6, 0x200

    const/4 v7, 0x0

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/android/server/pm/PackageManagerService;->queryIntentReceivers(Landroid/content/Intent;Ljava/lang/String;II)Ljava/util/List;

    move-result-object v26

    .line 6785
    .local v26, receivers:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->access$2900()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 6786
    const-string v3, "PackageManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Found "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " verifiers for intent "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " with "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v25

    iget-object v6, v0, Landroid/content/pm/PackageInfoLite;->verifiers:[Landroid/content/pm/VerifierInfo;

    array-length v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " optional verifiers"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6791
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    invoke-static {v3}, Lcom/android/server/pm/PackageManagerService;->access$3008(Lcom/android/server/pm/PackageManagerService;)I

    move-result v35

    .line 6793
    .local v35, verificationId:I
    const-string v3, "android.content.pm.extra.VERIFICATION_ID"

    move/from16 v0, v35

    invoke-virtual {v4, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 6795
    const-string v3, "android.content.pm.extra.VERIFICATION_INSTALLER_PACKAGE"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->installerPackageName:Ljava/lang/String;

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 6798
    const-string v3, "android.content.pm.extra.VERIFICATION_INSTALL_FLAGS"

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 6800
    const-string v3, "android.content.pm.extra.VERIFICATION_PACKAGE_NAME"

    move-object/from16 v0, v25

    iget-object v5, v0, Landroid/content/pm/PackageInfoLite;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 6803
    const-string v3, "android.content.pm.extra.VERIFICATION_VERSION_CODE"

    move-object/from16 v0, v25

    iget v5, v0, Landroid/content/pm/PackageInfoLite;->versionCode:I

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 6806
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    if-eqz v3, :cond_7

    .line 6807
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v3}, Landroid/content/pm/VerificationParams;->getVerificationURI()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 6808
    const-string v3, "android.content.pm.extra.VERIFICATION_URI"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v5}, Landroid/content/pm/VerificationParams;->getVerificationURI()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 6811
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v3}, Landroid/content/pm/VerificationParams;->getOriginatingURI()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 6812
    const-string v3, "android.intent.extra.ORIGINATING_URI"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v5}, Landroid/content/pm/VerificationParams;->getOriginatingURI()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 6815
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v3}, Landroid/content/pm/VerificationParams;->getReferrer()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 6816
    const-string v3, "android.intent.extra.REFERRER"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v5}, Landroid/content/pm/VerificationParams;->getReferrer()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 6819
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v3}, Landroid/content/pm/VerificationParams;->getOriginatingUid()I

    move-result v3

    if-ltz v3, :cond_6

    .line 6820
    const-string v3, "android.intent.extra.ORIGINATING_UID"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v5}, Landroid/content/pm/VerificationParams;->getOriginatingUid()I

    move-result v5

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 6823
    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v3}, Landroid/content/pm/VerificationParams;->getInstallerUid()I

    move-result v3

    if-ltz v3, :cond_7

    .line 6824
    const-string v3, "android.content.pm.extra.VERIFICATION_INSTALLER_UID"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->verificationParams:Landroid/content/pm/VerificationParams;

    invoke-virtual {v5}, Landroid/content/pm/VerificationParams;->getInstallerUid()I

    move-result v5

    invoke-virtual {v4, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 6829
    :cond_7
    new-instance v36, Lcom/android/server/pm/PackageVerificationState;

    move-object/from16 v0, v36

    move/from16 v1, v27

    invoke-direct {v0, v1, v13}, Lcom/android/server/pm/PackageVerificationState;-><init>(ILcom/android/server/pm/PackageManagerService$InstallArgs;)V

    .line 6832
    .local v36, verificationState:Lcom/android/server/pm/PackageVerificationState;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v3, Lcom/android/server/pm/PackageManagerService;->mPendingVerification:Landroid/util/SparseArray;

    move/from16 v0, v35

    move-object/from16 v1, v36

    invoke-virtual {v3, v0, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 6834
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v36

    #calls: Lcom/android/server/pm/PackageManagerService;->matchVerifiers(Landroid/content/pm/PackageInfoLite;Ljava/util/List;Lcom/android/server/pm/PackageVerificationState;)Ljava/util/List;
    invoke-static {v3, v0, v1, v2}, Lcom/android/server/pm/PackageManagerService;->access$3100(Lcom/android/server/pm/PackageManagerService;Landroid/content/pm/PackageInfoLite;Ljava/util/List;Lcom/android/server/pm/PackageVerificationState;)Ljava/util/List;

    move-result-object v33

    .line 6841
    .local v33, sufficientVerifiers:Ljava/util/List;,"Ljava/util/List<Landroid/content/ComponentName;>;"
    if-eqz v33, :cond_8

    .line 6842
    invoke-interface/range {v33 .. v33}, Ljava/util/List;->size()I

    move-result v12

    .line 6843
    .local v12, N:I
    if-nez v12, :cond_1c

    .line 6844
    const-string v3, "PackageManager"

    const-string v5, "Additional verifiers required, but none installed."

    invoke-static {v3, v5}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6845
    const/16 v29, -0x16

    .line 6858
    .end local v12           #N:I
    :cond_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #getter for: Lcom/android/server/pm/PackageManagerService;->mRequiredVerifierPackage:Ljava/lang/String;
    invoke-static {v5}, Lcom/android/server/pm/PackageManagerService;->access$2700(Lcom/android/server/pm/PackageManagerService;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v26

    #calls: Lcom/android/server/pm/PackageManagerService;->matchComponentForVerifier(Ljava/lang/String;Ljava/util/List;)Landroid/content/ComponentName;
    invoke-static {v3, v5, v0}, Lcom/android/server/pm/PackageManagerService;->access$3200(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;Ljava/util/List;)Landroid/content/ComponentName;

    move-result-object v28

    .line 6860
    .local v28, requiredVerifierComponent:Landroid/content/ComponentName;
    const/4 v3, 0x1

    move/from16 v0, v29

    if-ne v0, v3, :cond_9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #getter for: Lcom/android/server/pm/PackageManagerService;->mRequiredVerifierPackage:Ljava/lang/String;
    invoke-static {v3}, Lcom/android/server/pm/PackageManagerService;->access$2700(Lcom/android/server/pm/PackageManagerService;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_9

    .line 6867
    move-object/from16 v0, v28

    invoke-virtual {v4, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 6868
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v3, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    invoke-virtual/range {p0 .. p0}, Lcom/android/server/pm/PackageManagerService$InstallParams;->getUser()Landroid/os/UserHandle;

    move-result-object v5

    const-string v6, "android.permission.PACKAGE_VERIFICATION_AGENT"

    new-instance v7, Lcom/android/server/pm/PackageManagerService$InstallParams$1;

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v7, v0, v1}, Lcom/android/server/pm/PackageManagerService$InstallParams$1;-><init>(Lcom/android/server/pm/PackageManagerService$InstallParams;I)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v3 .. v11}, Landroid/content/Context;->sendOrderedBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 6884
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mArgs:Lcom/android/server/pm/PackageManagerService$InstallArgs;

    .line 6895
    .end local v4           #verification:Landroid/content/Intent;
    .end local v26           #receivers:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v27           #requiredUid:I
    .end local v28           #requiredVerifierComponent:Landroid/content/ComponentName;
    .end local v33           #sufficientVerifiers:Ljava/util/List;,"Ljava/util/List<Landroid/content/ComponentName;>;"
    .end local v34           #userIdentifier:I
    .end local v35           #verificationId:I
    .end local v36           #verificationState:Lcom/android/server/pm/PackageVerificationState;
    :cond_9
    :goto_5
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/server/pm/PackageManagerService$InstallParams;->mRet:I

    .line 6896
    return-void

    .line 6627
    .end local v13           #args:Lcom/android/server/pm/PackageManagerService$InstallArgs;
    .end local v20           #onInt:Z
    .end local v21           #onSd:Z
    .end local v25           #pkgLite:Landroid/content/pm/PackageInfoLite;
    :cond_a
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 6628
    .restart local v21       #onSd:Z
    :cond_b
    const/16 v20, 0x0

    goto/16 :goto_1

    .line 6638
    .restart local v20       #onInt:Z
    .restart local v25       #pkgLite:Landroid/content/pm/PackageInfoLite;
    :cond_c
    const-string v3, "devicestoragemonitor"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v14

    check-cast v14, Lcom/android/server/DeviceStorageMonitorService;

    .line 6640
    .local v14, dsm:Lcom/android/server/DeviceStorageMonitorService;
    if-nez v14, :cond_10

    .line 6641
    const-string v3, "PackageManager"

    const-string v5, "Couldn\'t get low memory threshold; no free limit imposed"

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6642
    const-wide/16 v18, 0x0

    .line 6648
    .local v18, lowThreshold:J
    :goto_6
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v3, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    const-string v5, "com.android.defcontainer"

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mPackageURI:Landroid/net/Uri;

    const/4 v7, 0x1

    invoke-virtual {v3, v5, v6, v7}, Landroid/content/Context;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    .line 6652
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->encryptionParams:Landroid/content/pm/ContainerEncryptionParams;

    if-nez v3, :cond_d

    const-string v3, "file"

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mPackageURI:Landroid/net/Uri;

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    .line 6653
    :cond_d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v5, v5, Lcom/android/server/pm/PackageManagerService;->mDrmAppPrivateInstallDir:Ljava/io/File;

    #calls: Lcom/android/server/pm/PackageManagerService;->createTempPackageFile(Ljava/io/File;)Ljava/io/File;
    invoke-static {v3, v5}, Lcom/android/server/pm/PackageManagerService;->access$2500(Lcom/android/server/pm/PackageManagerService;Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mTempPackage:Ljava/io/File;

    .line 6654
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mTempPackage:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_11

    .line 6657
    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mTempPackage:Ljava/io/File;

    const/high16 v5, 0x3000

    invoke-static {v3, v5}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v22

    .line 6665
    .local v22, out:Landroid/os/ParcelFileDescriptor;
    :goto_7
    :try_start_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #getter for: Lcom/android/server/pm/PackageManagerService;->mContainerService:Lcom/android/internal/app/IMediaContainerService;
    invoke-static {v3}, Lcom/android/server/pm/PackageManagerService;->access$300(Lcom/android/server/pm/PackageManagerService;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mPackageURI:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->encryptionParams:Landroid/content/pm/ContainerEncryptionParams;

    move-object/from16 v0, v22

    invoke-interface {v3, v5, v6, v0}, Lcom/android/internal/app/IMediaContainerService;->copyResource(Landroid/net/Uri;Landroid/content/pm/ContainerEncryptionParams;Landroid/os/ParcelFileDescriptor;)I

    move-result v29

    .line 6667
    invoke-static/range {v22 .. v22}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 6669
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mTempPackage:Ljava/io/File;

    move-object/from16 v23, v0

    .line 6671
    .local v23, packageFile:Ljava/io/File;
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x1a4

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-static {v3, v5, v6, v7}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    .line 6682
    .end local v22           #out:Landroid/os/ParcelFileDescriptor;
    :goto_8
    if-eqz v23, :cond_f

    .line 6684
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v24

    .line 6685
    .local v24, packageFilePath:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #getter for: Lcom/android/server/pm/PackageManagerService;->mContainerService:Lcom/android/internal/app/IMediaContainerService;
    invoke-static {v3}, Lcom/android/server/pm/PackageManagerService;->access$300(Lcom/android/server/pm/PackageManagerService;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v3

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    move-object/from16 v0, v24

    move-wide/from16 v1, v18

    invoke-interface {v3, v0, v5, v1, v2}, Lcom/android/internal/app/IMediaContainerService;->getMinimalPackageInfo(Ljava/lang/String;IJ)Landroid/content/pm/PackageInfoLite;

    move-result-object v25

    .line 6692
    move-object/from16 v0, v25

    iget v3, v0, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    const/4 v5, -0x1

    if-ne v3, v5, :cond_f

    .line 6694
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #getter for: Lcom/android/server/pm/PackageManagerService;->mContainerService:Lcom/android/internal/app/IMediaContainerService;
    invoke-static {v3}, Lcom/android/server/pm/PackageManagerService;->access$300(Lcom/android/server/pm/PackageManagerService;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/android/server/pm/PackageManagerService$InstallParams;->isForwardLocked()Z

    move-result v5

    move-object/from16 v0, v24

    invoke-interface {v3, v0, v5}, Lcom/android/internal/app/IMediaContainerService;->calculateInstalledSize(Ljava/lang/String;Z)J

    move-result-wide v30

    .line 6696
    .local v30, size:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v3, Lcom/android/server/pm/PackageManagerService;->mInstaller:Lcom/android/server/pm/Installer;

    add-long v5, v30, v18

    invoke-virtual {v3, v5, v6}, Lcom/android/server/pm/Installer;->freeCache(J)I

    move-result v3

    if-ltz v3, :cond_e

    .line 6697
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #getter for: Lcom/android/server/pm/PackageManagerService;->mContainerService:Lcom/android/internal/app/IMediaContainerService;
    invoke-static {v3}, Lcom/android/server/pm/PackageManagerService;->access$300(Lcom/android/server/pm/PackageManagerService;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v3

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    move-object/from16 v0, v24

    move-wide/from16 v1, v18

    invoke-interface {v3, v0, v5, v1, v2}, Lcom/android/internal/app/IMediaContainerService;->getMinimalPackageInfo(Ljava/lang/String;IJ)Landroid/content/pm/PackageInfoLite;

    move-result-object v25

    .line 6707
    :cond_e
    move-object/from16 v0, v25

    iget v3, v0, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I

    const/4 v5, -0x6

    if-ne v3, v5, :cond_f

    .line 6709
    const/4 v3, -0x1

    move-object/from16 v0, v25

    iput v3, v0, Landroid/content/pm/PackageInfoLite;->recommendedInstallLocation:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 6715
    .end local v24           #packageFilePath:Ljava/lang/String;
    .end local v30           #size:J
    :cond_f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v3, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mPackageURI:Landroid/net/Uri;

    const/4 v6, 0x1

    invoke-virtual {v3, v5, v6}, Landroid/content/Context;->revokeUriPermission(Landroid/net/Uri;I)V

    goto/16 :goto_2

    .line 6644
    .end local v18           #lowThreshold:J
    .end local v23           #packageFile:Ljava/io/File;
    :cond_10
    invoke-virtual {v14}, Lcom/android/server/DeviceStorageMonitorService;->getMemoryLowThreshold()J

    move-result-wide v18

    .restart local v18       #lowThreshold:J
    goto/16 :goto_6

    .line 6659
    :catch_0
    move-exception v15

    .line 6660
    .local v15, e:Ljava/io/FileNotFoundException;
    const/16 v22, 0x0

    .line 6661
    .restart local v22       #out:Landroid/os/ParcelFileDescriptor;
    :try_start_3
    const-string v3, "PackageManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to create temporary file for : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mPackageURI:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_7

    .line 6715
    .end local v15           #e:Ljava/io/FileNotFoundException;
    .end local v22           #out:Landroid/os/ParcelFileDescriptor;
    :catchall_0
    move-exception v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v5, v5, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mPackageURI:Landroid/net/Uri;

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->revokeUriPermission(Landroid/net/Uri;I)V

    throw v3

    .line 6676
    :cond_11
    const/16 v23, 0x0

    .restart local v23       #packageFile:Ljava/io/File;
    goto/16 :goto_8

    .line 6679
    .end local v23           #packageFile:Ljava/io/File;
    :cond_12
    :try_start_4
    new-instance v23, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->mPackageURI:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .restart local v23       #packageFile:Ljava/io/File;
    goto/16 :goto_8

    .line 6724
    .end local v14           #dsm:Lcom/android/server/DeviceStorageMonitorService;
    .end local v18           #lowThreshold:J
    .end local v23           #packageFile:Ljava/io/File;
    .restart local v17       #loc:I
    :cond_13
    const/4 v3, -0x4

    move/from16 v0, v17

    if-ne v0, v3, :cond_14

    .line 6725
    const/16 v29, -0x1

    goto/16 :goto_3

    .line 6726
    :cond_14
    const/4 v3, -0x1

    move/from16 v0, v17

    if-ne v0, v3, :cond_15

    .line 6727
    const/16 v29, -0x4

    goto/16 :goto_3

    .line 6728
    :cond_15
    const/4 v3, -0x2

    move/from16 v0, v17

    if-ne v0, v3, :cond_16

    .line 6729
    const/16 v29, -0x2

    goto/16 :goto_3

    .line 6730
    :cond_16
    const/4 v3, -0x6

    move/from16 v0, v17

    if-ne v0, v3, :cond_17

    .line 6731
    const/16 v29, -0x3

    goto/16 :goto_3

    .line 6732
    :cond_17
    const/4 v3, -0x5

    move/from16 v0, v17

    if-ne v0, v3, :cond_18

    .line 6733
    const/16 v29, -0x14

    goto/16 :goto_3

    .line 6736
    :cond_18
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v3}, Lcom/android/server/pm/PackageManagerService$InstallParams;->installLocationPolicy(Landroid/content/pm/PackageInfoLite;I)I

    move-result v17

    .line 6737
    const/4 v3, -0x7

    move/from16 v0, v17

    if-ne v0, v3, :cond_19

    .line 6738
    const/16 v29, -0x19

    goto/16 :goto_3

    .line 6739
    :cond_19
    if-nez v21, :cond_0

    if-nez v20, :cond_0

    .line 6741
    const/4 v3, 0x2

    move/from16 v0, v17

    if-ne v0, v3, :cond_1a

    .line 6743
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    or-int/lit8 v3, v3, 0x8

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    .line 6744
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v3, v3, -0x11

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    goto/16 :goto_3

    .line 6748
    :cond_1a
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    or-int/lit8 v3, v3, 0x10

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    .line 6749
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v3, v3, -0x9

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    goto/16 :goto_3

    .line 6773
    .end local v17           #loc:I
    .restart local v13       #args:Lcom/android/server/pm/PackageManagerService$InstallArgs;
    .restart local v34       #userIdentifier:I
    :cond_1b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #getter for: Lcom/android/server/pm/PackageManagerService;->mRequiredVerifierPackage:Ljava/lang/String;
    invoke-static {v5}, Lcom/android/server/pm/PackageManagerService;->access$2700(Lcom/android/server/pm/PackageManagerService;)Ljava/lang/String;

    move-result-object v5

    move/from16 v0, v34

    invoke-virtual {v3, v5, v0}, Lcom/android/server/pm/PackageManagerService;->getPackageUid(Ljava/lang/String;I)I

    move-result v27

    goto/16 :goto_4

    .line 6847
    .restart local v4       #verification:Landroid/content/Intent;
    .restart local v12       #N:I
    .restart local v26       #receivers:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .restart local v27       #requiredUid:I
    .restart local v33       #sufficientVerifiers:Ljava/util/List;,"Ljava/util/List<Landroid/content/ComponentName;>;"
    .restart local v35       #verificationId:I
    .restart local v36       #verificationState:Lcom/android/server/pm/PackageVerificationState;
    :cond_1c
    const/16 v16, 0x0

    .local v16, i:I
    :goto_9
    move/from16 v0, v16

    if-ge v0, v12, :cond_8

    .line 6848
    move-object/from16 v0, v33

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/content/ComponentName;

    .line 6850
    .local v37, verifierComponent:Landroid/content/ComponentName;
    new-instance v32, Landroid/content/Intent;

    move-object/from16 v0, v32

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 6851
    .local v32, sufficientIntent:Landroid/content/Intent;
    move-object/from16 v0, v32

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 6853
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v3, v3, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    invoke-virtual/range {p0 .. p0}, Lcom/android/server/pm/PackageManagerService$InstallParams;->getUser()Landroid/os/UserHandle;

    move-result-object v5

    move-object/from16 v0, v32

    invoke-virtual {v3, v0, v5}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 6847
    add-int/lit8 v16, v16, 0x1

    goto :goto_9

    .line 6891
    .end local v4           #verification:Landroid/content/Intent;
    .end local v12           #N:I
    .end local v16           #i:I
    .end local v26           #receivers:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v32           #sufficientIntent:Landroid/content/Intent;
    .end local v33           #sufficientVerifiers:Ljava/util/List;,"Ljava/util/List<Landroid/content/ComponentName;>;"
    .end local v35           #verificationId:I
    .end local v36           #verificationState:Lcom/android/server/pm/PackageVerificationState;
    .end local v37           #verifierComponent:Landroid/content/ComponentName;
    :cond_1d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/pm/PackageManagerService$InstallParams;->this$0:Lcom/android/server/pm/PackageManagerService;

    #getter for: Lcom/android/server/pm/PackageManagerService;->mContainerService:Lcom/android/internal/app/IMediaContainerService;
    invoke-static {v3}, Lcom/android/server/pm/PackageManagerService;->access$300(Lcom/android/server/pm/PackageManagerService;)Lcom/android/internal/app/IMediaContainerService;

    move-result-object v3

    const/4 v5, 0x1

    invoke-virtual {v13, v3, v5}, Lcom/android/server/pm/PackageManagerService$InstallArgs;->copyApk(Lcom/android/internal/app/IMediaContainerService;Z)I

    move-result v29

    goto/16 :goto_5
.end method

.method public isForwardLocked()Z
    .locals 1

    .prologue
    .line 6922
    iget v0, p0, Lcom/android/server/pm/PackageManagerService$InstallParams;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method