{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = false;
    })
  ];
}
