# ietf drafts

VERSION=06

D=draft-levine-dbound-dns-${VERSION}.txt

all:	${D}

${D}:	%.txt:	%.xml
	rm -f $@ ${@:.txt=.html}
	xml2rfc --v3 --text $<
	xml2rfc --v3 --html $<
	chmod 444 $@ ${@:.txt=.html}

%.xml:	%.md
	mmark $< > tmp && mv tmp $@

