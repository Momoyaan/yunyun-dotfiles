{
services.nfs.server = {
  enable = true;
  exports = ''
    /export         192.168.254.107(rw,fsid=0,insecure,no_subtree_check)
    /export/media   192.168.254.107(rw,nohide,insecure,no_subtree_check) 
    /export/media2  192.168.254.107(rw,nohide,insecure,no_subtree_check)
  '';
  };
}
