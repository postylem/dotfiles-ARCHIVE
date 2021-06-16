$pdflatex = 'xelatex -interaction=nonstopmode -file-line-error -shell-escape -synctex=1';

$clean_ext = 'synctex.gz synctex.gz(busy) run.xml tex.bak bbl bcf fdb_latexmk run tdo xdv %R-blx.bib';

# If zero, check for a previously running previewer on the same file and update it.  If nonzero, always start a new previewer.
$new_viewer_always = 0;

# vim: ft=perl
