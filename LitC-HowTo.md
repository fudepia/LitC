# LitC

LitC, which stands for Literate C, is a format inspired by Literate Haskell.

## Compilation

- `make c       file=source.lit.c` or `$(CC) source.lit.c`: To compile the project directly (since LitC code is basically proper C code)
- `make strip   file=source.lit.c`: To generate `source.c` with minimal comments
- `make tex     file=source.lit.c texTemplate=template.tex`: To generate upLaTeX file
- `make pdf     file=source.lit.c texTemplate=template.tex`: To generate documentation only
- `make tex-pdf file=source.lit.c texTemplate=template.tex`: To generate upLaTeX file and also compile it to PDF.
- `make all     file=source.lit.c texTemplate=template.tex`: To generate all files

TODO: Generate TeX with appendix that contains all extra codes.

TODO: Support generating to Markdown

## Syntax

### Code Block

Code blocks are codes that'll be shown as snippet within the documentation.

```c
//cb<
int main() {
    return 0;
}
//>cb
```

Notice that codes which aren't surrounded by code block won't be included into documentation.

### Text Block

`<env>` are optional field where if provided, will wrap the whole text into the given environment.

```c
/* <env>
   ...
<env> */
```

### Line Comment

Line comments will be directly output to documentation. The difference between line command and text block is that when stripping `source.lit.c` to `source.c`, text blocks will be strip while line comments won't.

So line comments are recommended to be used to explain things that are neccessary for code maintainence.

```c
// ...
```

Notice: The space in `//␣` in mandatory!
