#how to add a comment in terraform


#1. hash Comment(#)--->This is a single line comment 
#example 1:Single-line Comment 
variable "comment_example" {
    type = string
    default = "comment_example" #you can always change the default value
}


//2.double-slash Comment (//)--->This can also be used to create a single line comment
//Example 2:Single-line comment made with (//)

variable "comment_example_2" {
    type = string 
    default = "Comment_example_2" //You can always change the default value   
}

#3.Multi-line comments (/**/)---> This is used to comment multiple lines 
#Example 3:Multi-line comments

variable "comment_example_3" {
    type = string 
    default = "Comment_example_3" /*You can always change the default value
    
    more lines of comment can now be added*/   
}
