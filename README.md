1 лабораторная работа. Запускаем через терминал скрипт script.sh  c параметром имя подготовленной программы на языке С (у нас это файл program.c). После этого
в папке появится файл run. Это и есть скомпилированная программа. Она уже с нужными правами доступа для запуска.

2 лабораторная работа. Код находится в файле main.cpp, скомпилированная программа находится в файле threads_messaging.

4 лабораторная работа. изначально было прописано файлы Configure.ac, Makefile.am, в папке src: Makefile.am, main.c. После этого набрал следующие команды:

autoreconf --install

./configure

make

после этого в папке src появился файл hello

5 лабораторная работа. Набираем следующие команды для настройки докера, находящегося в папке

docker build . -t new

docker run -p 80:80 new python3 /code/manage.py runserver 0.0.0.0:80
