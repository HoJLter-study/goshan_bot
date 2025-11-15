--- DDL STARTS
DROP TABLE IF EXISTS lessons_slots;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS weeks;
DROP TABLE IF EXISTS users;


CREATE TABLE weeks (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    is_even     BOOLEAN,
    week_start  TEXT,
    week_end    TEXT
);


CREATE TABLE subjects (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT,
    teacher_name    TEXT,
    type            TEXT
);

CREATE TABLE lesson_numbers
(
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    lesson_start    TEXT,
    lesson_end      TEXT
);

CREATE TABLE lessons_slots
(
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    id_subject      INT,
    id_lesson_num   INT,
    comment         TEXT,
    auditory        INT,
    lesson_start    TEXT,
    lesson_end      TEXT,

    FOREIGN KEY (id_subject) REFERENCES subjects(id)
        ON UPDATE CASCADE,
    FOREIGN KEY (id_lesson_num) REFERENCES lesson_numbers(id)
        ON UPDATE CASCADE
);


CREATE TABLE users(
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT
);


--- DML STARTS
INSERT INTO subjects (name, teacher_name, type) VALUES
    ('Основы WEB-технологий', 'Курушин Евгений Андреевич', 'лекция'),
    ('Основы WEB-технологий', 'Сытин Александр Александрович', 'практика'),
    ('Основы WEB-технологий', 'Глумова Екатерина Сергеевна', 'практика'),
    ('Графические информационные технологии', 'Малаканова Марина Александровна', 'лекция'),
    ('Графические информационные технологии', 'Решетов Владимир Александрович', 'лаба'),
    ('Графические информационные технологии', 'Серова Майя Александровна', 'лаба'),
    ('Программирование на языке C++', 'Соколова Элеонора Станиславовна', 'лекция'),
    ('Программирование на языке C++', 'Шагалова Полина Анатольевна', 'практика'),
    ('Программирование на языке C++', 'Шагалова Полина Анатольевна', 'лаба'),
    ('История', 'Гордина Елена Дмитриевна', 'лекция'),
    ('История', 'Гордина Елена Дмитриевна', 'практика'),
    ('Математика', 'Нуятов Андрей Александрович', 'лекция'),
    ('Математика', 'Нуятов Андрей Александрович', 'практика'),
    ('Основы российской государственности', 'Рыжаков Денис Германович', 'лекция'),
    ('Основы российской государственности', 'Рыжаков Денис Германович', 'практика'),
    ('Дискретная математика', 'Степаненко Мария Анатольевна', 'лекция'),
    ('Дискретная математика', 'Степаненко Мария Анатольевна', 'практика'),
    ('Английский язык', 'Коротунова Ирина Александровна', 'практика'),
    ('Английский язык', 'Проскурякова Майя Павловна', 'практика'),
    ('Элективный курс по физической культуре и спорту', 'Должункова Инна Петровна', 'лекция');


INSERT INTO lesson_numbers (id, lesson_start, lesson_end) VALUES
    (1, '8:00', '9:35'),
    (2, '9:45', '11:20'),
    (3, '11:35', '13:10'),
    (4, '13:40', '15:15'),
    (5, '15:25', '17:00'),
    (6, '17:10', '18:45');