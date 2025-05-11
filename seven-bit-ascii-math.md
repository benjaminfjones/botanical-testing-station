---
date: 2025-05-10
tags: mathematics, communication
---
# 7-bit ASCII Math

## Advice for students

Here is some good advice about writing mathematics in plain text. LaTeX and
client or server side rendering tools for the web are nice, but they're also heavy
dependencies. Sometimes text is all you need.

[Writing Mathematics in Plain Text Email](https://pages.uoregon.edu/ncp/Courses/MathInPlainTextEmail.html) by N. Christopher Phillips.

This guide is a lot more comprehensive and even has exercises :)

[A Primer for Communicating Mathematics via Plain
Text](https://cse.sc.edu/~fenner/latex-ASCII.pdf) by Stephen Fenner

## Unicode math

There have been attempts to standardize writing mathematics in unicode. That seems like
a reasonable goal but the result is much more complicated that you'd think it should be.
For example, this attempt [UnicodeMath](https://www.unicode.org/notes/tn28/UTN28-PlainTextMath-v3.1.pdf) whose target is "professional looking word"!?

> With a few conventions, Unicode can encode most mathematical expressions in
> a readable nearly plain text called UnicodeMath. The format is linear, but it
> can be converted to a built-up format that Microsoft Office applications like
> Word refer to as “Professional”

Several of the rendered examples in the PDF above show up as garbage on a modern system,
which is also a bummer.


## Artificial Intelligence

Of course there is AI (not going to link to it) on offer to convert your plain
text math into whatever.

`30 (sum_{n=0}^\infty (1/2)^n)` --> `30 * (sum from n = 0 to infinity of (1/2)^n)`

Ok, fine.


## Best for last: sci.math

Dave Renfro writes on [math.stackexchange](https://math.stackexchange.com/questions/4044152/whats-the-best-way-to-write-math-expressions-in-plain-text-for-example-in-the)

>  looking through old sci.math posts (before 2000 is best), since everything
>  there was ASCII only

Getting usenet posts from 25+ years ago is tough though. Internet Archive has [some
collections](https://archive.org/details/usenet?tab=collection&query=sci.math) but it's not clear what they contain without downloading them (big compressed blobs) in full.
