#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# File              : command.py
# Author            : Jeff LANCE <email@jefflance.me>
# Date              : 12.05.2021
# Last Modified Date: 12.05.2021
# Last Modified By  : Jeff LANCE <email@jefflance.me>

import os
from ranger.core.loader import CommandLoader
from ranger_udisk_menu.mounter import mount


class extract_here(Command):
    def execute(self):
        """extract selected files to current directory."""
        cwd = self.fm.thisdir
        marked_files = tuple(cwd.get_selection())

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = marked_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ["-x", cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ["-e"]

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(marked_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(one_file.dirname)
        obj = CommandLoader(
            args=["aunpack"] + au_flags + [f.path for f in marked_files],
            descr=descr,
            read=True,
        )

        obj.signal_bind("after", refresh)
        self.fm.loader.add(obj)


class compress(Command):
    def execute(self):
        """Compress marked files to current directory"""
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(
            args=["apack"]
            + au_flags
            + [os.path.relpath(f.path, cwd.path) for f in marked_files],
            descr=descr,
            read=True,
        )

        obj.signal_bind("after", refresh)
        self.fm.loader.add(obj)

    def tab(self, tabnum):
        """Complete with current folder name"""

        extension = [".zip", ".tar.gz", ".rar", ".7z"]
        return [
            "compress " + os.path.basename(self.fm.thisdir.path) + ext
            for ext in extension
        ]


class mkcd(Command):
    """
    :mkcd <dirname>

    Creates a directory with the name <dirname> and enters it.
    """

    def execute(self):
        from os.path import join, expanduser, lexists
        from os import makedirs
        import re

        dirname = join(self.fm.thisdir.path, expanduser(self.rest(1)))
        if not lexists(dirname):
            makedirs(dirname)

            match = re.search("^/|^~[^/]*/", dirname)
            if match:
                self.fm.cd(match.group(0))
                dirname = dirname[match.end(0) :]

            for m in re.finditer("[^/]+", dirname):
                s = m.group(0)
                if s == ".." or (
                    s.startswith(".") and not self.fm.settings["show_hidden"]
                ):
                    self.fm.cd(s)
                else:
                    ## We force ranger to load content before calling `scout`.
                    self.fm.thisdir.load_content(schedule=False)
                    self.fm.execute_console("scout -ae ^{}$".format(s))
        else:
            self.fm.notify("file/directory exists!", bad=True)
