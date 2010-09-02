##
# Generic logging subroutines.
#
# Copyright 2010 Tom Vincent <http://www.tlvince.com/>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

##
# Print an informational message to stdout and optionally $LOG.
#
# @param $1 string  An arbitrary informational message.
#
info()
{
    echo "${0##*/}: $1"     # Bash-ism: equivalent to basname
    [[ $LOG ]] && echo "$(date +"%F %T") :: $1" >> "$LOG"
}

##
# Prefix a warning message and redirect to stderr.
#
# @param $1 string  An arbitrary warning message.
#
warn()
{
    info "error: $1" >&2
}

##
# Print an error message and exit.
#
# @param $1 string  An arbitrary error message.
# @param $2 int     An optional arbitrary exit code, otherwise the exit code of
#                   the last ran command.
#
die()
{
    local st="$?"
    warn "$1"
    [[ $2 ]] && exit $2 || exit $st
}
