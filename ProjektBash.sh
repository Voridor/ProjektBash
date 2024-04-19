#password=$(tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 10);

#echo "$password";


N=10;
echo "Jaka dlugosc powinno miec haslo?(bazowo 10 znakow): ";
read N;
echo "Jakie powinno byc nasiono?(losowe dla 0): ";
read seed;
if [ $seed > 0 ]; then
    RANDOM=$seed;
fi
echo "Czy haslo ma zawierac znaki specjalne? (t/n): ";
read temp;
if [ $temp == "t" ]; then
    special=true;
else 
    special=false;
fi
echo "Czy haslo ma zawierac wielkie litery? (t/n): ";
read temp;
if [ $temp == "t" ]; then
    big=true;
else 
    big=false;
fi
echo "Czy haslo ma zawierac male litery? (t/n): ";
read temp;
if [ $temp == "t" ]; then
    small=true;
else 
    small=false;
fi
echo "Czy haslo ma zawierac numery? (t/n): ";
read temp;
if [ $temp == "t" ]; then
    numbersB=true;
else 
    numbersB=false;
fi

numbers="0123456789";
letter="abcdefghijklmnoqprstuvwyzx";
LETTER="ABCDEFGHIJKLMNOQPRSTUYWVZX";
symbols="!@#$^&*?";


password=""
i=0
for ((i=0; i<=$N; i++))
do
    rrandomizer=$(($RANDOM%(5-1+1)+1));
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
        N+=1;
    fi

done

echo $password