lecture_file=lecture_files/Lecture$1.md
if [[ -z $(grep "Goals" $lecture_file) ]]; then
	echo "Need to define goals for the lecture"
else
	if [[ -z $(grep "Reading" $lecture_file) ]]; then
		echo "Need to add readings to the lecture"
	else
		if [[ -z $(grep "admonition" $lecture_file) ]]; then
			echo "Do you want to add examples?"
		fi;
		git add $lecture_file
		git add lecture_files/figs/*$1*
		git commit -m "Adding lecture notes for Lecture $1"
		git push
		jupyter-book build .
		ghp-import -n -p -f _build/html
	fi;
fi;
