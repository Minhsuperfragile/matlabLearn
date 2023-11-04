#variables
var x1 >= 0;
var x2 >= 0;

#objective
maximize profit:
1.55*x1 + 1.75*x2;

#constraints
subto Constraint1:
5.1*x1 + 3.2*x2 <= 240;

subto Constraint2:
2.1*x1 + 4.3*x2 <= 200;


# zimpl fileName.zpl
# scip -q -f fileName.lp -l fileName.out
# use == to declare equality in math function 