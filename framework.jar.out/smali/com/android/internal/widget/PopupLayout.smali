.class public final Lcom/android/internal/widget/PopupLayout;
.super Landroid/widget/LinearLayout;
.source "PopupLayout.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PopupLayout"


# instance fields
.field private mArrowDown:I

.field private mArrowUp:I

.field private mDividerWidth:I

.field private mDrawableDown:Landroid/graphics/drawable/Drawable;

.field private mDrawableUp:Landroid/graphics/drawable/Drawable;

.field private mRect:Landroid/graphics/Rect;

.field mShowArrow:Z

.field private mX:I

.field private mY:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v1, #drawable@yi_popup_arrow_down#t

    iput v1, p0, Lcom/android/internal/widget/PopupLayout;->mArrowDown:I

    const v1, #drawable@yi_popup_arrow_up#t

    iput v1, p0, Lcom/android/internal/widget/PopupLayout;->mArrowUp:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/internal/widget/PopupLayout;->mShowArrow:Z

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/internal/widget/PopupLayout;->mRect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/android/internal/widget/PopupLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .local v0, resources:Landroid/content/res/Resources;
    iget v1, p0, Lcom/android/internal/widget/PopupLayout;->mArrowDown:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/widget/PopupLayout;->mDrawableDown:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/android/internal/widget/PopupLayout;->mArrowUp:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/widget/PopupLayout;->mDrawableUp:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const v1, #drawable@yi_popup_arrow_down#t

    iput v1, p0, Lcom/android/internal/widget/PopupLayout;->mArrowDown:I

    const v1, #drawable@yi_popup_arrow_up#t

    iput v1, p0, Lcom/android/internal/widget/PopupLayout;->mArrowUp:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/internal/widget/PopupLayout;->mShowArrow:Z

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/internal/widget/PopupLayout;->mRect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/android/internal/widget/PopupLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .local v0, resources:Landroid/content/res/Resources;
    iget v1, p0, Lcom/android/internal/widget/PopupLayout;->mArrowDown:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/widget/PopupLayout;->mDrawableDown:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/android/internal/widget/PopupLayout;->mArrowUp:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/widget/PopupLayout;->mDrawableUp:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public getDrawableWidth()I
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/widget/PopupLayout;->mDrawableDown:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .parameter "canvas"

    .prologue
    const/4 v6, 0x0

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v7, p0, Lcom/android/internal/widget/PopupLayout;->mShowArrow:Z

    if-nez v7, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v2, p0, Lcom/android/internal/widget/PopupLayout;->mDrawableDown:Landroid/graphics/drawable/Drawable;

    .local v2, drawable:Landroid/graphics/drawable/Drawable;
    iget v7, p0, Lcom/android/internal/widget/PopupLayout;->mY:I

    if-nez v7, :cond_1

    iget-object v2, p0, Lcom/android/internal/widget/PopupLayout;->mDrawableUp:Landroid/graphics/drawable/Drawable;

    :cond_1
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    .local v4, width:I
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    .local v3, height:I
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_3

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :goto_1
    invoke-static {v4, v3, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .local v0, bitmap:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .local v1, c:Landroid/graphics/Canvas;
    invoke-virtual {v2, v6, v6, v4, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget v7, p0, Lcom/android/internal/widget/PopupLayout;->mX:I

    div-int/lit8 v8, v4, 0x2

    sub-int v5, v7, v8

    .local v5, x:I
    iget v7, p0, Lcom/android/internal/widget/PopupLayout;->mY:I

    if-lez v7, :cond_2

    iget v7, p0, Lcom/android/internal/widget/PopupLayout;->mY:I

    sub-int/2addr v7, v3

    add-int/lit8 v6, v7, -0x1

    .local v6, y:I
    :cond_2
    int-to-float v7, v5

    int-to-float v8, v6

    const/4 v9, 0x0

    invoke-virtual {p1, v0, v7, v8, v9}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_0

    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    .end local v1           #c:Landroid/graphics/Canvas;
    .end local v5           #x:I
    .end local v6           #y:I
    :cond_3
    sget-object v7, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    goto :goto_1
.end method

.method public setShowArrow(Z)V
    .locals 1
    .parameter "show"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/widget/PopupLayout;->mShowArrow:Z

    if-eq v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/widget/PopupLayout;->invalidate()V

    :cond_0
    iput-boolean p1, p0, Lcom/android/internal/widget/PopupLayout;->mShowArrow:Z

    return-void
.end method

.method public setXY(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v0, 0x0

    .local v0, reDraw:Z
    iget v1, p0, Lcom/android/internal/widget/PopupLayout;->mX:I

    if-eq v1, p1, :cond_0

    iput p1, p0, Lcom/android/internal/widget/PopupLayout;->mX:I

    const/4 v0, 0x1

    :cond_0
    iget v1, p0, Lcom/android/internal/widget/PopupLayout;->mY:I

    if-eq v1, p2, :cond_1

    iput p2, p0, Lcom/android/internal/widget/PopupLayout;->mY:I

    const/4 v0, 0x1

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/internal/widget/PopupLayout;->invalidate()V

    :cond_2
    return-void
.end method
