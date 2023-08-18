lecture_file=lecture_files/Lecture$1.md
if [[ -z $(grep "Goals" $lecture_file) ]]; then
	echo "Need to define goals for the lecture"
else
	if [[ -z $(grep "Reading" $lecture_file) ]]; then
        read -p "Need to add readings to the lecture"
    fi;
    if [[ ! -z $(grep "reference-type" $lecture_file) ]]; then
        read -p "Check for remnants"
    fi;
    if [[ ! -z $(grep "width" $lecture_file) ]]; then
        read -p "Check for remnants"
    fi;
    if [[ -z $(grep "admonition" $lecture_file) ]]; then
        read -p "Do you want to add examples?"
    fi;
    title=$1-$(grep "\# " $lecture_file | head -n 1 | cut -d' ' -f 2,3,4,5,6,7)
#    title="${title// /\ }"
    echo $title
    
    if [[ -z $(grep "Link to Shared Notes" $lecture_file) ]]; then
        cp ./playground/blank.docx "playground/$title.docx"
        mv playground/$1-*.docx ../Shared\ Notes/.
        echo -e "\n\n" >> $lecture_file
        echo "## [Link to Shared Notes](" >> $lecture_file
        read -p "Waiting for you to add the link..."
    fi;
    
    git add $lecture_file
    git add lecture_files/figs/*$1*
    git commit -m "Adding lecture notes for Lecture $1"
    git push
    rm -rf _build
    jupyter-book build .
    ghp-import -n -p -f _build/html
fi;
