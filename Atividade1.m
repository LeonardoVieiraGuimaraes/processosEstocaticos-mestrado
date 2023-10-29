%Exericio 1 
clear all;
clc;

%Distribuição Inicial
%Matriz de Transição
T = [0.8 0.1 0.1; 0.2 0.6 0.2; 0.6 0 0.4];
PI = [1/3 1/3 1/3];
 
TPI = [(0.8-1) 0.1 0.1; (0.2-1) 0.6 0.2; 0.6 0 (0.4-1)]


%Letra B P(X5 = 1 \ X1 = 1)

PX11 = T.^4

%Letra C
a = PI(1,1);
b = PI(1,2);
c = PI(1,3);
Ta = zeros(3);
e1 =0;
e2 =0;
e3 =0;

%Quantidade de Repetições 
n = 100;
 
 for i = 1:1:n  
    
    x = rand(1);
    if  x <= a && x > 0
         a = T(1,1);
         b = T(1,2);
         c = T(1,3);
         if e1==1
             Ta(1,1) = Ta(1,1) +1; 
             e1 = 0;
         elseif e2==1
             Ta(2,1) = Ta(2,1) +1; 
             e2 =0;
         elseif e3==1
             Ta(3,1) = Ta(3,1) + 1;
             e3 = 0;
         end
         e1 = 1;
    
    elseif x <= (b + a) && x > a 
         a = T(2,1);
         b = T(2,2);
         c = T(2,3);         
        if e1==1
             Ta(1,2) = Ta(1,2) +1; 
             e1 = 0;
        elseif e2==1
             Ta(2,2) = Ta(2,2) +1; 
             e2 =0;
        elseif e3==1
             Ta(3,2) = Ta(3,2) + 1;
             e3 = 0;
         end
         e2 = 1;

    elseif x <= (c + b + a)  && x > (b+a)
         a = T(3,1);
         b = T(3,2);
         c = T(3,3);
        if e1==1
             Ta(1,3) = Ta(1,3) +1; 
             e1 = 0;
        elseif e2==1
             Ta(2,3) = Ta(2,3) +1; 
             e2 =0;
        elseif e3==1
             Ta(3,3) = Ta(3,3) + 1;
             e3 = 0;
         end
         e3 = 1;
    end     
 end

for i = 1:1:length(Ta(:,1))
    norm(Ta(i,:))
    Ta
    Ta(i,:) = Ta(i,:)/sum(Ta(i,:))
end
disp('linha1'); sum(Ta(1,:))
sum(Ta(2,:))
sum(Ta(3,:))
 
 
 