These scripts allows easily launching games (and any other graphic app)
remotely in a Sunshine server.

Place the scripts in a place like ~/.local/bin.

Next, in the server, you need to create an entry in your apps list.
The app must launch the run_moonlight_cmdline.sh script.
You can name it whatever you want.

Now, in the client, you have to edit the cloud_play.sh script.

The HOST_NAME and HOST_USER variables must contain your server
name or IP and your user name. They are used by ssh and scp in order
to executing command lines and copy files.

Next you need to set the SUNSHINE_HOST and CMDLINE_APP variables.

When running the client scripts in Linux, these contains your Sunshine
hostname and the previously created app entry name.

In Android, things goes a bit different. You need to open Moonlight and
check both your server and the app UUID, and set the variables to them.

No passwords are set because, first, no one can connect your Sunshine
server if you do not grant access previously, and, for SSH, it is a lot
more recommended to use private and public keys.

Setting them is quite simple. In the client side run:
ssh-keygen -f ~/.ssh/for_sunshine

and leave blank the password when asked to enter one.

This will generate two files: for_sunshine and for_sunshine.pub.

Now you can do:
ssh-copy-id -i ~/.ssh/for_sunshine.pub your_user@sunshine_host

When the server asks you for your password, enter it.
Now, your public key will be registered in the server.

One last thing is recommended. Edit the ~/.ssh/config file at the client
and add these lines:

Host sunshine
    Hostname sunshine_host
    Port ssh_port
    User your_user
    IdentityFile ~/.ssh/for_sunshine

You can ommit the Port line if your Sunshine server uses
the default port for SSH.

Don't forget replacing sunshine_host with your host name or IP,
your_user with your user name, etc...

Now you can try a thing like this:
ssh your_user@sunshine_host "uname -a"

Depending of your connection speed, you will see in a while a
response of your server, telling its Kernel type and other things.
