.class Landroid/bluetooth/BluetoothDeviceProfileState$1;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothDeviceProfileState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/bluetooth/BluetoothDeviceProfileState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/bluetooth/BluetoothDeviceProfileState;


# direct methods
.method constructor <init>(Landroid/bluetooth/BluetoothDeviceProfileState;)V
    .locals 0
    .parameter

    .prologue
    .line 131
    iput-object p1, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 134
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, action:Ljava/lang/String;
    const-string v8, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    .line 136
    .local v2, device:Landroid/bluetooth/BluetoothDevice;
    if-eqz v2, :cond_0

    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    #getter for: Landroid/bluetooth/BluetoothDeviceProfileState;->mDevice:Landroid/bluetooth/BluetoothDevice;
    invoke-static {v8}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$700(Landroid/bluetooth/BluetoothDeviceProfileState;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 138
    :cond_1
    const-string v8, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 139
    const-string v8, "android.bluetooth.profile.extra.STATE"

    const/4 v9, 0x0

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 140
    .local v4, newState:I
    const-string v8, "android.bluetooth.profile.extra.PREVIOUS_STATE"

    const/4 v9, 0x0

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 142
    .local v5, oldState:I
    const-string v8, "BluetoothDeviceProfileState"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Receive action: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "old state:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " --> new state:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    const/4 v8, 0x2

    if-ne v4, v8, :cond_2

    .line 144
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/4 v9, 0x1

    #calls: Landroid/bluetooth/BluetoothDeviceProfileState;->setTrust(I)V
    invoke-static {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$800(Landroid/bluetooth/BluetoothDeviceProfileState;I)V

    .line 146
    :cond_2
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    #setter for: Landroid/bluetooth/BluetoothDeviceProfileState;->mA2dpState:I
    invoke-static {v8, v4}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$902(Landroid/bluetooth/BluetoothDeviceProfileState;I)I

    .line 147
    const/4 v8, 0x2

    if-ne v5, v8, :cond_3

    if-nez v4, :cond_3

    .line 149
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/16 v9, 0x35

    invoke-virtual {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->sendMessage(I)V

    .line 151
    :cond_3
    const/4 v8, 0x2

    if-eq v4, v8, :cond_4

    if-nez v4, :cond_0

    .line 153
    :cond_4
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/16 v9, 0x66

    invoke-virtual {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->sendMessage(I)V

    goto :goto_0

    .line 155
    .end local v4           #newState:I
    .end local v5           #oldState:I
    :cond_5
    const-string v8, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 156
    const-string v8, "android.bluetooth.profile.extra.STATE"

    const/4 v9, 0x0

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 157
    .restart local v4       #newState:I
    const-string v8, "android.bluetooth.profile.extra.PREVIOUS_STATE"

    const/4 v9, 0x0

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 159
    .restart local v5       #oldState:I
    const-string/jumbo v8, "sync"

    const/4 v9, 0x0

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 162
    .local v1, bIsSync:Z
    const-string v8, "BluetoothDeviceProfileState"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Receive action: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "old state:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " --> new state:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    const/4 v8, 0x2

    if-ne v4, v8, :cond_6

    .line 164
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/4 v9, 0x1

    #calls: Landroid/bluetooth/BluetoothDeviceProfileState;->setTrust(I)V
    invoke-static {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$800(Landroid/bluetooth/BluetoothDeviceProfileState;I)V

    .line 166
    :cond_6
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    #setter for: Landroid/bluetooth/BluetoothDeviceProfileState;->mHeadsetState:I
    invoke-static {v8, v4}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$1002(Landroid/bluetooth/BluetoothDeviceProfileState;I)I

    .line 167
    const/4 v8, 0x2

    if-ne v5, v8, :cond_7

    if-nez v4, :cond_7

    .line 171
    if-nez v1, :cond_7

    .line 173
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/16 v9, 0x33

    invoke-virtual {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->sendMessage(I)V

    .line 178
    :cond_7
    const/4 v8, 0x2

    if-eq v4, v8, :cond_8

    if-nez v4, :cond_0

    .line 180
    :cond_8
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/16 v9, 0x66

    invoke-virtual {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->sendMessage(I)V

    goto/16 :goto_0

    .line 182
    .end local v1           #bIsSync:Z
    .end local v4           #newState:I
    .end local v5           #oldState:I
    :cond_9
    const-string v8, "android.bluetooth.input.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 183
    const-string v8, "android.bluetooth.profile.extra.STATE"

    const/4 v9, 0x0

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 184
    .restart local v4       #newState:I
    const-string v8, "android.bluetooth.profile.extra.PREVIOUS_STATE"

    const/4 v9, 0x0

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 187
    .restart local v5       #oldState:I
    const-string v8, "BluetoothDeviceProfileState"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Receive action: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "old state:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " --> new state:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    const/4 v8, 0x2

    if-ne v4, v8, :cond_a

    .line 189
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/4 v9, 0x1

    #calls: Landroid/bluetooth/BluetoothDeviceProfileState;->setTrust(I)V
    invoke-static {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$800(Landroid/bluetooth/BluetoothDeviceProfileState;I)V

    .line 191
    :cond_a
    const/4 v8, 0x2

    if-ne v5, v8, :cond_b

    if-nez v4, :cond_b

    .line 193
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/16 v9, 0x37

    invoke-virtual {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->sendMessage(I)V

    .line 195
    :cond_b
    const/4 v8, 0x2

    if-eq v4, v8, :cond_c

    if-nez v4, :cond_0

    .line 197
    :cond_c
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/16 v9, 0x66

    invoke-virtual {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->sendMessage(I)V

    goto/16 :goto_0

    .line 199
    .end local v4           #newState:I
    .end local v5           #oldState:I
    :cond_d
    const-string v8, "android.bluetooth.device.action.ACL_DISCONNECTED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 205
    const-string v8, "android.bluetooth.device.action.CONNECTION_ACCESS_REPLY"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_f

    .line 206
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    #getter for: Landroid/bluetooth/BluetoothDeviceProfileState;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v8}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$1100(Landroid/bluetooth/BluetoothDeviceProfileState;)Landroid/os/PowerManager$WakeLock;

    move-result-object v8

    invoke-virtual {v8}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 207
    const-string v8, "android.bluetooth.device.extra.CONNECTION_ACCESS_RESULT"

    const/4 v9, 0x2

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    .line 209
    .local v7, val:I
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/16 v9, 0x68

    invoke-virtual {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    .line 210
    .local v3, msg:Landroid/os/Message;
    if-eqz v3, :cond_e

    .line 212
    iput v7, v3, Landroid/os/Message;->arg1:I

    .line 213
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    invoke-virtual {v8, v3}, Landroid/bluetooth/BluetoothDeviceProfileState;->sendMessage(Landroid/os/Message;)V

    goto/16 :goto_0

    .line 215
    :cond_e
    const-string v8, "BluetoothDeviceProfileState"

    const-string v9, "discard CONNECTION_ACESS_REQUEST_REPLY state"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 217
    .end local v3           #msg:Landroid/os/Message;
    .end local v7           #val:I
    :cond_f
    const-string v8, "android.bluetooth.device.action.PAIRING_REQUEST"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_10

    .line 218
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/4 v9, 0x1

    #setter for: Landroid/bluetooth/BluetoothDeviceProfileState;->mPairingRequestRcvd:Z
    invoke-static {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$1202(Landroid/bluetooth/BluetoothDeviceProfileState;Z)Z

    goto/16 :goto_0

    .line 219
    :cond_10
    const-string v8, "android.bluetooth.device.action.BOND_STATE_CHANGED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 220
    const-string v8, "android.bluetooth.device.extra.BOND_STATE"

    const/high16 v9, -0x8000

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 222
    .local v6, state:I
    const/16 v8, 0xc

    if-ne v6, v8, :cond_11

    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    #getter for: Landroid/bluetooth/BluetoothDeviceProfileState;->mPairingRequestRcvd:Z
    invoke-static {v8}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$1200(Landroid/bluetooth/BluetoothDeviceProfileState;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 223
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/4 v9, 0x1

    #calls: Landroid/bluetooth/BluetoothDeviceProfileState;->setTrust(I)V
    invoke-static {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$800(Landroid/bluetooth/BluetoothDeviceProfileState;I)V

    .line 224
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/4 v9, 0x0

    #setter for: Landroid/bluetooth/BluetoothDeviceProfileState;->mPairingRequestRcvd:Z
    invoke-static {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$1202(Landroid/bluetooth/BluetoothDeviceProfileState;Z)Z

    goto/16 :goto_0

    .line 225
    :cond_11
    const/16 v8, 0xa

    if-ne v6, v8, :cond_0

    .line 226
    iget-object v8, p0, Landroid/bluetooth/BluetoothDeviceProfileState$1;->this$0:Landroid/bluetooth/BluetoothDeviceProfileState;

    const/4 v9, 0x0

    #setter for: Landroid/bluetooth/BluetoothDeviceProfileState;->mPairingRequestRcvd:Z
    invoke-static {v8, v9}, Landroid/bluetooth/BluetoothDeviceProfileState;->access$1202(Landroid/bluetooth/BluetoothDeviceProfileState;Z)Z

    goto/16 :goto_0
.end method
