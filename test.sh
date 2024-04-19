numbersB=false
small=true
big=true
special=true

numbers="0123456789";
letter="abcdefghijklmnoqprstuvwyzx";
LETTER="ABCDEFGHIJKLMNOQPRSTUYWVZX";
symbols="!@#$^&*?";


password=""
randomizer=$(($RANDOM%(5-1+1)+1));
    echo "Random"
    echo $randomizer
    if [[ $randomizer == 1 && numbersB == true ]]; then
        temp="${numbers:$(( RANDOM % ${#numbers} )):1}"
        password+=$temp
    elif [[ $randomizer == 2 && small ]]; then
        temp="${letter:$(( RANDOM % ${#letter} )):1}"
        password+=$temp
    elif [[ $randomizer == 3 && big ]] ; then
        temp="${LETTER:$(( RANDOM % ${#LETTER} )):1}"
        password+=$temp
    elif [[ $randomizer == 4 && special ]]; then
        temp="${symbols:$(( RANDOM % ${#symbols} )):1}"
        password+=$temp
    else
        i--;
    fi
echo "pass:"
echo $password