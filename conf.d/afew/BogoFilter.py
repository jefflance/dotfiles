#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File              : BogoFilter.py
# Author            : Jeff LANCE <email@jefflance.me>
# Date              : 05.05.2020
# Last Modified Date: 05.05.2020
# Last Modified By  : Jeff LANCE <email@jefflance.me>

import subprocess
import os

from afew.filters.BaseFilter  import Filter
from afew.FilterRegistry import register_filter
from afew.NotmuchSettings import get_notmuch_new_tags, get_notmuch_new_query


# path to binary
bogofilter = '/usr/bin/bogofilter'


class pOutput(object):
    path = ''
    mailType = ''


# function for creating objects out of
# bogofilter output
def processOutput(path, mailType):
    processed = pOutput()
    processed.path = path
    processed.mailType = mailType
    return processed


# classification function
def isSpam(path):
    p = subprocess.run([bogofilter, "-BT", path], stdout=subprocess.PIPE)
    output = p.stdout.decode('ascii')
    output = output.split(" ")
    processed = processOutput(output[0], output[1])
    # output has to be decoded
    if processed.mailType == 'U' or processed.mailType == 'H':
        return False
    if processed.mailType == 'S':
        return True


@register_filter
class BogoFilter(Filter):
    message = 'Filter message with bogofilter'
    tags = ['+spam']
    tags_blacklist = ['killed', 'spam']

    @property
    def query(self):
        """
        Need to read the notmuch settings first. Using a property here
        so that the setting is looked up on demand.
        """
        return get_notmuch_new_query()


    def handle_message(self, message):
        if isSpam(message.get_filename()):
            self.remove_tags(message, 'new')
            self.add_tags(message, 'spam')
        elif not isSpam(message.get_filename()):
            self.remove_tags(message, 'new')
            self.add_tags(message, 'inbox')
        
        super().handle_message(message)



# vim:ft=python
