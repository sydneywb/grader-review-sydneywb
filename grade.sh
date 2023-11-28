CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar:grading-area'


rm -rf student-submission
# -f is remove files without prompting for confirmation
# -r removes entire file hierarchy rooted in the path argument, directories and files
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission 2> gitClone.txt # redirects stderr output instead of stdout
# stderr = standard error output, stdout = standard output
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests


ls student-submission > clonedRepo.txt
submittedFile=`grep ListExamples.java clonedRepo.txt`

if [[ $submittedFile != "ListExamples.java" ]]
then
    echo "Could not find ListExamples.java. Instead found: `cat clonedRepo.txt`"
    exit
fi

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area

javac -cp $CPATH grading-area/*.java 2> error.txt

if [[ $? -ne 0 ]]
then
    echo "ListExamples.java file found but compilation failed."
    exit
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > junitResult.txt


if [[ `grep "OK" junitResult.txt` != "" ]]
then
    # echo `grep "OK" junitResult.txt`
    echo "SCORE AS PERCENT: 100%"
    exit
else
    result=`grep "Tests run:" junitResult.txt`
    
    # only works for single digit of tests run and failed
    totalNumTests=${result:11:1}
    totalFailures=${result:25:1}
    numCorrect=$((totalNumTests-totalFailures))

    javac CalcPercent.java
    percent=`java CalcPercent $numCorrect $totalNumTests`

    echo "SCORE AS PERCENT: $percent%"
    exit
fi




# echo `grep "Tests run:" junitResult.txt`
# echo `grep "OK" junitResult.txt`




# check that the student code has the correct file submitted
#     if not, detect and give helpful feedback
#         if and -e/-f, use exit to quit early
# get student code, the .java file with the grading tests, and any other files the script needs
#     into the grading-area directory (move the files here)
#         cp (look up -r option to cp)
# compile tests and student's code from appropriate directory with the appropriate cp commands
#     if compilation fails, detect and give helpful feedback about it
#         javac, output redirection, error codes ($?), if
#         turn off set -e
# run tests and report grade based on junit output
#         grep

# test often, work incrementally
# add echo statements to see what's stored in variables
# screenshots of what grades does to student samples
