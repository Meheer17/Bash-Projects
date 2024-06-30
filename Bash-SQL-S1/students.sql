--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (41, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (42, 'Web Programming');
INSERT INTO public.courses VALUES (43, 'Database Systems');
INSERT INTO public.courses VALUES (44, 'Computer Networks');
INSERT INTO public.courses VALUES (45, 'SQL');
INSERT INTO public.courses VALUES (46, 'Machine Learning');
INSERT INTO public.courses VALUES (47, 'Computer Systems');
INSERT INTO public.courses VALUES (48, 'Web Applications');
INSERT INTO public.courses VALUES (49, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (50, 'Python');
INSERT INTO public.courses VALUES (51, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (52, 'Calculus');
INSERT INTO public.courses VALUES (53, 'Game Architecture');
INSERT INTO public.courses VALUES (54, 'Algorithms');
INSERT INTO public.courses VALUES (55, 'UNIX');
INSERT INTO public.courses VALUES (56, 'Server Administration');
INSERT INTO public.courses VALUES (57, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (57, 'Database Administration');
INSERT INTO public.majors VALUES (58, 'Web Development');
INSERT INTO public.majors VALUES (59, 'Data Science');
INSERT INTO public.majors VALUES (60, 'Network Engineering');
INSERT INTO public.majors VALUES (61, 'Computer Programming');
INSERT INTO public.majors VALUES (62, 'Game Design');
INSERT INTO public.majors VALUES (63, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (57, 41);
INSERT INTO public.majors_courses VALUES (58, 42);
INSERT INTO public.majors_courses VALUES (57, 43);
INSERT INTO public.majors_courses VALUES (59, 41);
INSERT INTO public.majors_courses VALUES (60, 44);
INSERT INTO public.majors_courses VALUES (57, 45);
INSERT INTO public.majors_courses VALUES (59, 46);
INSERT INTO public.majors_courses VALUES (60, 47);
INSERT INTO public.majors_courses VALUES (61, 44);
INSERT INTO public.majors_courses VALUES (57, 48);
INSERT INTO public.majors_courses VALUES (62, 49);
INSERT INTO public.majors_courses VALUES (59, 50);
INSERT INTO public.majors_courses VALUES (61, 51);
INSERT INTO public.majors_courses VALUES (63, 47);
INSERT INTO public.majors_courses VALUES (62, 52);
INSERT INTO public.majors_courses VALUES (58, 41);
INSERT INTO public.majors_courses VALUES (59, 52);
INSERT INTO public.majors_courses VALUES (58, 51);
INSERT INTO public.majors_courses VALUES (62, 53);
INSERT INTO public.majors_courses VALUES (63, 44);
INSERT INTO public.majors_courses VALUES (62, 54);
INSERT INTO public.majors_courses VALUES (63, 55);
INSERT INTO public.majors_courses VALUES (63, 56);
INSERT INTO public.majors_courses VALUES (61, 47);
INSERT INTO public.majors_courses VALUES (61, 50);
INSERT INTO public.majors_courses VALUES (60, 57);
INSERT INTO public.majors_courses VALUES (58, 48);
INSERT INTO public.majors_courses VALUES (60, 54);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (25, 'Rhea', 'Kellems', 57, 2.5);
INSERT INTO public.students VALUES (26, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (27, 'Kimberly', 'Whitley', 58, 3.8);
INSERT INTO public.students VALUES (28, 'Jimmy', 'Felipe', 57, 3.7);
INSERT INTO public.students VALUES (29, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (30, 'Casares', 'Hijo', 62, 4.0);
INSERT INTO public.students VALUES (31, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (32, 'Sterling', 'Boss', 62, 3.9);
INSERT INTO public.students VALUES (33, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (34, 'Kaija', 'Uronen', 62, 3.7);
INSERT INTO public.students VALUES (35, 'Faye', 'Conn', 62, 2.1);
INSERT INTO public.students VALUES (36, 'Efren', 'Reilly', 58, 3.9);
INSERT INTO public.students VALUES (37, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (38, 'Maxine', 'Hagenes', 57, 2.9);
INSERT INTO public.students VALUES (39, 'Larry', 'Saunders', 59, 2.2);
INSERT INTO public.students VALUES (40, 'Karl', 'Kuhar', 58, NULL);
INSERT INTO public.students VALUES (41, 'Lieke', 'Hazenveld', 62, 3.5);
INSERT INTO public.students VALUES (42, 'Obie', 'Hilpert', 58, NULL);
INSERT INTO public.students VALUES (43, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (44, 'Nathan', 'Turner', 57, 3.3);
INSERT INTO public.students VALUES (45, 'Gerald', 'Osiki', 59, 2.2);
INSERT INTO public.students VALUES (46, 'Vanya', 'Hassanah', 62, 4.0);
INSERT INTO public.students VALUES (47, 'Roxelana', 'Florescu', 57, 3.2);
INSERT INTO public.students VALUES (48, 'Helene', 'Parker', 59, 3.4);
INSERT INTO public.students VALUES (49, 'Mariana', 'Russel', 58, 1.8);
INSERT INTO public.students VALUES (50, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (51, 'Mehdi', 'Vandenberghe', 57, 1.9);
INSERT INTO public.students VALUES (52, 'Dejon', 'Howell', 58, 4.0);
INSERT INTO public.students VALUES (53, 'Aliya', 'Gulgowski', 63, 2.6);
INSERT INTO public.students VALUES (54, 'Ana', 'Tupajic', 59, 3.1);
INSERT INTO public.students VALUES (55, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 57, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 63, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 55, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

