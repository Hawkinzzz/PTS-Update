#!/bin/bash
#
# Title:      PTS major file
# org.Author(s):  Admin9705 - Deiteq
# Mod from MrDoob for PTS
# GNU:        General Public License v3.0
################################################################################

start0() {
mainstart
cleartabs
info
alias
owned
check
}

mainstart() {
  file="/opt/pgstage/place.holder"
  waitvar=0
  while [ "$waitvar" == "0" ]; do
    sleep .5
    if [ -e "$file" ]; then waitvar=1; fi
  done
   ansible-playbook /opt/ptsupdate/autoupdate/version/choice.yml 1>/dev/null 2>&1
}

cleartabs() {
truncate -s 0 /var/plexguide/logs/*
}

info() {
  printf '
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Please wait a moment , we do all for you now
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
'
}
########end funtions // execute commands
alias() {
  ansible-playbook /opt/plexguide/menu/alias/alias.yml 1>/dev/null 2>&1
}

owned() {
  chown -cR 1000:1000 /opt/plexguide
  chmod -R 775 /opt/plexguide
}

check() {
file="/opt/plexguide/menu/pg.yml"
  if [[ -f $file ]]; then
  printf '
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ All files Valid and > PTS is up to date <
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
'
 else ansible-playbook /opt/plexguide/menu/version/missing_pull.yml; fi
}
