# Toy Robot Simulator

## Description from Client Brief

* The application is a simulation of a toy robot moving on a square tabletop.
* Create an application that can read in commands of the following form:
```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

### Semantics of Commands

#### Input

Input can be from a file, or from standard input, as the developer chooses.


### Testing

Provide test data to exercise the application.



## Analysis and Design Decisions

### Classes

* Simulator
* Logger
* Parser

##### Parser

A Parser reads from a file or pipe and parses the stream into messages (i.e. method calls to a target object).

### Testing

There is a separate folder for testing.
