            .orig x3000             ; начало программы

            LEA R0, HELLO_STR       ; загрузка адреса строки в регистр R0
            PUTS                    
            HALT                    ; остановка программы

HELLO_STR   .stringz "Hello, World!" ; строка для вывода
            .end                    ; конец программы