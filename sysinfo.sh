#!/bin/bash

source $(pwd)/functions

usage() { echo "Usage: $0 -c <command_list_file> -o <html_output_file>" 1>&2; }

while getopts ":c:o::h" opt; do
  case $opt in
    c)
      export txt_cmds=$OPTARG
      ;;
    o)
      export ofile=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
    h|*)
      usage
      exit 0
      ;;
  esac
done

[ -z ${ofile} ] && export ofile='sysinfo.html'
[ -f ${txt_cmds} ] && runner_html || usage
