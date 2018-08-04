pandoc ../10-introduction.md ../20-chapter1.md ../30-chapter2.md ../40-chapter3.md ../90-conclusion.md --bibliography=../../assets/bibliography.bib --biblatex -o body.tex
mkdir -p build
pdflatex -output-directory=build main
biber -output-directory=build main --output-safechars
pdflatex -output-directory=build main
pdflatex -output-directory=build main
mv ./build/main.pdf ./
pandoc -s main.tex --bibliography=../../assets/bibliography.bib -o main.docx
rm -r build