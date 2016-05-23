beamer.pdf: beamer.tex logo.pdf
	xelatex beamer
	xelatex beamer

logo.pdf: ../media/logo.svg
	inkscape --file=$> --export-area-page --export-pdf=$@ --without-gui
