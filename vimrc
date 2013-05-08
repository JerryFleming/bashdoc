let html_use_css = 1
let html_output_xhtml = 1
let html_whole_filler=1
let use_xhtml = 1
let html_use_encoding = 'utf-8'

set number
set wrap
set tabstop=4
set shiftwidth=4
set textwidth=72
set syntax
set noexpandtab

colorscheme delek

source /usr/share/vim/vim72/syntax/2html.vim

" the rest line will insert new backslashes, so the original have to be marked
" dirrerently
%s/\\/\\textbackslashes/g
%s/{\|}\|_/\\&/g
%s@\#@\\#@g
%s@%@\\%@g
%s@\$@\\$@g
%s/    /\\tab{}/g
%s/\^/\\textasciicircum{}/g
%s/\~/\\textasciitilde{}/g
%s@&amp;@\\\&@g
%s@&gt;@>@g
%s@&lt;@<@g
%s/&quot;/"/g
%s@'@\\char13{}@g
%s@<span class="\(.\{-\}\)">\(.\{-\}\)</span>@\\code\1{\2}@g
%s@\(codelnr{\)\([0-9 ]\+ \)}@\=submatch(1).substitute(submatch(2),' ', '\\\\ ', 'g').'}'@g
%s/textbackslashes/textbackslash{}/g
/^<pre>/+1mark a
/^<\/pre>/-1mark b
0,'b-1s@$@\\\\@g
'a,'bwrite! %:.:r:r.tex
qall!
