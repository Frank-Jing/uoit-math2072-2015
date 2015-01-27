%Linear Algebra review
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Defining and manipulating vectors and matrices, solve linear system using inv(A), backslash operator, LU and Choleski decomposition

%  Run the script as .m file in your command window
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Defining row vector
x = [1,3,4]

%Defining column vector
%  x =
%  
%       1     3     4

x_col = [1;4;6]

%  x_col =
%  
%       1
%       4
%       6

%To transpose you can use either ' or the command transpose
x'

%  ans =
%  
%       1
%       3
%       4

%you can as well sort the elements in a vector

x = [2,6,1,9,3]

%  x =
%  
%       2     6     1     9     3

xsort = sort(x)

%  xsort =
%  
%       1     2     3     6     9

%the entries in a vector are numbered from 1 to n, if n is the size of the vector
x(2)=[]

%  x =
%  
%       2     1     9     3

%we can assign another value to an entry...
x(1) = 5
  
%  x =
%  
%       5     1     9     3

%...exchange the order fo some the entries
x([1,4]) = x([4,1])

%  x =
%  
%       3     1     9     5

%A matrix is defined using commas to separate entries on the same row and semicolons to separate different rows
A = [1,2,4;5,6,8;3,1,7]

%  A =
%  
%       1     2     4
%       5     6     8
%       3     1     7

%The transpose is obtained using ' or transpose
B = A'

%  B =
%  
%       1     5     3
%       2     6     1
%       4     8     7

%We can define zero matrices using the command zeros
Z = zeros(5)

%  Z =
%  
%       0     0     0     0     0
%       0     0     0     0     0
%       0     0     0     0     0
%       0     0     0     0     0
%       0     0     0     0     0

% If I want a nXm zero matrix we just have to specify the number or rows and columns desired:
Z_1 = zeros(2,3)

%  Z_1 =
%  
%       0     0     0
%       0     0     0

%For the identity matrix we use the command eye
I =eye(4)

%  I =
%  
%       1     0     0     0
%       0     1     0     0
%       0     0     1     0
%       0     0     0     1

%If I want a matrix of all ones then I need to use the command ones (and of course we can either define the matrix to be square or not as we did with the zeros matrix..)
 G = ones(3,6)

%  G =
%  
%       1     1     1     1     1     1
%       1     1     1     1     1     1
%       1     1     1     1     1     1

%To study some kind of linear solvers random matrices are usefull. The command rand returns uniforly distributed pseudorandom numbers (see help rand..)
R = rand(7)

%  R =
%  
%      0.4218    0.9340    0.7060    0.3171    0.1869    0.6797    0.5853
%      0.9157    0.6787    0.0318    0.9502    0.4898    0.6551    0.2238
%      0.7922    0.7577    0.2769    0.0344    0.4456    0.1626    0.7513
%      0.9595    0.7431    0.0462    0.4387    0.6463    0.1190    0.2551
%      0.6557    0.3922    0.0971    0.3816    0.7094    0.4984    0.5060
%      0.0357    0.6555    0.8235    0.7655    0.7547    0.9597    0.6991
%      0.8491    0.1712    0.6948    0.7952    0.2760    0.3404    0.8909



%Manipulating matrices. 
%Given:
A 
%  A =
%  
%       1     2     4
%       5     6     8
%       3     1     7

%To extract common elements between a specfic row and column you use round bracktes
a_22 = A(2,2)

%  a_22 =
%  
%       6

%You can slice a matrix by its rows or columns:
%This returns all the entries from the intersection between all the rows and the second column:
A(:, 2)

%  ans =
%  
%       2
%       6
%       1

%This returns all the entries from the intersection between the third row and all the columns
A(3, :)

%  ans =
%  
%       3     1     7

%Norm of a matrix
%2-norm (is defined as the square root of the maximum eigenvalue of A*A, where A* is the conjugate transpose of A)
n_2 = norm(A)

%  n_2 =
%  
%     13.9909

%1-norm (is defined as the maximum column sum)
n_1 = norm(A,1)

%  n_1 =
%  
%      19

%infinity norm (is defined as the maximum row sum)
n_inf = norm(A, inf)

%  n_inf =
%  
%      19


%We can also assign another value to an entry of a matrix
A(3,3) = -3

%  A =
%  
%       1     2     4
%       5     6     8
%       3     1    -3

% and I can compute the absolute value of A...
Aabs = abs(A)

%  Aabs =
%  
%       1     2     4
%       5     6     8
%       3     1     3

%The determinant of A is:
d = det(A)

%  d =
%  
%    -1.1546e-14
%Which in this case is pretty small...
%Let's have a look at the eigenvalues:
eig(A)

%  ans =
%  
%      9.0000
%     -0.0000
%     -5.0000
% The second eigenvalue is zero! (or something really close to zero..)
%Let's try to compute the inverse of A..
Ainv = inv(A)
%Gives me a warning (I was expecting this just by looking at the determinat and the eigenvalues...)
%  [Warning: Matrix is close to singular or badly scaled. Results may be inaccurate.
%  RCOND =  9.868649e-18.] 
%  
%  Ainv =
%  
%     1.0e+15 *
%  
%      2.2518   -0.8661    0.6929
%     -3.3777    1.2991   -1.0393
%      1.1259   -0.4330    0.3464

%%%%%%%%
%Solving linear system
%%%%%%%
%Given the matrix C..
C = [1,2,3;1,1,-1;1,2,1]

%  C =
%  
%       1     2     3
%       1     1    -1
%       1     2     1
%...and the column vector D corresponding to the system CX = B..
D = [2;4;4]


%  D =
%  
%       2
%       4
%       4
%..we can solve the system (if the matrix is small) using the rref form.

%First we need to define the augmented matrix A:
A = [C, D]

%  A =
%  
%       1     2     3     2
%       1     1    -1     4
%       1     2     1     4

%Then we can compute the rref form with the rref command:
Aref = rref(A)

%  Aref =
%  
%       1     0     0     1
%       0     1     0     2
%       0     0     1    -1
%As you can see, now the solution to the system is trivial (x1 = 1; x2 = 2, x3 = -1)

% To solve CX = D, you can use also the command inv(C) so to solve for X (i.e. X = inv(C)*D), but you have to make sure that the matrix C is not singular
% THIS IS NOT HOW YOU ARE SUPPOSED TO SOLVE SYSTEM!!! 

%Given C..
C
%  C =
%  
%       1     2     3
%       1     1    -1
%       1     2     1
%..and D
D
%  D =
%  
%       2
%       4
%       4
%we compute the inverse of C:
Cinv = inv(C)

%  Cinv =
%  
%      1.5000    2.0000   -2.5000
%     -1.0000   -1.0000    2.0000
%      0.5000         0   -0.5000
%and then we solve for the vector X:
X = Cinv*D

%  X =
%  
%       1
%       2
%      -1

%I obtained the same result as using rref (obviously...)

%THIS IS HOW TO SOLVE LINEAR SYSTEM
% You can to use the backslash operator (see help \ )

%So, given my usual system:
C

%  C =
%  
%       1     2     3
%       1     1    -1
%       1     2     1

D

%  D =
%  
%       2
%       4
%       4

x = C\D

%  x =
%  
%       1
%       2
%      -1
%Which gives me the same result as before.
%What's the difference between computing the inverse or using \?

%Let's try to solve a big system

%R is a pseudorandom matrix sized 5000X5000
R = rand(5000);
%R_vec is a pseudorandom column vector sized 5000X1
R_vec = rand(5000, 1);

%I want to solve the system RX = R_vec using either inv(R) or \ timing the time of computation:
tic; x = inv(R)*R_vec; toc
%  Elapsed time is 5.971447 seconds.
tic; x = R\R_vec; toc
%  Elapsed time is 2.071377 seconds.

%As you saw, \ is way faster to solve systems.

%The reason is that generally compute the inverse of a matrix is very expensive and it can take some time. The \ operator uses instead 
%different algorithms depending on the structure of the matrix.

%%%%%%%%%%%%%%%%
%LU decomposition
%%%%%%%%%%%%%%%

%Given the matrix A
A = [1,2,3;4,5,6;7,8,0]

%  A =
%  
%       1     2     3
%       4     5     6
%       7     8     0

%we make sure it's not singular
eig(A)

%  ans =
%  
%     12.1229
%     -0.3884
%     -5.7345

%And then we compute the LU decomposition of A such that L*U = A
[L, U] = lu(A)

%  L =
%  
%      0.1429    1.0000         0
%      0.5714    0.5000    1.0000
%      1.0000         0         0
%  
%  
%  U =
%  
%      7.0000    8.0000         0
%           0    0.8571    3.0000
%           0         0    4.5000

%Check to see if it actually worked..
L*U - A

%  ans =
%  
%       0     0     0
%       0     0     0
%       0     0     0

%If A was sparse, the matrices L would have been strickly lower triangular and U would have been upper triangular.

%%%%%%%%%%%How LU decomposition works%%%%%%%%%%%%%%%%%
%Given the system AX = B, I can decompose A = LU so that I can rewrite the system as: LUX = B
% Now I can call UX = Y and solve for Y the system: LY = B ----> Y = L^(-1)*B
%We notice that L is lower triangular: we can solve the previous system using forward substitution
% After doing this, we have to solve for X UX = Y -----> X = U^(-1)*Y
%Since U is upper diagonal we can easily use backward subtitution to solve the system for X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Notice that since A wasn't sparse, L wasn't lower diagonal.

%Anther option for LU decomposition is to compute a permutation matrix P as well:
[L, U, P] = lu(A)

%  L =
%  
%      1.0000         0         0
%      0.1429    1.0000         0
%      0.5714    0.5000    1.0000
%  
%  
%  U =
%  
%      7.0000    8.0000         0
%           0    0.8571    3.0000
%           0         0    4.5000
%  
%  
%  P =
%  
%       0     0     1
%       1     0     0
%       0     1     0

%Note that L and U are triangular matrix. 
%The previous decomposition is done so that : L*U = P*A

%Choleski: we need  matrix A as to be positive definite
% A way to define positive definite matrix in matlab is the following (see help gallery for more info, there a tons of kind of matrices you can define..)
A = gallery('moler', 4)

%  A =
%  
%       1    -1    -1    -1
%      -1     2     0     0
%      -1     0     3     1
%      -1     0     1     4

%We compute the Choleski decomposition
R = chol(A)

%  R =
%  
%       1    -1    -1    -1
%       0     1    -1    -1
%       0     0     1    -1
%       0     0     0     1

%R is a matrix such that R'*R = A
transpose(R)* R

%  ans =
%      
%       1    -1    -1    -1
%      -1     2     0     0
%      -1     0     3     1
%      -1     0     1     4

A

%  A =
%  
%       1    -1    -1    -1
%      -1     2     0     0
%      -1     0     3     1
%      -1     0     1     4
%%%%%%%%%%%How Choleski decomposition works%%%%%%%%%%%%%%%%%
%Given the system AX = B, I can decompose A = R'R so that I can rewrite the system as: R'RX = B
% Now I can call RX = Y and solve for Y the system: R'Y = B ----> Y = R'^(-1)*B
%Since R is upper triangular, R'  is lower triangular: we can solve the previous system using forward substitution
% After doing this, we have to solve for X RX = Y -----> X = R^(-1)*Y
%Since R is upper diagonal we can easily use backward subtitution to solve the system for X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
