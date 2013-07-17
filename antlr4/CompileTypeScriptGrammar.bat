@echo off
REM compiles the antlr4 grammar into java classes, and places them in the correct directory.
antlr4 -o ../java/src/net/digitalprimates/antlr TypeScript.g4
