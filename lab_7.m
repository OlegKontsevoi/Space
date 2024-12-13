clc;clear
Y=[0.01 -0.399 -2.05 72];
h=0.1;
exit=true;
flag=false;
a=Y(1,1);
b=Y(1,2);
c=Y(1,3);
d=Y(1,4);
while(exit)
    clc
    while(true)
    menu=input('Выберите действие:\n 1 - Выбор коэффициентов\n 2 - Выбор метода решения\n 3 - Изменение шага интегрирования\n 4 - Начать расчёт\n 5 - Выход из программы \n Действие - ');
    if((menu==1)||(menu==2)||(menu==3)||(menu==4)||(menu==5))
        break;
    else
        disp('Такого действия не существует, повторите попытку')
    end
    end
    
    switch (menu)
        case 1
    chtenie=input('Выберите способ чтения коэффициентов (1 - стандартные; 2 - чтение новых коэффициентов из консоли) - ');
    if ((chtenie~=1)&&(chtenie~=2))
        disp('Такого действия не существует, приняты стандартные значения');
       Y=[0.01 -0.399 -2.05 72];
    end
        switch(chtenie) 
        case 2 
            Y=Chtenie_nachalnie_znachenie();
            a=Y(1,1);
            b=Y(1,2);
            c=Y(1,3);
            d=Y(1,4);
        end
        case 2
            flag=true;
    while (true) 
    type=input('Выберите способ решения дифференциального уравнения (1 - метод Эйлера; 2 - метод Рунге-Кутты) - ');
        if ((type==1)||(type==2))
            break;
        else
            disp('Такого действия нет, повторите попытку');
        end
    end
    
    
        case 3
    while(true) 
    step=input('Хотите изменить шаг интегрирования? (1 - да, 2- нет) - ');
    if (step==1)
        h=input('Введите новый шаг интегрирования - ');
    end
    if((step==1)||(step==2))
        break;
    else
        disp('Такого действия не существует, повторите попытку');
    end
    end
    
    
        case 4
            if(flag==false)
                disp('Не выбран способ решения');
                pause
                continue
            end
    switch (type) 
        case 1 
            [x,y,file]=reshenie_EILER(Y,h);
            method_name='М.Эйлера';
        case 2 
            [x,y,file]=reshenie_Runge(Y,h);
             method_name='М.Рунге-Кутта';
    end
        sohranenie = input('Сохранить в файл (1 - да/2 - нет) - ','s');
      switch (sohranenie) 
        case '1'
            write_values(Y, x, y, file, a, b, c, d, h, method_name);
        case '2'
           continue;
        otherwise
            disp('Неверная команда'); pause; break;
      end
    
    
        case 5 
            exit=false;
            clc
    end
end
