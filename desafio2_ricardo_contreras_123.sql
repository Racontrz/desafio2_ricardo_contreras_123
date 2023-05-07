--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

-- Started on 2023-05-07 18:29:40

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

DROP DATABASE desafio2_ricardo_contreras_123;
--
-- TOC entry 3308 (class 1262 OID 24630)
-- Name: desafio2_ricardo_contreras_123; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE desafio2_ricardo_contreras_123 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Chile.1252';


ALTER DATABASE desafio2_ricardo_contreras_123 OWNER TO postgres;

\connect desafio2_ricardo_contreras_123

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
-- TOC entry 209 (class 1259 OID 24631)
-- Name: inscritos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscritos (
    cantidad integer,
    fecha date,
    fuente character varying
);


ALTER TABLE public.inscritos OWNER TO postgres;

--
-- TOC entry 3302 (class 0 OID 24631)
-- Dependencies: 209
-- Data for Name: inscritos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (44, '2021-01-01', 'Blog');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (56, '2021-01-01', 'Página');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (39, '2021-02-01', 'Blog');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (81, '2021-02-01', 'Página');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (12, '2021-03-01', 'Blog');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (91, '2021-03-01', 'Página');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (48, '2021-04-01', 'Blog');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (45, '2021-04-01', 'Página');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (55, '2021-05-01', 'Blog');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (33, '2021-05-01', 'Página');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (18, '2021-06-01', 'Blog');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (12, '2021-06-01', 'Página');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (34, '2021-07-01', 'Blog');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (24, '2021-07-01', 'Página');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (83, '2021-08-01', 'Blog');
INSERT INTO public.inscritos (cantidad, fecha, fuente) VALUES (99, '2021-08-01', 'Página');


-- Completed on 2023-05-07 18:29:40

--
-- PostgreSQL database dump complete
--

select * from inscritos;

-- 1 -- ¿Cuántos registros hay?

select count (*) from inscritos;

-- 2 -- ¿Cuántos inscritos hay en total?
 
select sum(cantidad) as total_inscritos from inscritos; 

-- 3 --  ¿Cuál o cuáles son los registros de mayor antigüedad?

select * from inscritos where fecha = (select min(fecha) from inscritos); 

-- 4 --  ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)

select fecha, sum(cantidad) from inscritos group by fecha;

-- 5 -- ¿Cuántos inscritos hay por fuente?

select fuente, sum(cantidad) from inscritos group by fuente;

-- 6 -- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

select fecha, sum(cantidad) as cantidad_inscritos from inscritos group by fecha order by cantidad_inscritos desc limit 1;

-- 7 -- ¿Qué días se inscribieron l a mayor cantidad de personas utilizando el blog y cuántas personas fueron?

select fecha, fuente, sum(cantidad) as cantidad_inscritos from inscritos where fuente = 'Blog' group by fecha, fuente order by cantidad_inscritos desc ;

-- 8 -- ¿Cuántas personas en promedio se inscriben en un día?

select fecha, round(avg(cantidad),0) from inscritos group by fecha order by fecha asc ;

-- 9 -- ¿Qué días se inscribieron más de 50 personas?

select fecha, sum(cantidad) from inscritos group by fecha having sum(cantidad) > (50) order by fecha asc ;

-- 10 -- ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?

select fecha, round(avg(cantidad), 0) from inscritos where fecha >= '2021-03-01' group by fecha order by fecha asc;
