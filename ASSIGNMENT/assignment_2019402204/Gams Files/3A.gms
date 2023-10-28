Sets
i supply nodes /P1, P2, P3, P4/
j demand nodes /D1, D2, D3, D4, D5, Dummy/;

Parameters
a(i) supplies for supply node i
     /P1 290
     P2 220
     P3 180
     P4 280/

b(j) demands for demand node j
     /D1 180
     D2 200
     D3 160
     D4 140
     D5 250
     Dummy 40/;

    
Table c(i,j) the cost for ships

        D1  D2  D3  D4  D5  Dummy
    P1  7.5 7   8   5.5 8   0 
    P2  6   6.5 7   7.5 8.5 0
    P3  11  6   6.5 6   7   0
    P4  9   7   10  6   7.5 0       ;

    
Variables
    x(i,j) flow between supply node i to demand node j by using ship or train
    t(i,j) flow between supply node i to demand node j by using rented ship
    y(i,j) rent or buy
    z total cost;
    
Positive Variables x;
Positive Variables t;

Binary Variables y;
    
Equations
    cost            define objective function
    supply(i)       supply constraint
    demand(j)       demand constraint
    rent(i,j)       rent
    invest(i,j)     buy            ;
    
    
cost..        z =e= sum((i,j), (c(i,j))*x(i,j) + 350*(1-y(i,j)));
supply(i)..         sum(j,x(i,j)+t(i,j)) =l= a(i);
demand(j)..         sum(i,x(i,j)+t(i,j)) =g= b(j);
invest(i,j)..       x(i,j)  =l= 10000000*y(i,j);
rent(i,j)..         t(i,j) =l= 10000000*(1-y(i,j));


Model question /all/;
question.OPTFILE=1;
Solve question using MIP minimizing z;
Display x.l, x.M, z.l;

