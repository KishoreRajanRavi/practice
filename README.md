## Joins 

Scenario 

we have a Customer table with all your customers. 

we have an Orders table with all the orders made. 

We want to see how customers and orders relate 

## Stored Procedure

Scenario:

You have a customer and their orders.

You want to find all orders for a customer.

If the customer has no orders → show empty.

If the customer doesn’t exist → show a message.

Examples:

Input (@custID)	

2 -	Customer exists and has orders → shows Bob’s orders

4	- Customer exists but no orders → shows empty

10 -	Customer doesn’t exist → shows message
