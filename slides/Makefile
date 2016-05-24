CLEANUP=	aux log nav out snm toc
NAME=		beamer
MEDIA=		logo arch_powerd arch_powerd++

${NAME}.pdf: ${NAME}.tex ${MEDIA:C/$/.pdf/}
	xelatex ${NAME}
	xelatex ${NAME}

clean:
	rm -f ${CLEANUP:C/^/${NAME}./} ${MEDIA:C/$/.pdf/}

.for media in ${MEDIA}
${media}.pdf: ../media/${media}.svg
	inkscape --file=$> --export-area-page --export-pdf=$@ --without-gui

.endfor
