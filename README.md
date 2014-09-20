Capstone
========

by: Eric Lambert and Anthony Hernandez 
August 2014

This repo contains code that was implemented to perform activity recognition and user identification from data collected from a three axis accelerometer.

Data was collected on a LG smart mobile phone via an application we created. Data was exported into a text file so that analysis could be performed. To identify activity a logistic regression with regularization using a one versus all methodology was used to characterize the mean absolute deviation of the x and y axes. The activity recognition algorithm was 99% accurate, with a decision made every 10 seconds.

To perform user identification a neural network was constructed using 10 attributes. We only trained the algorithm to know four users. The neural network had three total layers: input, hidden, and ouptu. The hidden layer was constructed with 40 nodes. I typically construct hidden layers to be (number of inputs) x 10. The user identification algorithm was 90% accurate and a decision was made every 10 seconds, a voting system was then put in place to make a decision after a minute using 6 votes. A tie was decided via alphabetical order.

