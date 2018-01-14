function main(){
	echo "******** Giai Phuong Trinh ********"
	echo "1. Phuong trinh bac nhat"
	echo "2. Phuong trinh bac hai"
	echo "3. Phuong trinh bac ba"

	echo -e "\n\n\t\t Moi ban chon: "; read luachon;
	if [ $luachon -eq 1 ]; then
		giaiPTBac1
	elif [ $luachon -eq 2 ]; then
		giaiPTBac2
	elif [ $luachon -eq 3 ]; then
		giaiPTBac3
	else 
		echo "Ban nhap sai! Ban co muon tiep tuc khong?"
		echo "1. co"
		echo "2. khong"
		echo -e "\n\tMoi ban chon: "; read f
		if [ $f -eq 1 ]; then
			main
		elif [ $f -eq 2 ]; then
			exit 1
		else
			echo " Xin loi ban nhap sai! Chuong trinh se bi thoat do ban nhap sai so lan quy dinh"
			sleep 5
			exit 0
		fi
	fi
}

function giaiPTBac1(){
	echo "********** Phuong trinh bac 1: ax + b = 0 *********"
	echo "a = " ; read a
	echo "b = " ; read b
	
	if [ $a -eq 0 -a $b -eq 0 ]; then
		echo "Phuong trinh vo so nghiem"
	elif [ $a -eq 0 -a $b -ne 0 ]; then
		echo "Phuong trinh vo nghiem"
	else 
		echo " Phuong trinh co nghiem x= `echo "-$b/$a"|bc -l`"
	fi

}

function giaiPTBac2(){
	echo "********** Phuong trinh bac 2: ax^2 + bx + c =0 ********"
	echo "a = "; read a;
	echo "b = "; read b;
	echo "c = " ; read c;
	if [ $a == 0 ]; then
		echo "Phuong trinh vo nghiem"
	else 
		d=`echo "$b*$b - 4*$a*$c"|bc -l`
		if [ $d -lt 0 ]; then
			echo "Phuong trinh vo nghiem"
		elif [ $d == 0 ]; then
			echo "Phuong trinh co nghiem kep x1 = x2 = `echo "-$b/(2*$a)"|bc -l`"
		else 
			x1=`echo "(-$b - sqrt($d))/(2*$a)"|bc -l`
			x2=`echo "(-$b + sqrt($d))/(2*$a)"|bc -l`
			echo "Phuong trinh co 2 nghiem phan biet"
			echo " x1 = $x1"
			echo " x2 = $x2"
		fi
	fi
}

function giaiPTBac3(){
	echo "*** Phuong trinh bac 3: ax^3 + bx^2 + cx +d =0 ***"
	echo "a= "; read a;
	echo "b= "; read b;
	echo "c= "; read c;
	echo "d= "; read d;
	
	if [ a == 0 ]; then
		echo "Phuong trinh vo nghiem"
	fi

	dt=`echo "$b^2 - 3*$a*$c"|bc -l`
	k=`echo "(9*$a*$b*$c - 2*($b^3) - 27*($a^2)*$d)/(2*sqrt(sqrt($dt^2)^3))"|bc -l`
	if [ $dt -gt 0 ]; then
		v=`echo "sqrt($k^2)"|bc -l`
		if [ $(echo "$v <= 1" | bc -l) ];then
			# if (( $(echo "$k == 0" | bc -l) ));then
   #     			p=90
   #  		elif (( $(echo "$1 <= 1" | bc -l) ));then
   #    			p=`echo "scale=3;a(sqrt((1/($k^2))-1))" | bc -l`
   #  		elif (( $(echo "$k > 1" | bc -l) ));then
   #     			echo "error"
   #  		fi
			
			# x1=`echo "(2*sqrt($dt)*cos($p/3)-$b)/(3*$a)"|bc -l`
			# x2=`echo "(2*sqrt($dt)*cos($p/3-(2*3.14/3))-$b)/(3*$a)"|bc -l`
			# x3=`echo "(2*sqrt($dt)*cos($p/3+(2*3.14/3))-$b)/(3*$a)"|bc -l`
			# echo "x1 = $x1"
			# echo "x2 = $x2"
			# echo "x3 = $x3"
			echo "Phuong trinh da cho co 3 nghiem"
		else
			x=`echo "((sqrt($dt)*sqrt($k^2))/(3*$a*$k))*((sqrt($k^2)+sqrt($k^2-1)^(1.0/3))+((sqrt($k^2)-sqrt($k^2-1))^(1.0/3)))-($b/(3*$a))"|bc -l`
			echo "Phuong trinh co 1 nghiem duy nhat: x = $x"
		fi

	elif [ $d == 0 ]; then
		x=`echo "(-$b-(-($b^3-27*$a*$a*$d)^(1.0/3)))/(3*$a)"|bc -l`;
		echo "x = $x"
	else 
		x=`echo "(sqrt(sqrt($dt^2))/(3*$a))*(($k+sqrt($k*$k+1)^(1.0/3))-(-($k-sqrt($k*$k+1))^(1.0/3)))-($b/(3*$a))"|bc -l`
		echo " x = $x"
	fi
}
function acos()
{
    if (( $(echo "$1 == 0" | bc -l) ));then
       return 90
    elif (( $(echo "$1 <= 1" | bc -l) ));then
       return echo "scale=3;a(sqrt((1/($1^2))-1))" | bc -l
    elif (( $(echo "$1 > 1" | bc -l) ));then
       return 1
    fi
    return 1
}

main
