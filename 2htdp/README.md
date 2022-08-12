
### note on how to design programs 

* TODO  
    - event programming  
    - batch programming   


#### Abstraction  
* **creation** - **repeated code patterns call** for abstraction  
    - **creation of single points of control for some common functionality**, and easier to maintain program
        +  save work and mistakes, inefficiencies, and problems headaches  
    - how -> find differences 
    - **form an abstraction** instead of copying and modifying an code  

* **resue** of the abstractions   
    - **appropriate pieces of documentation** - **a purpose statement, a signature, and good examples** - programmers use these to apply abstractions  


* abstract over similarities  
    - to abstract is to eliminate similarities  

    - to abstract is to **turn something concrete into a parameter**  
        + to abstract similar function definitions through replacing concrete values 
        + to abstract similar data definitions, you create parametric data definitions  

        +   through abstraction, you can have a single point of control over all these functions  
    
    -  **the template is created from the data definition**; 
    and to organize functions around the organization of the input data definition    



#### Data  
* a good programmer **designs programs**  
    - A bad programmer tinkers until the program seems to work  

*  TODO  - check more data definitions and representation 
    - [The data model behind Notion's flexibility](https://www.notion.so/blog/data-model-behind-notion)
    - [Nushell](https://www.nushell.sh/blog/2019-08-23-introducing-nushell.html)


* **design recipe**  

* design functions  
    - information (domain)  <=>  Data  (program)  <=> information (domain)

    - data definitions  
        + how to represent input information as data  

    - domain knowledge  
        + work with domain experts 
        + library functions  

#### systematic program design  
* problem analysis 
    - **what is relevant in the problem statement** and what can be ignored 
    - whether the chosen language and its libraries **provide certain operations** for the data, or we might develop auxiliary functions for the operations


* **design recipe**  offers a step-by-step process  in a systematic manner  
  with a way of **organizing programs around problem data**  
    - **formulate data definitions** - Indentify the information that must be represented  
    - **state what kind of data** the desired function consumes and produces  
    
    - functional examples - illustrate the function's purpose from examples  
    
    - function template - translate the data definitions into an outline of the function  
    
    - testing

* iterative refinement  
    - strip away all inessential details and **find a solution for  the remaining core problem**   
    - **A refinement step adds in one of the omitted details and re-solves the expanded problem**  
    - An iteration of the refinement steps eventually leads to a complete solution  


* **interactive products** 
    - creating software provides immediate feedback and  thus leads to exploration,
experimentation, and self-vealuation


### notes on compiler  
* scheme 
  
* about meta-circular evaluator and compiler 


#### issues    
* fix the issue - cannot display the image to use 2htdp/image directly 

* 现在的编程工作更多是调用和组合别人写的轮子，
而不像以前那样需要对轮子如何抽象和实现理解得很清楚  

#### reference 
* [how to design programs-2nd](https://htdp.org/2018-01-06/Book/index.html) 
* [Ch3: Interpreting Computer Programs](http://composingprograms.com/pages/31-introduction.html) 
* [Chapter 14- Languages](http://www.catb.org/~esr/writings/taoup/html/ch14s04.html#c_lang)
* [Fluent Python - 2nd](https://learning-oreilly-com.easyaccess1.lib.cuhk.edu.hk/library/view/fluent-python-2nd/9781492056348/?ar=)
* [compiler](http://composingprograms.com/pages/31-introduction.html#programming-languages) 
* [SICP-2nd](http://sarabander.github.io/sicp/html/Preface.xhtml#Preface)
* lisp in small pieces 