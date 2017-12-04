function [x, ind_unos, dist, obj]= vecinal(x0, f, k, nitmax)
% INPUT:
% x0 : s o l u c i on i n i c i a l
% f : fun cion o b j e t i v o d e l problema
% k : numero de c e n t r a l e s
% nitmax : numero maximo de i t e r a c i o n e s d e l a l g o ritm o v e c i n a l
%OUTPUT:
% x : s o l u c i on f i n a l d e l a l g o ritm o v e c i n a l
% ind uno s : i n d i c e s de l o s 1 ’ s d e l v e ct o r s o l u c i on
% d i s t : v e ct o r de d i s t a n c i a s de cada g ranja a su c e n t r a l mas cercana
% o bj : v a l o r de l a fun cion o b j e t i v o

x=x0 ; % Partimos de l a s o l u c i on i n i c i a l ( vo ra z en nu e st ro ca so )
[dist, obj]= feval(f, x);
i =0;
while(i<=nitmax)
    y=vecino (x, k);
    [dy,fy]= feval(f, y);
    delta = fy-obj;
    if (delta < 0)
        x=y;
        obj=fy ;
        dist=dy ;
        i=0;
    else
        i=i+1;
    end
end
[F, I] = sort(x , 'descend') ;
ind_unos=I (1 : k);
return