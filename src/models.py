import datetime
import os.path
import sqlite3


DATABASE_PATH = "data/database.db"
DATABASE_STRUCTURE = "data/db_structure.sql"


class Database:
    """
    Класс-синглтон, описывающий базу данных.
    При первом запуске инициализирует базу данных
    """
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance._init_database()
        return cls._instance

    def _init_database(self):
        is_db_exists = os.path.exists(DATABASE_PATH)
        self.__conn = sqlite3.connect(DATABASE_PATH)

        if not is_db_exists:
            with open(DATABASE_STRUCTURE, "r") as file:
                script = file.read()
                self.__conn.executescript(script)

    def get_last_week(self):
        res = self.__conn.execute(
            """SELECT * FROM  main.weeks
               ORDER BY id DESC
                LIMIT 1;""")
        return res.fetchall()


class Subject:
    """
    Класс, описывающий дисциплину:
        name: Название дисциплины
        teacher_name: Имя преподавателя
        sj_type: Тип занятия (лекция/практика/семинар)
    """
    def __init__(self, name, teacher_name, sj_type):
        self.name = name
        self.teacher_name = teacher_name
        self.sj_type = sj_type


class Day:
    def __init__(self, id_week):
        self.id_week = id_week


class LessonSlot:
    """
    Класс, представляющий пару и её связи;
        id_day: Идентификатор дня, к которому относится пара
        id_subject: Идентификатор дисциплины, которая будет проходить в этом слоте
        lesson_num: Номер пары (1,2,3,4,5)
        comment: Комментарии к паре (изменения, напоминания)
        auditory: Номер аудитории
    """
    def __init__(self, id_lesson, id_day, id_subject, lesson_num, comment, auditory):
        self.id_lesson = id_lesson
        self.id_day = id_day
        self.id_subject = id_subject
        self.lesson_num = lesson_num
        self.comment = comment
        self.auditory = auditory
        self.lesson_start = SCHEDULE[lesson_num]["start"]
        self.lesson_end = SCHEDULE[lesson_num]["end"]


class Week:
    """
    Класс, представляющий неделю
        is_even: Чётная/нечётная неделя
        start: Дата понедельника
        end: Дата воскресенья
    """
    def __init__(self, id_week, is_even, start, end):
        self.id_week = id_week
        self.is_even = is_even
        self.start = start
        self.end = end


db = Database()
print(db.get_last_week())