# Artificial Stupidity

It's a tiny [Adhearsion](http://adhearsion.com) application thats try to emulate that weird [russian speaking ABC](http://www.youtube.com/watch?v=X_sV2M4qhz4) with all of it's martian logic glory.

To see (or hear) it in action, firstly, you'll need to configure your VoIP platform. It's been developed with Asterisk 1.8 in mind, so I'll provide settings for it. It must work with other Adhearsion platforms, but this is untested.

## Configure the Asterisk

Edit `extensions.conf` to include the following:

```
[adhearsion]
exten => _.,1,AGI(agi:async)
```

and setup a user (adhearsion:adhearsion) in `manager.conf` with read/write access to `all`.

If you are using Asterisk 1.8, you will need to add an additional context with the name `adhearsion-redirect`. On Asterisk 10 and above this is auto-provisioned.

## Transcoding the samples

In case if you want to change the format of samples the source versions in the 'samples/source' subdirectory. There are some converting scripts using ffmpeg and/or sox there too.
By default samples are in gsm format. Sorry for poor sound quality, but it's best what I can get from the source video.

## Prepare environment

Just fire up the usual 'bundle install'.

## Hear it!

Start your new app with "ahn start". You'll get a lovely console and should be presented with the ABC quiz just like in the mentioned video when you call in.
