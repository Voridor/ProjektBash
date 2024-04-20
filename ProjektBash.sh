#password=$(tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 10);

#echo "$password";


N=10;
echo "Jaka dlugosc powinno miec haslo?(bazowo 10 znakow): ";
read N;
if [[ $N =~ '^[0-9]+$' ]]; then
        echo 
    else
        N=10
    fi
#echo $N
echo "Jakie powinno byc nasiono?(losowe dla 0): ";
read seed;
if [ $seed > 0 ]; then
    RANDOM=$seed;
fi
echo "Czy haslo ma zawierac znaki specjalne? (t/n)(bazowo t): ";
read temp;
if [ $temp == "n" ]; then
    special=false;
else 
    special=true;
fi
#echo $special
echo "Czy haslo ma zawierac wielkie litery? (t/n)(bazowo t): ";
read temp;
if [ $temp == "n" ]; then
    big=false;
else 
    big=true;
fi
#echo $big
echo "Czy haslo ma zawierac male litery? (t/n)(bazowo t): ";
read temp;
if [ $temp == "n" ]; then
    small=false;
else 
    small=true;
fi
#echo $small
echo "Czy haslo ma zawierac numery? (t/n)(bazowo t): ";
read temp;
if [ $temp == "n" ]; then
    numbersB=false;
else 
    numbersB=true;
fi
#echo $numbersB
numbers="0123456789";
letter="abcdefghijklmnoqprstuvwyzx";
LETTER="ABCDEFGHIJKLMNOQPRSTUYWVZX";
symbols="!@#$^&*?";

password=""
i=0
for ((i=0; i<N; i++)); do
    randomizer=$(($RANDOM % 5 + 1))
    if [ "$randomizer" -eq 1 ] && [ "$numbersB" == "true" ]; then
        temp="${numbers:$(( RANDOM % ${#numbers} )):1}"
        password+="$temp"
    elif [ "$randomizer" -eq 2 ] && [ "$small" == "true" ]; then
        temp="${letter:$(( RANDOM % ${#letter} )):1}"
        password+="$temp"
    elif [ "$randomizer" -eq 3 ] && [ "$big" == "true" ]; then
        temp="${LETTER:$(( RANDOM % ${#LETTER} )):1}"
        password+="$temp"
    elif [ "$randomizer" -eq 4 ] && [ "$special" == "true" ]; then
        temp="${symbols:$(( RANDOM % ${#symbols} )):1}"
        password+="$temp"
    else
        ((N++))
    fi
done

echo $password