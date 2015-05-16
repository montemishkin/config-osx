# change directory then list all
cl () {
    cd $1
    la
}

# search google
chrome () {
    open http://www.google.com/"#"q=$1
}
