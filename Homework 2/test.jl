include("newtMin.jl")
function simpleProblem(x)
  # evaluate the function f(x)=‖x-y_0‖^4, the gradient 2x, and the Hessian 2*Id
  y0 = [-1 100 3]'
  f = norm(x-y0, 2)^4
  g = 4*norm(x-y0, 2)^2*(x-y0)
  H = 8*(x-y0)*(x-y0)'
  return (f, g, H)
end

function simplestProblem(x)
  # evaluate the function f(x)=‖x-y_0‖^4, the gradient 2x, and the Hessian 2*Id
  y0 = [-1 100 3]';
  f = norm(x-y0, 2)^2;
  g = 2(x-y0);
  H = 2eye(3)
  return (f, g, H);
end
out = newtmin(simpleProblem, [-34 129 128]',10,1e-16,1)
norm(out[1]-[-1,100,3]',2)
y0 = [-1 100 3]'
f = norm([-5, 136, 157]-y0, 2)^4

prob = [128 -1152 -4928
 -1152 10368 44352
 -4928 44352 189728]
factorize(prob)
det(prob)
w=[1 2 3]'

w*w'

x =[-20 125 13]'
i=0
maxIter=100000
ϵ=1e-10
println("ARGLEBLARGLEBARG")
while (norm(x)>=ϵ) & (i<=maxIter)
    (f, g, H) = simpleProblem(x);
    println(i)
    println(H)
    Δx = H\g # calculate the change in x
    # check if we can stop (i.e., the error due to our second order approximation is smaller than our error tolerance)
    decrement = g'*Δx
    if norm(decrement, 2)/2 < ϵ
      break;
    end
    x = x - Δx;
    i+=1;
  end

=======
newtmin(simpleProblem, [-1,136, 161])
>>>>>>> parent of 72c1a48... Small issue
