; --------------------------------------------------------------
; Hotstrings
; --------------------------------------------------------------
:*:;ah::autohotkey `
:*:;ow::openwrt `
:*:;vs::vs code `
:*:;ps::powershell `

; shell snippets
:*:;shz::grep -q $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells && chsh -s $(which zsh)
:*:;shb::grep -q $(which bash) /etc/shells || echo $(which bash) | sudo tee -a /etc/shells && chsh -s $(which bash)

:*:;iad::wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz && tar xvf AdGuardHome_linux_amd64.tar.gz && cd AdGuardHome && sudo ./AdGuardHome -s install
:*:;idd::git clone --recurse-submodules https://github.com/dotiful/dotdrop ~/dotfiles && cd ~/dotfiles && pip3 install --user -r ./dotdrop/requirements.txt && ./dotdrop.sh install -p base
