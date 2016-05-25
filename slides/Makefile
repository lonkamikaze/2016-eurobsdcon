CLEANUP=	aux log nav out snm toc
NAME=		beamer
MEDIA=		logo arch_powerd arch_powerd++ freebsd-logo
DRAWINGS=	../drawings/*.tex
IMAGES=		../images/*
DATA=		../data/*

${NAME}.pdf: ${NAME}.tex ${DRAWINGS} ${MEDIA:C/$/.pdf/} ${IMAGES} ${DATA}
	xelatex ${NAME}
	xelatex ${NAME}

clean:
	rm -f ${CLEANUP:C/^/${NAME}./} ${MEDIA:C/$/.pdf/}

.for media in ${MEDIA}
${media}.pdf: ../media/${media}.svg
	inkscape --file=$> --export-area-page --export-pdf=$@ --without-gui

.endfor
