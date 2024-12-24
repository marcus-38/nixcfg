{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    efibootmgr
    git
    gh
    gptfdisk
    parted
    ventoy
    vim
  ];
}
