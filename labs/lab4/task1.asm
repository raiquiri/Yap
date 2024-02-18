.orig x3000             ; начало программы

HELLO_STR .stringz "Hello, World!" ; строка для вывода
LEA R0, HELLO_STR       ; загрузка адреса строки в регистр R0
PUTS                    
HALT                    ; остановка программы

.end                    ; конец программы