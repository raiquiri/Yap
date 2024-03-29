.ORIG x3000         ; начало программы

WARNING
    LEA R0, HS          ; загрузка адреса строки в регистр R0
    PUTS                ; вывод строки по адресу R0
    LEA R1, STRING      ; загрузка адреса памяти IO в регистр R1


INP                     ; Ввод символа с клавиатуры
    GETC                ; Получение введенного символа
    OUT                 ; Вывод символа на экран

    LD R2, LINE         ; Загрузка значения LINE в R2
    ADD R2, R2, R0      ; Проверка на конец строки, суммируя адрес строки и введенный символ
    BRz SORTOUT         ; Если конец строки, переход к сортировке SORTOUT

    LD R2, ZERO         ; Загрузка значения ZERO  в R2
    ADD R0, R0, R2      ; Преобразование ASCII в число
    STR R0, R1, #0      ; Сохранение числа в массиве STRING
    ADD R1, R1, #1      ; Увеличение адреса массива на 1 для следующего числа
    BRnzp INP           ; Повторение ввода для следующего символа, если не конец строки

SORTOUT                 ; Метка для начала сортировки

    LEA R1, STRING      ; Загрузка адреса массива STRING в R1
    LD R0, NCNTR        ; Загрузка значения NCNTR (негативный счетчик) в R0
    ADD R0, R7, R0      ; Проверка количества обменов
    BRz LOAD            ; Если обменов нет, переход к выводу LOAD

    LD R7, CNTR         ; Загрузка значения CNTR (счетчик) в R7 (счетчик обменов)
    LD R4, CNTR         ; Загрузка значения CNTR в R4 (счетчик внутреннего цикла)

    ADD R2, R1, #0      ; Загрузка адреса первой цифры в R2
    ADD R3, R1, #1      ; Загрузка адреса второй цифры в R3

SORTIN                  ; Метка для начала внутреннего цикла сортировки

    LDR R5, R2, #0      ; Загрузка первой цифры в R5
    LDR R6, R3, #0      ; Загрузка второй цифры в R6

    NOT R6, R6          ; Инвертирование второй цифры
    ADD R6, R6, #1      ; Положительная вторая цифра

    ADD R0, R5, R6      ; Сравнение двух цифр
    BRnz SKIP           ; Переход, если первая цифра больше второй
    BRp SWAP            ; Переход, если вторая цифра больше первой

SKIP                    ; Метка пропуска обмена

    ADD R6, R6, #-1     ; Возврат к исходному значению второй цифры
    NOT R6, R6          ; Инвертирование обратно
    ADD R2, R2, #1      ; Переход к следующей цифре
    ADD R3, R3, #1      ; Переход к следующей цифре
    ADD R4, R4, #-1     ; Уменьшение счетчика внутреннего цикла
    BRz SORTOUT         ; Если конец массива, переход к сортировке SORTOUT
    BRp SORTIN          ; Повторение внутреннего цикла сортировки

SWAP                    ; Метка для обмена

    ADD R7, R7, #-1     ; Увеличение счетчика обменов
    ADD R6, R6, #-1     ; Возврат к исходному значению второй цифры
    NOT R6, R6          ; Инвертирование обратно
    STR R6, R2, #0      ; Сохранение второй цифры в памяти
    STR R5, R3, #0      ; Сохранение первой цифры в памяти
    BRnzp SORTIN        ; Повторение внутреннего цикла сортировки

LOAD                    ; Метка для вывода

    LEA R1, STRING      ; Загрузка адреса массива STRING в R1
    LD R2, PZERO        ; Загрузка значения PZERO (коррекция числа в ASCII) в R2
    LD R3, NCNTR        ; Загрузка значения NCNTR в R3 (негативный счетчик)

SHOW                    ; Метка для вывода цифр

    LDR R0, R1, #0      ; Загрузка цифры в R0
    ADD R0, R0, R2      ; Преобразование числа в ASCII
    ADD R1, R1, #1      ; Увеличение адреса массива для следующей цифры
    OUT                 ; Вывод цифры на экран
    ADD R3, R3, #1      ; Увеличение счетчика
    BRp STOP            ; Если конец строки, завершение
    BRnzp SHOW          ; Повторение вывода

STOP                    ; Метка для завершения программы

    HALT                ; Остановка выполнения программы

HS .STRINGZ "Pls, input a 10-digit string in random order without any separators: " ; Строка-приветствие
STRING .BLKW #100       ; Массив для хранения строки
CNTR .FILL #9           ; Счетчик для сравнений
NCNTR .FILL #-9         ; Негативный счетчик для проверки конца строки
LINE .FILL #-10         ; Индикатор конца строки
ZERO .FILL #-48         ; Коррекция ASCII в число (-0)
PZERO .FILL #48         ; Коррекция числа в ASCII (+0)
.END                    ; Конец программы