rm -f vc-template.zip
find . -name ".DS_Store" | xargs rm
zip -r vc-template.zip figures IEEEtran.bst latexmkrc template.bib template.pdf template.tex vc.cls
