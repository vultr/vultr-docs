## Introduction

When writing for the Vultr Docs library, use Markdown format. Markdown, designed by [John Gruber](http://daringfireball.net/projects/markdown/), is a lightweight markup language with formatting in plain text. Use this quick reference when formatting your article in Vultr Flavored Markdown. More information about Markdown formatting is available on the [Markdown homepage](http://daringfireball.net/projects/markdown/).

The main differences between Markdown and Vultr Flavored Markdown are as follows:

* Vultr Markdown does not allow inline HTML. You may only use plain text with Markdown formatting.
* Links must start with either the **http://** or **https://** URL scheme. Other URL schemes are stripped.
* Vultr Markdown does not support image links. If you would like to add an image, place a link to the image where you would like it to appear in your article. Our team will add it when publishing your article.

Before submitting your article, please verify your formatting with the preview tab on the submission page.

**The [source Markdown file for this article is available as an example reference](https://github.com/vultr/vultr-docs/blob/main/vultr-docs/vultr-flavored-markdown-tutorial/Vultr%20Flavored%20Markdown%20Tutorial.md).**

---

## Paragraphs and Line Breaks

A paragraph is simply one or more consecutive lines of text, separated by one or more blank lines. Normal paragraphs should not be indented with spaces or tabs.

### Paragraph with line breaks

Add two spaces at the end of a line to force a line break.  
A paragraph is simply one or more consecutive lines of text, separated by one or more blank lines. Normal paragraphs should not be indented with spaces or tabs.

---

## Headers

H1 headings are added automatically at the top of each Vultr doc. **Do not include H1 (\#) in your article.**

\#\# This is an H2

\#\#\# This is an H3

\#\#\#\# This is an H4

\#\#\#\#\# This is an H5

\#\#\#\#\#\# This is an H6

---

## Blockquotes

**Example:**

\> This is a \*\*blockquote\*\* with two paragraphs. Lorem ipsum dolor sit amet,  
\> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.  
\> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.  
\>  
\> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse  
\> id sem consectetuer libero luctus adipiscing.  

**Result:**

> This is a **blockquote** with two paragraphs. Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
> 
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> id sem consectetuer libero luctus adipiscing.

### Nested blockquote

**Example:**

\> This is the first level of quoting.  
\>  
\>\> This is nested blockquote.  
\>  
\> Return to the first level blockquote.  

**Result:**

> This is the first level of quoting.
>
>> This is nested blockquote.
>
> Return to the first level blockquote.

---

## Lists

### Unordered list

**Example:**

\* Red  
\* Green  
\* Blue  

**Result:**

* Red
* Green
* Blue

### Ordered list

**Example:**

    1. Bird  
    2. McHale  
    3. Parish  

**Result:**

1. Bird
2. McHale
3. Parish

### Ordered list with 2 paragraphs

**Example:**

    1. This is a list item with two paragraphs. Indent the second paragraph 4 spaces to align with the list. 
    
        Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus. Donec sit amet nisl. Aliquam semper ipsum sit amet velit.
    
    2. This is the second list item.

**Result:**

1. This is a list item with two paragraphs. Indent the second paragraph 4 spaces to align with the list.

    Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, 
 risus. Donec sit amet nisl. Aliquam semper ipsum sit amet velit.

2. This is the second list item.

---

## Code Blocks

Code blocks are indented with 4 spaces. Do not use backticks.

    int main() {
        std::cout << "Hello World!";
        return 0;
    }

### Inline code

Use a single backtick for inline code.

**Example:**

Use the \`printf()\` function.  

**Result:**

Use the `printf()` function.  

### Literal backticks

Wrap a command with two backticks if you need to show a literal backtick.

**Example:**

There is a \`\`literal backtick (\`)\`\` here.

**Result:**

There is a ``literal backtick (`)`` here.

### Code blocks in Lists

Code blocks in lists are **indented by eight spaces**. Text indented by four spaces become part of the list item.

**Example:**

    1. This is item one.

        Here is the code for item one.

            int main() {
                std::cout << "Hello World!";
                return 0;
            }

    2. This is item two.
    3. This is item three.

**Result:**

1. This is item one.

    Here is the code for item one:

        int main() {
            std::cout << "Hello World!";
            return 0;
        }

2. This is item two.
3. This is item three.

### Horizontal Rules

Use three hyphens to make a horizontal rule.

**Example:**

\---

**Result:**

---

## Links

We support inline links, which are preferred for ease of editing and review. Please do not use reference-style links. 

### Inline links

**Example:**

This is \[an example\]\(http://example.com/ "The Link Title"\) inline link, titled "The Link Title".  
\[This link\]\(http://example.net/\) has no title attribute.  

**Result:**

This is [an example](http://example.com/ "The Link Title") inline link, titled "The Link Title".  
[This link](http://example.net/) has no title attribute.  

**Please do not use reference-style links, like this example:**

    Some popular search engines are [Google][1], [Yahoo][2], and [MSN][3].  

    [1]: http://google.com/ "Google"  
    [2]: http://search.yahoo.com/ "Yahoo Search"  
    [3]: http://search.msn.com/ "MSN Search"  


### Automatic links

Wrap URLs with angle brackets to make an automatic link.

**Example:**

    Make automatic links for URLs and email addresses like this: 
    <http://example.com/> and <address@example.com>

**Result:**

Make automatic links for URLs and email addresses like this: <http://example.com/> and <address@example.com>  

---

## Emphasis

**Example:**

\*single asterisks make italic text\*  
\_single underscores make italic text\_  
\*\*double asterisks make bold text\*\*  
\_\_double underscores make bold text\_\_  
This also works in the middle\*\*of\*\*words

**Result:**

*single asterisks make italic text*  
_single underscores make italic text_  
**double asterisks make bold text**  
__double underscores make bold text__  
This also works in the middle**of**words

Note: It's common to have variable names in technical documents with underscores. Be careful to escape your underscores!

**Correct:**  

    THE\_EXAMPLE\_VARIABLE

THE\_EXAMPLE\_VARIABLE

**Incorrect:**  

    THE_EXAMPLE_VARIABLE

THE_EXAMPLE_VARIABLE

---

## Special Characters

Use a backslash to escape special characters.

**Example:**

\\\*this text is surrounded by literal asterisks\\\*  
\\\\  
\\\`  
\\\*  
\\\_  
\\\{\\\}  
\\\[\\\]  
\\\(\\\)  
\\\#  
\\\+  
\\\-  
\\\.  
\\\!  

**Result:**

\*this text is surrounded by literal asterisks\*  
\\  
\`  
\*  
\_  
\{\}  
\[\]  
\(\)  
\#  
\+  
\-  
\.  
\!  

---

## Automatic Escaping for Special Characters

**Copyright HTML entity:**

    &copy;  

&copy;

**Ampersands and angle brackets are converted automatically without delimiters.**

AT&T

4 < 5 = 5 > 4

---

## Keyboard

Literal keystrokes are represented with short-codes. You should distinguish uppercase/lowercase with the shift key.

* :key_x: : type a lowercase "x".
* :key_shift:+:key_x: : type an uppercase "X".

### Function Keys

:key\_f1: :key\_f2: :key\_f3: :key\_f4: :key\_f5: :key\_f6: :key\_f7: :key\_f8: :key\_f9: :key\_f10: :key\_f11: :key\_f12:

:key_f1: :key_f2: :key_f3: :key_f4: :key_f5: :key_f6: :key_f7: :key_f8: :key_f9: :key_f10: :key_f11: :key_f12:

### Symbols

:key\_tilde: :key\_grave: :key\_exclamation: :key\_at: :key\_pound: :key\_dollar: :key\_percent: :key\_carat: :key\_ampersand: :key\_asterisk: :key\_lparen: :key\_rparen: :key\_dash: :key\_underscore: :key\_plus: :key\_equals: :key\_lbracket: :key\_lbrace: :key\_rbracket: :key\_rbrace: :key\_pipe: :key\_backslash: :key\_semicolon: :key\_colon: :key\_quote: :key\_apostrophe: :key\_lt: :key\_comma: :key\_gt: :key\_period: :key\_question: :key\_forwardslash: :key\_space: :key\_spacebar:

:key_tilde: :key_grave: :key_exclamation: :key_at: :key_pound: :key_dollar: :key_percent: :key_carat: :key_ampersand: :key_asterisk: :key_lparen: :key_rparen: :key_dash: :key_underscore: :key_plus: :key_equals: :key_lbracket: :key_lbrace: :key_rbracket: :key_rbrace: :key_pipe: :key_backslash: :key_semicolon: :key_colon: :key_quote: :key_apostrophe: :key_lt: :key_comma: :key_gt: :key_period: :key_question: :key_forwardslash: :key_space: :key_spacebar:

### Special Keys

:key\_esc: :key\_backspace: :key\_tab: :key\_caps: :key\_capslock: :key\_enter: :key\_return: :key\_shift: :key\_control: :key\_ctrl: :key\_super: :key\_win: :key\_command: :key\_alt: :key\_meta: :key\_printscreen: :key\_sysrq: :key\_scrolllock: :key\_pause: :key\_break: :key\_delete: :key\_end: :key\_pagedown: :key\_pgdn: :key\_insert: :key\_home: :key\_pageup: :key\_pgup: :key\_up: :key\_left: :key\_down:  
:key\_right: :key\_numlock:

:key_esc: :key_backspace: :key_tab: :key_caps: :key_capslock: :key_enter: :key_return: :key_shift: :key_control: :key_ctrl: :key_super: :key_win: :key_command: :key_alt: :key_meta: :key_printscreen: :key_sysrq: :key_scrolllock: :key_pause: :key_break: :key_delete: :key_end: :key_pagedown: :key_pgdn: :key_insert: :key_home: :key_pageup: :key_pgup: :key_up: :key_left: :key_down: :key_right: :key_numlock:

### Alpha Numeric

:key\_a: :key\_b: :key\_c: :key\_d: :key\_e: :key\_f: :key\_g: :key\_h: :key\_i: :key\_j: :key\_k: :key\_l: :key\_m: :key\_n: :key\_o: :key\_p: :key\_q: :key\_r: :key\_s: :key\_t: :key\_u: :key\_v: :key\_w: :key\_x: :key\_y: :key\_z:

:key_a: :key_b: :key_c: :key_d: :key_e: :key_f: :key_g: :key_h: :key_i: :key_j: :key_k: :key_l: :key_m: :key_n: :key_o: :key_p: :key_q: :key_r: :key_s: :key_t: :key_u: :key_v: :key_w: :key_x: :key_y: :key_z:

:key\_1: :key\_2: :key\_3: :key\_4: :key\_5: :key\_6: :key\_7: :key\_8: :key\_9: :key\_0:

:key_1: :key_2: :key_3: :key_4: :key_5: :key_6: :key_7: :key_8: :key_9: :key_0:

### Example usage:

Save the file by pressing :key\_ctrl:+:key\_x:, then :key\_y:.

Save the file by pressing :key_ctrl:+:key_x:, then :key_y:.

---

## Tables

General table syntax and an example:

![TableExample](https://ewr1.vultrobjects.com/vultr-docs/5365/TableExample.png)

**Result:**

|table|100|
|thead|
|tr|
|th|25|Column 1|
|th|50|Column 2|
|th|25|Column 3|
|tbody|
|tr|
|td|Data 1|
|td|Data 2|
|td|Data 3|
|tr|
|td|Data 4|
|td|Data 5|
|td|Data 6|

