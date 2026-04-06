#!/bin/zsh

print "Hello World!"

NAME="Avantika Jain"
A=25
B="35"

print ${NAME}

print "Whats your Name"
read NAME
#print "Hello ${NAME}"

print `date`

CURDIR=`pwd`

print ${CURDIR}

print \*
print \\

let a=5
let b=6
let c=56.000000
let d=0
((c=a+b/c))

printf "%.5f" $c

printf "\e[31mThis is red text\e[0m\n"
printf "\e[1;32mThis is bold green text\e[0m\n" # 1 is for bold

print -P "%F{red}This is red text using zsh codes%f"
print -P "%F{blue}%K{yellow}Blue text on a yellow background%k%f"

print ${NAME}

export NAME

if (( a <= b ));then
    print "A is less than B"
fi

if [ -z ${NAME} ];then 
    print "No name is provided"
fi

for CTR in {A..Z} {a..z};do
    print ${CTR}
done

if [ "${NAME}" = "AVANTIKA" ] || [ "${NAME}" = "NITIN" ];then
    print "Hello Avantika"
fi

let CTR=43
while [ ${CTR} -le 50 ];do
    print "HELLO ${CTR}"
    ((CTR=CTR+1))
    sleep 1
done



print_my_name()
{
    echo "My name is ${1}"
    echo "My Name is OYOOOO OOIIO"
}

print_my_name AVANITKA
