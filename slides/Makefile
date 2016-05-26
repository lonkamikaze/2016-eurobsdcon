TITLE=		2016 GPN16 Replacing powerd
CLEANUP=	aux log nav out snm toc pdf
NAME=		beamer
MEDIA=		logo arch_powerd arch_powerd++ freebsd-logo
DRAWINGS=	../drawings/*.tex
IMAGES=		../images/*
DATA=		../data/*

${TITLE:Q}.pdf: ${NAME}.pdf
	cp $> $@

${NAME}.pdf: ${NAME}.tex ${DRAWINGS} ${MEDIA:C/$/.pdf/} ${IMAGES} ${DATA}
	xelatex ${NAME}
	xelatex ${NAME}

clean:
	rm -f ${CLEANUP:C/^/${NAME}./} ${MEDIA:C/$/.pdf/}

.for media in ${MEDIA}
${media}.pdf: ../media/${media}.svg
	inkscape --file=$> --export-area-page --export-pdf=$@ --without-gui

.endfor
