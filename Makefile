targets = bashref
note_pic = $(wildcard box_*.jpg)
misc_pic = $(wildcard *.png)
sh = $(wildcard *.sh)
tex = $(addsuffix .tex, $(basename $(wildcard *.sh)))

.PHONY: all clean delete $(targets)
all: $(targets)

$(targets): %: %.pdf
$(tex): %.tex: %.sh
$(ind): %.ind: %.idx

%.pdf: $(misc_pic) $(note_pic)

%.pdf: %.tex $(tex) test
	[ -s $*.idx ] && makeindex $*.idx
	pdflatex $<

test: $(addsuffix .tex, $(targets)) $(tex) $(ind)
	pdflatex $?

$(tex): %.tex: %.sh vimrc
	vim -n -i NONE $< -c 'source vimrc' > /dev/null 2>&1

clean:
	$(RM) $(filter-out %.tex %.pdf, $(wildcard $(addsuffix .*, $(targets))))
	$(RM) $(filter-out %.sh, $(wildcard $(addsuffix .*, $(basename $(wildcard *.sh)))))
	$(RM) $(wildcard *.log)

delete:
	$(RM) $(addsuffix .pdf, $(targets))
