# OfflineIMAP as a Docker container

[OfflineIMAP official project](https://github.com/OfflineIMAP/offlineimap) on Github

OfflineIMAP is software that downloads your email mailbox(es) as local Maildirs. OfflineIMAP will synchronize both sides via IMAP.

## OfflineIMAP community's website
<https://www.offlineimap.org/>

## Usage example
```
mkdir -p offlineimap/{home,repo}
wget -O offlineimap/offlineimap.conf \
  https://raw.githubusercontent.com/OfflineIMAP/offlineimap/master/offlineimap.conf.minimal
sudo chown -R 100 offlineimap

docker run --rm \
  -v ${PWD}/offlineimap/offlineimap.conf:/offlineimap.conf:ro \
  -v ${PWD}/offlineimap/home/:/home/imapuser/.offlineimap/ \
  -v ${PWD}/offlineimap/repo/:/localrepo/ \
  starina/offlineimap:latest
```

### Note
By default, the container runs as user:group `imapuser:nogroup` (`uid:gid` `100:65533`). So, you must give rw permissions to this user/group on mounted volumes.
