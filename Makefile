SHELL   = /bin/sh

FILE0   = cv-piotr-kowalski
TEX     = $(FILE0).tex
XDV     = $(FILE0).xdv
PDF     = $(FILE0).pdf
PDFOUT  = $(FILE0)-encrypted.pdf


all:
	make tex

tex:
	xelatex -no-pdf $(TEX)
	xelatex -no-pdf $(TEX)
	#xdvipdfmx.exe $(XDV)
	xelatex $(TEX)
	make clean
pw:
	pdftk $(PDF) output $(PDFOUT) owner_pw ownerpasswd user_pw userpasswd compress encrypt_128bit

help:
	echo "USAGE: make [all/tex/handout/pw/clean]"

clean:
	rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.nav *.out *.snm *.xdv *.toc *~

