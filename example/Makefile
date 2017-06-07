file = example
OPT = 

all:
	pdflatex $(OPT) $(file).tex; pdflatex $(OPT) $(file).tex; evince $(file).pdf &

compile:
	pdflatex $(OPT) $(file).tex;

clean:
	rm -f *~ *.aux *.log *.nav *.out *.pyg *.snm *.toc *.vrb
