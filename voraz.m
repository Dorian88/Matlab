function [x, ind, dist, obj]= voraz (f,k)
% INPUT:
% f : fun cion o b j e t i v o d e l problema
% k : numero de c e n t r a l e s a c o n st r u i r
%OUTPUT:
% x : s o l u c i on vo ra z d e l problema
% ind : i d e n t i f i c a d o r e s de l a s l o c a l i z a c i o n e s e s c o g i d a s
% d i s t : v e ct o r de d i s t a n c i a s de cada g ranja a su c e n t r a l mas cercana
% o bj : v a l o r de l a fun cion o b j e t i v o

global d
x=zeros (1, 56);
sumafilas = zeros(1, 56);
for i =1:56
    sumafilas(i) = sum(d(i,:));
end
% Ordenamos las loca l i z a c i o n e s de menor a mayor suma de
% d i s t a n c i a s a toda s l a s g r anj a s
[Y, I] = sort(sumafilas);
% Nos quedamos con l o s i n d i c e s de l a s k p rime ra s l o c a l i z a c i o n e s
ind (1:k)=I(1:k);
x(ind)=1;
[dist, obj] = feval(f, x) ;
return