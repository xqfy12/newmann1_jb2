.class public Landroid/app/Notification$BigTextStyle;
.super Landroid/app/Notification$Style;
.source "Notification.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/Notification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BigTextStyle"
.end annotation


# instance fields
.field private mBigText:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1882
    invoke-direct {p0}, Landroid/app/Notification$Style;-><init>()V

    .line 1883
    return-void
.end method

.method public constructor <init>(Landroid/app/Notification$Builder;)V
    .locals 0
    .parameter "builder"

    .prologue
    .line 1885
    invoke-direct {p0}, Landroid/app/Notification$Style;-><init>()V

    .line 1886
    invoke-virtual {p0, p1}, Landroid/app/Notification$BigTextStyle;->setBuilder(Landroid/app/Notification$Builder;)V

    .line 1887
    return-void
.end method

.method private makeBigContentView()Landroid/widget/RemoteViews;
    .locals 8

    .prologue
    const v7, 0x1020330

    const/4 v2, 0x0

    .line 1917
    iget-object v1, p0, Landroid/app/Notification$Style;->mBuilder:Landroid/app/Notification$Builder;

    #getter for: Landroid/app/Notification$Builder;->mContentText:Ljava/lang/CharSequence;
    invoke-static {v1}, Landroid/app/Notification$Builder;->access$700(Landroid/app/Notification$Builder;)Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/app/Notification$Style;->mBuilder:Landroid/app/Notification$Builder;

    #getter for: Landroid/app/Notification$Builder;->mSubText:Ljava/lang/CharSequence;
    invoke-static {v1}, Landroid/app/Notification$Builder;->access$400(Landroid/app/Notification$Builder;)Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_1

    const/4 v6, 0x1

    .line 1918
    .local v6, hadThreeLines:Z
    :goto_0
    iget-object v1, p0, Landroid/app/Notification$Style;->mBuilder:Landroid/app/Notification$Builder;

    const/4 v3, 0x0

    #setter for: Landroid/app/Notification$Builder;->mContentText:Ljava/lang/CharSequence;
    invoke-static {v1, v3}, Landroid/app/Notification$Builder;->access$702(Landroid/app/Notification$Builder;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1920
    const v1, 0x1090092

    invoke-virtual {p0, v1}, Landroid/app/Notification$BigTextStyle;->getStandardView(I)Landroid/widget/RemoteViews;

    move-result-object v0

    .line 1922
    .local v0, contentView:Landroid/widget/RemoteViews;
    if-eqz v6, :cond_0

    .line 1924
    const v1, 0x102032f

    move v3, v2

    move v4, v2

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/widget/RemoteViews;->setViewPadding(IIIII)V

    .line 1927
    :cond_0
    iget-object v1, p0, Landroid/app/Notification$BigTextStyle;->mBigText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v7, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 1928
    invoke-virtual {v0, v7, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 1929
    const v1, 0x1020015

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 1931
    return-object v0

    .end local v0           #contentView:Landroid/widget/RemoteViews;
    .end local v6           #hadThreeLines:Z
    :cond_1
    move v6, v2

    .line 1917
    goto :goto_0
.end method


# virtual methods
.method public bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;
    .locals 0
    .parameter "cs"

    .prologue
    .line 1911
    iput-object p1, p0, Landroid/app/Notification$BigTextStyle;->mBigText:Ljava/lang/CharSequence;

    .line 1912
    return-object p0
.end method

.method public build()Landroid/app/Notification;
    .locals 2

    .prologue
    .line 1936
    invoke-virtual {p0}, Landroid/app/Notification$BigTextStyle;->checkBuilder()V

    .line 1937
    iget-object v1, p0, Landroid/app/Notification$Style;->mBuilder:Landroid/app/Notification$Builder;

    #calls: Landroid/app/Notification$Builder;->buildUnstyled()Landroid/app/Notification;
    invoke-static {v1}, Landroid/app/Notification$Builder;->access$500(Landroid/app/Notification$Builder;)Landroid/app/Notification;

    move-result-object v0

    .line 1938
    .local v0, wip:Landroid/app/Notification;
    invoke-direct {p0}, Landroid/app/Notification$BigTextStyle;->makeBigContentView()Landroid/widget/RemoteViews;

    move-result-object v1

    iput-object v1, v0, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;

    .line 1939
    return-object v0
.end method

.method public setBigContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;
    .locals 0
    .parameter "title"

    .prologue
    .line 1894
    invoke-virtual {p0, p1}, Landroid/app/Notification$BigTextStyle;->internalSetBigContentTitle(Ljava/lang/CharSequence;)V

    .line 1895
    return-object p0
.end method

.method public setSummaryText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;
    .locals 0
    .parameter "cs"

    .prologue
    .line 1902
    invoke-virtual {p0, p1}, Landroid/app/Notification$BigTextStyle;->internalSetSummaryText(Ljava/lang/CharSequence;)V

    .line 1903
    return-object p0
.end method