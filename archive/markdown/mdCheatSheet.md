# Introduction to Markdown

## Basics

***
I really love **bold text** and *italicized text*, but nothing's better than ***bold and italicized text***. Use one "*" for bold, two for italics, and three for bold and italics. ~~Strikthrough your screwups~~ with two tildas.

Ending a line with two or more spaces will create a line break.  
Formatting text is easy since paragraph spacing carries over directly to markdown unlike HTML.

## Quotes

***
Simple Quotes
> Creating a quote isn't too difficult. Just add a ">" before the text.

Blockquotes
> Blockquotes aren't too hard to make either.
>
> Just add ">" on every line you want blocked together.

Nested Blockquotes
> Nested blockquotes are a little more interesting.
>
>
>> Use multiple ">" to dictate quote hierarchy.
>>
>>> Whee!

Blockquotes on Steroids

> ### Blockquotes can be headings!
>
> - By the way, "-" at the start of a line will create bullets.
> - - And even sub-bullets.
>
> And *italics* and **bold** works too.

## Lists

***
Here's where things get interesting. As long as a list starts with a "1.", you can number things in any order.

For example,

1. Kanye West
2. Drake
3. Travis Scott

Or,

1. Billy Joel
8. The Beatles
120. Queen  

*I numbered the second list with "1", "8", and "120," and it changed it to "1", "2", and "3" automatically.*

## Unordered Lists

***
These are relatively easy to make as well.

- Just use dashes
- and it will
- automatically make
- bullets for you.

You can nest items too.

- Indentation
  - lets you nest bullets
    - for better organization.

Items can also be added while preserving the continuity of the list by indenting the other element.

- HTML
    >*I see no use for this now that I know markdown.*
- Javascript
- Python  
    *Python is just boneless java.*
- Java
- LC-3 Assembly

## Code Blocks

***
    Indent code blocks with four spaces or a tab, or 8 spaces in a tab if within a list. 
Denote a phrase as code using `backticks`.

Adding three backticks will also display code blocks. Specifying a language after the backticks will even show syntax highlighting!

```c++
#include <iostream>
int main(){
    std::cout<<"Hello, World!\n">>
}
```

## Links

***
Links can be added by enclosing text in brackets and following it with a URL in parentheses.
> My favorite news source is [Reddit](reddit.com).

Link titles when hovering can be added with quotes within the link's parentheses.
> My favorite social media is [Facebook](facebook.com "Even though Zucc's stealing my data!").

Links and emails just need angle brackets to be represented.
><https://www.gmail.com>  
><ishan0102@gmail.com>

## Images

***
Images are shown with an !exclamation mark, [brackets with alt text], and (a URL to the image).

![Great Wave off Kanagawa](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Tsunami_by_hokusai_19th_century.jpg/700px-Tsunami_by_hokusai_19th_century.jpg)
>*The Great Wave off Kanagawa by Katsushika Hokusai*

## Tables

***
Perhaps the most beautiful thing that can be done with markdown is creating pretty tables. Although it's not part of the core Markdown spec, most Markdown platforms support them. You use | as column dividers and new lines as row dividers, and colons to dictate alignment.

| Food    |   Sports   |   Majors |
| :------ | :--------: | -------: |
| Bananas |  Climbing  |      ECE |
| Cake    | Basketball | Business |
| Cookies |  Football  |       CS |

## Extra

***
Horizontal lines are made with "***".

To display a character normally used for markdown formatting, use the escape key "\\".

> \** I'm able to display asterisks here without bolding my text.\**

$\int\frac{1}{2}dx - { \int\frac{1}{2}dx}$