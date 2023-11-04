%{
How to use the program:
Suppose the given linear system is:
130x -30y =200
-90x +90y =0
-40x -60y +120z =500
*with tolerance of 1% or upto 4 iterations and a relaxation factor of 1.2

Enter the coefficient matrix (in matrix form used in matlab):
[130 -30 0;-90 90 0;-40 -60 120]
Enter the constant or RHD matrix (in matrix form used in matlab):
[200 0 500]'
Enter the relaxation or weighting factor:1.2

If 1% tolerance:
Please choose what termination criteria you desire. 
Press "1" for approximate relative error and "2" for number of iterations:1
The desired approximate relative error in % is:1

If 4 iterations:
Please choose what termination criteria you desire. 
Press "1" for approximate relative error and "2" for number of iterations:2
The desired number of iterations is:4
%}

%This is for inputs
A=input('Enter the coefficient matrix (in matrix form used in matlab):')
B=input('Enter the constant or RHD matrix (in matrix form used in matlab):')
c=input('Enter the relaxation or weighting factor:');

while c<0||c>2
fprintf('The relaxation/weighing factor must be between 0 and 2. Please try again.');
c=input('Enter the relaxation or weighting factor:');
end

%This is for initialization
[n,m]=size(A);
x=zeros(n,1);
rlx=zeros(n,1);
l=0;
L=0;
term=0;
check=zeros(n,1);
check(:,1)=B(:,1);

%Lets the user choose which termination criterion it desires, whether be it a relative error or number of iterations
while (term<1)||(term>2)
    term=input('Please choose what termination criteria you desire.\nPress "1" for approximate relative error and "2" for number of iterations:');
    if term==1
        e=input('The desired approximate relative error in % is:');
        itr=NaN;
        terminate=e+1;
        break;
    end
    if term==2
        itr=input('The desired number of iterations is:');
        e=NaN;
        terminate=NaN;
        break;
    end
    fprintf('Wrong input! Please try again.\n\n');   
end

%This is to check if the coefficient matrix is diagonally dominant. If not,
%re-arrangement will occur to make it as much diagonally dominant as it can
%be. This is to ensure convergence
for i=1:n
    C=A(i,:);
    D=B(i,:);
    h=sumabs(A(i,:))-abs(A(i,i));
    if abs(A(i,i))<h
    for j=1:n
        h=sumabs(A(j,:))-abs(A(j,i));
        if abs(A(j,i))>h
            A(i,:)=A(j,:);
            B(i,:)=B(j,:);
            A(j,:)=C;
            B(j,:)=D;
            break;
        end
        if j==n
            if (abs(A(j,i))<h)&&L==0 %If the given system cannot be totally diagnonally dominant, a warning message will appear. Rearrangemnt would still occur to make it more diagonally dominant.
                L=L+1;
                fprintf('\nWarning: The system will not achieve total convergence!\n');
            end
        end
    
    end
        
    end
          
end

if B(:,1)~=check(:,1) 
   fprintf('\nThe rows have been re-arranged so that it would at best be diagonally dominant,\nmaking sure the system will achieve convergence:\n');
   A
   B
end



%This is the loop program
for v=1:100
l=l+1;
fprintf('\nIteration %.0f:\n',l);

%This is for labels
q='Variable';
w='root value';
z='relaxed root';
o='%rel. error';
k='   ';
a=[q,k,w,k,z,k,o];
disp(a);

for i=1:n
    t=x(i,1);
    p=B(i,1);
    y=rlx(i,1);
    for j=1:m
        if j~=i
            x(j,1);
            A(i,j);
            p=p-(A(i,j)*rlx(j,1));
        end
    end
    r=p/A(i,i);
    rlx(i,1)=(c*r)+((1-c)*y);
    x(i,1)=r;
    
    g=abs((abs(rlx(i,1)-y)/rlx(i,1))*100);
    ea(i,1)=g;
    fprintf('%4.0f %13.4f %13.4f %13.4f\n',i,x(i,1),rlx(i,1),ea(i,1));
    if  g<=e
        terminate=g;
    end
end

if (abs(terminate)<=e)||(l==itr) break;
end
end
