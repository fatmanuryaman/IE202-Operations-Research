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


Table s(i,j) unit cost by ship

        D1  D2  D3  D4  D5  Dummy
    P1  5.5 6   8   3.5 4   0
    P2  3   4.5 4   6.5 6   0
    P3  11  6   3   4   4.5 0
    P4  5   4.5 7   3   7.5 0       ;
    
Table c(i,j) investment cost for ships

        D1  D2  D3  D4  D5  Dummy
    P1  2   3   0   2   4   0 
    P2  3   2   4   1   2   0
    P3  0   0   4   3   5   0
    P4  5   3   3   4   0   0       ;

Positive Variables
    x(i,j) flow between supply node i to demand node j;
    
Variables
    z total cost;
    
Equations
    cost        define objective function
    supply(i)   supply constraint
    demand(j)   demand constraint       ;
    
cost..        z =e= sum((i,j), (s(i,j)+c(i,j))*x(i,j));
supply(i)..         sum(j,x(i,j)) =l= a(i);
demand(j)..         sum(i,x(i,j)) =g= b(j);

Model question /all/;
question.OPTFILE=1;
Solve question using lp minimizing z;
Display x.l, x.M, z.l;

