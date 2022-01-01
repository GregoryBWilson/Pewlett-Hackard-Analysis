--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5
-- Dumped by pg_dump version 13.5

-- Started on 2022-01-01 12:45:14

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
-- TOC entry 200 (class 1259 OID 16613)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying(4) NOT NULL,
    dept_name character varying(40) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16691)
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17099)
-- Name: dept_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_info (
    emp_no integer,
    first_name character varying,
    last_name character varying,
    dept_name character varying(40)
);


ALTER TABLE public.dept_info OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16656)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying(4) NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17077)
-- Name: emp_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emp_info (
    emp_no integer,
    first_name character varying,
    last_name character varying,
    gender character varying,
    salary integer,
    to_date date
);


ALTER TABLE public.emp_info OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16633)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    gender character varying NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17093)
-- Name: manager_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manager_info (
    dept_no character varying(4),
    dept_name character varying(40),
    emp_no integer,
    last_name character varying,
    first_name character varying,
    from_date date,
    to_date date
);


ALTER TABLE public.manager_info OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17152)
-- Name: mentorship_eligibility; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mentorship_eligibility (
    emp_no integer,
    first_name character varying,
    last_name character varying,
    birth_date date,
    from_date date,
    to_date date,
    title character varying
);


ALTER TABLE public.mentorship_eligibility OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17071)
-- Name: retire_count; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retire_count (
    count bigint,
    dept_no character varying(4)
);


ALTER TABLE public.retire_count OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17041)
-- Name: retirement_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retirement_info (
    emp_no integer,
    first_name character varying,
    last_name character varying
);


ALTER TABLE public.retirement_info OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17121)
-- Name: retirement_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retirement_titles (
    emp_no integer,
    first_name character varying,
    last_name character varying,
    title character varying,
    from_date date,
    to_date date
);


ALTER TABLE public.retirement_titles OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17149)
-- Name: retiring_count; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retiring_count (
    count bigint
);


ALTER TABLE public.retiring_count OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17135)
-- Name: retiring_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retiring_titles (
    count bigint,
    title character varying
);


ALTER TABLE public.retiring_titles OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16646)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16732)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    emp_no integer NOT NULL,
    title character varying NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17128)
-- Name: unique_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unique_titles (
    emp_no integer,
    first_name character varying,
    last_name character varying,
    title character varying
);


ALTER TABLE public.unique_titles OWNER TO postgres;

--
-- TOC entry 2919 (class 2606 OID 16619)
-- Name: departments departments_dept_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_dept_name_key UNIQUE (dept_name);


--
-- TOC entry 2921 (class 2606 OID 16617)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);


--
-- TOC entry 2929 (class 2606 OID 16695)
-- Name: dept_emp dept_emp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 2923 (class 2606 OID 16640)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 2927 (class 2606 OID 16660)
-- Name: dept_manager managers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT managers_pkey PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 2925 (class 2606 OID 16650)
-- Name: salaries salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 2934 (class 2606 OID 16701)
-- Name: dept_emp dept_emp_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 2933 (class 2606 OID 16696)
-- Name: dept_emp dept_emp_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 2932 (class 2606 OID 16666)
-- Name: dept_manager managers_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT managers_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 2931 (class 2606 OID 16661)
-- Name: dept_manager managers_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT managers_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 2930 (class 2606 OID 16651)
-- Name: salaries salaries_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 2935 (class 2606 OID 16738)
-- Name: titles titles_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


-- Completed on 2022-01-01 12:45:15

--
-- PostgreSQL database dump complete
--

