rm -f vc-template.zip
find . -name ".DS_Store" | xargs rm
zip -r vc-template.zip figures IEEEtran.bst latexmkrc vc-template.bib vc-template.pdf vc-template.tex vc.cls
