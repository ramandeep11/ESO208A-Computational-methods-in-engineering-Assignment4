function Trap
add=input('Name of file to take input from: ','s');
add3=input('Name of the output file','s');
po=fopen(add,'r');
F=fgets(po);
F=strcat('@(x,y) ',F);
fun=str2func(F);
X=fscanf(po,'%f');
x0=X(1);
y0=X(2);
xf=X(3);
h=X(4);
tol=X(5);
fclose(po);
i=0;
yo=zeros((xf-x0)/h+1,1);
yo(1)=y0;
x=zeros((xf-x0)/h+1,1);
x(1)=x0;
%yo(2)=yo(1)+h*fun(x(1),yo(1));
%x(2)=x(1)+h;
%yo(3)=yo(2)+h*fun(x(2),yo(2));
%x(3)=x(2)+h;
%yo(4)=yo(3)+h*fun(x(3),yo(3));
%x(4)=x(3)+h;
while (x(i+1)<xf)
    yo(i+2)=yo(i+1)+h*fun(x(i+1),yo(i+1));
     x(i+2)=x(i+1)+h;
    yo(i+2)=yo(i+1)+h/2*(fun(x(i+1),yo(i+1))+fun(x(i+2),yo(i+2)));
    i=i+1;
end
x=linspace(x0,xf,((xf-x0)/h)+1);
y=yo(1:(xf-x0)/h+1);
y((xf-x0)/h+1)
plot(x,y);
hold on;
xlabel('X value');
ylabel('Y value');
p2=fopen(add3,'a');
fprintf(p2,"\nTrapezoidal-4\n\nX value Y value\n");
j=1;
while(j<(xf-x0)/h+2)
    fprintf(p2,"%f\t%f\n",x(j),yo(j));
    j=j+1;
end

end