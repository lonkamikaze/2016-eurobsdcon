CLEANUP=	aux log nav out snm toc
NAME=		beamer

${NAME}.pdf: ${NAME}.tex logo.pdf
	xelatex ${NAME}
	xelatex ${NAME}

clean:
	rm -f ${CLEANUP:C/^/${NAME}./}

logo.pdf: ../media/logo.svg
	inkscape --file=$> --export-area-page --export-pdf=$@ --without-gui
