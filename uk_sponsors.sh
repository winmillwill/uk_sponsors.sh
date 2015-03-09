#!/bin/bash

set -e
set -o pipefail

pushd /tmp &>/dev/null

base_url='https://www.gov.uk'
url="${base_url}/government/publications/register-of-licensed-sponsors-workers"
pdf_ref="$(xidel -q $url -e "//a/extract(@href, '.*\.pdf')" | grep pdf | uniq)"

pdf_file=${pdf_ref##*/}
if [[ ! -f $pdf_file ]];
then
  wget "${base_url}${pdf_ref}"
fi

html_file=${pdf_file%.*}.html
if [[ ! -f $html_file ]];
then
  pdftohtml -c -noframes -q ${pdf_file} ${html_file}
fi

xidel -q ${html_file} -e "//div[ends-with(@style, 'left:36')]"

popd /tmp &>/dev/null
