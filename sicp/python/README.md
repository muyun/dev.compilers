
#### TODO  
* open source projects 
    - [python filesystems](https://filesystem-spec.readthedocs.io/en/latest/intro.html) 
    - [nushell](https://github.com/nushell/nushell)
    - [deno](https://github.com/denoland/deno)


#### Systematic program design 

#### About [Composing Programs](http://composingprograms.com/pages/11-getting-started.html)    
* how computers interpret computer programs and carry out computational processes  
* some recent progress in computer programs  


##### ch4 - Data Processing  
* lazy computation - computing values **on demand** instead of being retrieved from an existing memory source  

  -  TODO - Implement stream class 


#### ch3 - **language abstraction** using interpreters and macros  


##### ch1 - Building Abstractions with Functions  

* The programming language serves a **framework where we organize our ideas** about computational processes   
  - combine simple ideas to form more complex ideas  
    + primitive expressions and statements  
    + **combination** -> compound elements are built from simpler ones  
    + **abstraction** -> compound elements can be named and manipulated as units  
  - **combine and abstract** both data and functions  
  - pure function 
    + has no effects beyond returning a value  
    + return the same value when called twice with the same args  
  - Testing  
    + assert 

  - **control abstraction** using recursion, higher-order functions, generators, and streams  
    + higher-order functions 
      - how **functions can be manipulated as data** using higher-order functions  
  - 

#### ch2 - Data Abstraction - Building Abstractions with Data  
  - **data abstraction** using interfaces, objects, classes, and generic operators  
  - structed data  
    + object metaphor -> value + behavior  
  - struct programs on abstract data  
  - data abstraction manipulate **compound values as units**  
    + isolate **how data are represented (as parts)** and **how data are manipulated (as units)**  
    +  
    + **a concrete data representation**  
    + **the programs** that use the data  
    + **the interface** between these two parts of system will be a set of cuntions, called **selectors and constructors**   
      - implement the abstract data in terms of the concrete representation   
      - like in [data_abstraction.py](https://github.com/muyun/dev.programming/blob/master/sicp/exercise_py/data_abstraction.py),  function numer() and denom() as selectors, and function rational() as constructors to construct the function add_rational(), mul_rational()  

  - Sequence abstraction  
    + an ordered collection of data values  
    + share certain properties like length and element selection (like index)  

  - conventional interface  
    + **chaining together a pipeline of functions**, if the functions all take a sequence as an input and output  
      - like [sequences.py](https://github.com/muyun/dev.programming/blob/master/sicp/exercise_py/sequences.py)  
    

  - mutable Data  
    + how data can be endowed with behavior using message passing and an object system 
    + non-local assignment give the ability to **maintain some state that is local to a function, but evolves over successive calls** to that function   
    +  
    + **Iterator**    
      - process elements of a container value sequentially  
      - **two components: next and a mechanism for signaling the end**    
      - 
    + in the example [mutable_data.py](https://github.com/muyun/dev.programming/blob/master/sicp/exercise_py/mutable_data.py), a mutable list is implemented, and the message passing fucntion is used.  



#### ch2 - Object Abstraction - Organize large programs  
  - **build modular, maintainable, and extensible programs**       
  - functional abstraction  
    + **a method of abstraction that describe compound operations** independent of a particular values  

  - data abstraction  - abstraction barrier  
    +  we can express abstract data using **a collection of selectors and constructors, together with some behavior**  
       - As long as **the behavior conditions are met** (such as the division property),**the selector and constructors constitute a valid representation** of a kind of data  
       - identify a basic set of operations, and then to use only those operations in manipulating the data
       - by restricting the use of operations, it is easier to change the representation of abstract data without chaning the behavior of a program  
    +  like in [data_abstraction.py](https://github.com/muyun/dev.programming/blob/master/sicp/exercise_py/data_abstraction.py),  function numer() and denom() as selectors, and function rational() as constructors to construct the function add_rational(), mul_rational()  
    
  - OOP    
    + like [oop.py](https://github.com/muyun/dev.programming/blob/master/sicp/exercise_py/oop.py)  
  
  - Object Abstraction  
    + like [generic_function.py](https://github.com/muyun/dev.programming/blob/master/sicp/exercise_py/generic_function.py)   
    + generic functions are methods or functions that apply to argumetns of diff types  
      - [generic_function_1.py](https://github.com/muyun/dev.programming/blob/master/sicp/exercise_py/generic_function_1.py)  

#### reference   
* [Notes on software abstraction](https://oh4.co/site/on-abstraction.html)
* [how to design programs-2nd](https://htdp.org/2018-01-06/Book/index.html) 
* [Fluent Python - 2nd](https://learning-oreilly-com.easyaccess1.lib.cuhk.edu.hk/library/view/fluent-python-2nd/9781492056348/?ar=)
* [SICP-2nd](http://sarabander.github.io/sicp/html/Preface.xhtml#Preface)
* [Python Community Interviews](https://realpython.com/team/rwhite/)  
* [Teach Yourself Computer Science](https://teachyourselfcs.com/)
* [The Hitchhiker’s Guide to Python](http://docs.python-guide.org/en/latest/#)
