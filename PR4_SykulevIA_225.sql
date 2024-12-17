-- public.medical определение

-- Drop table

-- DROP TABLE public.medical;

CREATE TABLE public.medical (
	medical_id serial4 NOT NULL,
	last_name varchar(50) NULL,
	first_name varchar(50) NULL,
	patronymic varchar(50) NULL,
	profession varchar(70) NOT NULL,
	CONSTRAINT medical_pkey PRIMARY KEY (medical_id)
);

-- Permissions

ALTER TABLE public.medical OWNER TO postgres;
GRANT ALL ON TABLE public.medical TO postgres;


-- public.patient определение

-- Drop table

-- DROP TABLE public.patient;

CREATE TABLE public.patient (
	patient_id serial4 NOT NULL,
	last_name varchar(50) NULL,
	first_name varchar(50) NULL,
	patronymic varchar(50) NULL,
	birthday_patient date NULL,
	address varchar(100) NULL,
	CONSTRAINT patient_pkey PRIMARY KEY (patient_id)
);

-- Permissions

ALTER TABLE public.patient OWNER TO postgres;
GRANT ALL ON TABLE public.patient TO postgres;


-- public.reception_patients определение

-- Drop table

-- DROP TABLE public.reception_patients;

CREATE TABLE public.reception_patients (
	reception_patients_id serial4 NOT NULL,
	medical_id int4 NOT NULL,
	patient_id int4 NOT NULL,
	quintation_price numeric NULL,
	deduction_price numeric NULL,
	salary numeric GENERATED ALWAYS AS (quintation_price * (deduction_price / 100) * 0.87) STORED NULL,
	CONSTRAINT reception_patients_pkey PRIMARY KEY (reception_patients_id),
	CONSTRAINT reception_patients_medical_fk FOREIGN KEY (medical_id) REFERENCES public.medical(medical_id),
	CONSTRAINT reception_patients_patient_fk FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id)
);

-- Permissions

ALTER TABLE public.reception_patients OWNER TO postgres;
GRANT ALL ON TABLE public.reception_patients TO postgres;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE public.reception_patients TO "Users_225_22" WITH GRANT OPTION;

INSERT INTO public.medical (last_name,first_name,patronymic,profession) VALUES
	 ('Иванова','Анастасия','Викторовна','Лечащий врач'),
	 ('Смирнов','Михаил','Николаевич','Стоматолог'),
	 ('Петрова','Елена','Андреевна','Психиатр'),
	 ('Кузнецов','Александр','Викторович','Хирург'),
	 ('Морозова','Ольга','Сергеевна','Генетик'),
	 ('Лебедев','Дмитрий','Иванович','Оториноларинголог'),
	 ('Новикова','Татьяна','Павловна','Кардиолог'),
	 ('Соколов','Андрей','Александрович','Рadiолог'),
	 ('Кравцова','Мария','Валерьевна','Анестезиолог'),

	 ('Грибыков','Игорь','Николаевич','Офтальмолог');
INSERT INTO public.patient (last_name,first_name,patronymic,birthday_patient,address) VALUES
	 ('Иванова','Анастасия','Викторовна','1990-05-15','ул. Ленина, дом 12, квартира 5'),
	 ('Смирнов','Михаил','Николаевич','1982-08-20','пр-т Мира, дом 30, офис 304'),
	 ('Петрова','Елена','Андреевна','1978-03-25','ул. Советская, дом 7, этаж 3, квартира 14'),
	 ('Кузнецов','Александр','Викторович','1995-02-28','пос. Новый городок, ул. Центральная, дом 1'),
	 ('Морозова','Ольга','Сергеевна','1969-09-18','г. Москва, ул. Тверская, дом 22'),
	 ('Лебедев','Дмитрий','Иванович','1988-12-05','ул. Пушкина, дом 15, квартира 9'),
	 ('Новикова','Татьяна','Павловна','1992-07-10','пос. Солнечный городок, ул. Солнечная, дом 42'),
	 ('Соколов','Андрей','Александрович','1975-01-02','г. Санкт-Петербург, пр-т Невский, дом 56'),
	 ('Кравцова','Мария','Валерьевна','2000-06-30','ул. Студенческая, дом 25, студия 314'),
	 ('Грибыков','Игорь','Николаевич','1955-11-14','пос. Лесной хутор, ул. Лесная, дом 88');

INSERT INTO public.reception_patients (medical_id,patient_id,quintation_price,deduction_price) VALUES
	 (1,1,5000.00,20),
	 (2,2,7500.00,30),
	 (3,3,4000.00,15),
	 (4,4,6000.00,25),
	 (5,5,5500.00,22),
	 (6,6,4500.00,18),
	 (7,7,7000.00,28),
	 (8,8,3500.00,14),
	 (9,9,6500.00,26),
	 (10,10,4800.00,19);

