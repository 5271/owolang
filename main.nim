import strutils;

var loopVarNumber = 0;

proc charToCommand(ch: char): string =
    var loopVar = "b" & intToStr(loopVarNumber);
    case ch:
    of 'o': # Substracts 1
        return "i[a] = i[a] + 1;";
    of 'x': # Adds 1
        return "i[a] = i[a] - 1;";
    of '<': # Moves 1 backward in register
        return "a = a - 1;";
    of '>': # Moves 1 forward in register
        return "a = a + 1;";
    of 'w': # Writes a char from the ascii value
        return "printf(\"%i\", itoa(i[a]));";
    of 'm': # Writes number value
        return "printf(\"%i\\n\", i[a]);";
    of '.': # Writes a new line
        return "printf(\"\\n\");";
    of 'q': # Start of a loop
        let opt = ""&
        "int x = i[a]; \n" &
        "   while (x) { \n";
        return opt.replace("x",loopVar);
    of 'p': # End of a loop
        let opt = ""&
        "\n   x = x - 1; \n" &
        "   } \n";
        loopVarNumber = loopVarNumber + 1;
        return opt.replace("x",loopVar);
    else:
        return "";

var code: string = "" &
"#include <stdio.h> \n\n" &
"int main(){\n\n" &
"   int a = 0;\n" &
"   int i[1000] = {0};";

let owocode = readFile("code.owo").replace("\n","")

for ch in owocode:
    code = code & "\n   " & charToCommand(ch);

code = code & "\n}"

writeFile("out.c", code);