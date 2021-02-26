#!/bin/bash
# File              : poll.sh
# Author            : Jeff LANCE <email@jefflance.me>
# Date              : 10.02.2015
# Last Modified Date: 07.05.2020
# Last Modified By  : Jeff LANCE <email@jefflance.me>

# Set some constants
MAILDIR=${HOME}/Mail

echo "[Begin astroid] $(basename $0) script"


function test_connection() {
  # Check if we have a connection
  status=1
  if ! ping -w 1 -W 1 -c 1 mail.google.com; then
    status=0
  fi
  echo ${status}
}

function test_maildir() {
  # Check if ${MAILDIR} exists
  status=1
  if [ ! -d ${MAILDIR} ]; then
    status=0
  fi
  echo ${status}
}

function deal_with_spam() {
  echo "Dealing with old spam"
  notmuch tag --remove-all +deleted -spam \
    -- tag:spam folder:"/junk/" date:..7d 
}


function purge_trash() {
  echo "Purging trash"
  notmuch search --output=files --format=text0 \
    -- tag:deleted date:...7d \
    folder:"/trash/" | xargs -0 --no-run-if-empty rm
}

function sync_mail() {
  # Sync new mail.
  echo "Syncing mails !"
  mbsync -a
}

function tag_new() {
  notmuch tag "$1 tag:inbox and $2"
}

function sync_db() {
  # Import new mail into the notmuch database.
  echo "Update database"
  NEW_MAIL=false
  if ! (notmuch new | grep "No new mail."); then
      NEW_MAIL=true

      ## Tag test mail
      #tag_new "+test" "from:email@jefflance.me and subject:TEST"

      ## Tag all mail from
      #tag_new "+evariste" "from:ce.0932047v@ac-creteil.fr"

      ## We've finished processing incoming mail
      #tag_new "-inbox" "tag:test"
  fi

  if [ $NEW_MAIL = true ]; then
      notify-send \
        -i /usr/share/notify-osd/icons/hicolor/scalable/status/notification-message-email.svg -c Mail 'New mail.' 'You received new mails.'
  fi
}

function refresh() {
  # Refresh the display of astroid
  revision=$(notmuch count --lastmod | cut -f3)
  echo "Refresh window"
  astroid --refresh ${revision}
}

if [ test_connection ]; then
  if [ test_maildir ]; then
    # deal_with_spam
    purge_trash
    # sync_mail
    # sync_db
    # refresh
  else
    echo "[ASTROID]: no maildir"
  fi
else
  echo "[ASTROID]: no connection"
fi

# We stop polling
# astroid --stop-polling

echo "[End   astroid] $(basename $0) script"

# vim:ft=sh
