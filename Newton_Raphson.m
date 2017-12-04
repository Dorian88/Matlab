clear all
clc
funcion = input('Ingrese función a evaluar: ');
syms x;
f = inline (funcion);
derivada = diff (funcion, x);
df = inline (derivada);
tol = input('Ingrese la tolerancia: ');
error = 50;
x = input ('Ingrese un valor inicial: ');
n = 0;
fprintf ('n\txi\t\terror\n')
while(error>tol)
    fprintf('%i\t%3.3f\t%f\n', n, x, error);
    n = n+1;
    x = x - f(x)/df(x);
    error = abs(f(x));
end