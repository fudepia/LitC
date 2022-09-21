$(CC) = g++

file?=source.lit.c
texTemplate?=template.tex

all: tex pdf c strip # md
tex-pdf: tex pdf

c:
	$(CC) $(file)

strip:
	sed -i "s/\/\/cb<//g" $(file)
	sed -i "s/\/\/>cb//g" $(file)
	awk -i inplace 'BEGIN {RS="";ORS="\n\n"}{gsub(/\/\*((.|\n)*)\*\//,""); print;}' $(file)

texbody:
	cp $(file) $(file).texbody
	sed -i "s/\/\/cb</\\\\begin{code}/g"   $(file).texbody
	sed -i "s/\/\/>cb/\\\\end{code}/g"     $(file).texbody
	sed -i "s/\/\* \(.*\)/\\\\begin{\1}/g" $(file).texbody
	sed -i "s/\(.*\) \*\//\\\\end{\1}/g"   $(file).texbody
	sed -i "s/\/\/ \(.*\)$$/\1/g"          $(file).texbody

tex: texbody
	cp $(texTemplate) $(file).tex
	ed -s $(file).tex <<< $$'/<body>/d\nr $(file).texbody\nw'

pdf: tex
	$(TEX) $(file).tex
	$(TEX) $(file).tex
