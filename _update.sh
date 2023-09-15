lecture_file=lecture_files/Lecture$1.md
git add $lecture_file
git commit -m "Adding lecture notes for Lecture $1"
git push
rm -rf _build
jupyter-book build .
ghp-import -n -p -f _build/html
