# Integration of a Single Variable

Hello! My name is Ishan Shah and I'm a first-year electrical and computer engineering student at The University of Texas at Austin. My goal with this guide is to help you familiarize yourself with standard integration techniques in single-variable calculus.

## 1 - The Integral

---- 

### **1.0 - What is an Integral?**

In calculus, the integral is a powerful function that is equivalent to calculating the anti-derivative. It lets you find the area under a curve and has countless applications in math and physics.

The integral is essentially an infinite sum of infinitely small slices of a figure. The integral calculates the areas at these various slices using a constantly increasing value, usually $dx$. This changing $dx$ value allows one to compute the total area of the figure.

There are many different techniques to calculate this sum when given an integral, all of which will be explored in the coming sections.

### **1.1 - The Reverse Power Rule**

A common, basic integral is of the form:
> $\int xdx$

This integral is simply solved using the *reverse power rule*, a tool used to calculate anti-derivatives with respect to a variable. The steps to using the reverse power rule are as follows:

1. Add 1 to the degree of the variable you are integrating with respect to. In our case, this would make $x$ become $x^2$.
2. Divide by this new degree. This makes $x^2$ become $\frac{x^2}{2}$.
3. If the integral is definite (has bounds), plug in the top and bottom bounds into the equation. Subtract the value of the top by the bottom to compute the final answer.
4. Finally, if the integral is indefinite (no bounds), add $+C$ to the end of your answer. Therefore, our final answer is $\frac{x^2}{2}+C$.

We will go more in depth on these ideas of definite and indefinite integration along with other integration basics in the following sections.

### **1.2 - Definite and Indefinite Integrals**

A *definite integral* is one in which a numerical answer can be computed. These integrals must have given bounds. Let's see an example of what one of these would look like.
> $\int\_1^4 \frac{3}{2}x^2 + 4x + 5$
> 
> $=\frac{1}{2}x^3 + 2x^2 + 5x ]\_1^4$
> 
> $=(\frac{1}{2}(4)^3 + 2(4)^2 + 5(4)) - (\frac{1}{2}(1)^3 + 2(1)^2 + 5(1))$
> 
> $=(32 + 32 + 20)-(\frac{1}{2} + 2 + 5)$
> 
> $=(84-7\frac{1}{2})$
> 
> $=76\frac{1}{2}$

An *indefinite integral* on the other hand is simpler. Like the problem we did in the last section, these integrals have no bounds and have a $+C$ at the end instead. This is because when we integrate, there exists a family of possible solutions. To illustrate this point, I'll pose the question:

*Is there any difference between the derivative of $x^2 + 9$ and $x^2 + 213$?*

No! The derivative of both equations is $2x$. Thus, when we take an indefinite integral we must include the $+C$ as it serves as an arbitrary constant because we have no idea what the constant could be, since the derivative of a cosntant is zero.

As foreshadowing for future courses, try and think about what would happen if you were to successively integrate a function. Each integral you take adds a new arbitrary constant to your equation. In order to solve for these constant, we need *initial values* that give us clear values for our arbitrary constants.

### **1.3 - Properties of Integrals**

Integrals have fundamental properties that greatly benefit 

## Substitution

---- 

Integration by substitution involves 