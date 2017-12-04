fun = input('Ingrese un polinomio de grado 3: ');
xlow = input('Escriba el valor inicial inferior: ');
xhigh = input('Escriba el valor inicial superior: ');
maxiter = input('Escriba el numero de iteraciones: ');
[xopt, fx, iter, ea] = dorado(xlow, xhigh, maxiter, fun)