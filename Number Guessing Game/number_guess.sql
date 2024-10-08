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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: record; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.record (
    username character varying(22) NOT NULL,
    guess_times integer NOT NULL
);


ALTER TABLE public.record OWNER TO freecodecamp;

--
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.record VALUES ('Alice', 15);
INSERT INTO public.record VALUES ('Alice', 13);
INSERT INTO public.record VALUES ('Yen', 9);
INSERT INTO public.record VALUES ('user_1728361966439', 134);
INSERT INTO public.record VALUES ('user_1728361966439', 478);
INSERT INTO public.record VALUES ('user_1728361966438', 769);
INSERT INTO public.record VALUES ('user_1728361966438', 767);
INSERT INTO public.record VALUES ('user_1728361966439', 942);
INSERT INTO public.record VALUES ('user_1728361966439', 393);
INSERT INTO public.record VALUES ('user_1728361966439', 256);
INSERT INTO public.record VALUES ('user_1728362013066', 780);
INSERT INTO public.record VALUES ('user_1728362013066', 977);
INSERT INTO public.record VALUES ('user_1728362013065', 84);
INSERT INTO public.record VALUES ('user_1728362013065', 142);
INSERT INTO public.record VALUES ('user_1728362013066', 79);
INSERT INTO public.record VALUES ('user_1728362013066', 974);
INSERT INTO public.record VALUES ('user_1728362013066', 501);
INSERT INTO public.record VALUES ('user_1728362023197', 276);
INSERT INTO public.record VALUES ('user_1728362023197', 205);
INSERT INTO public.record VALUES ('user_1728362023196', 252);
INSERT INTO public.record VALUES ('user_1728362023196', 606);
INSERT INTO public.record VALUES ('user_1728362023197', 287);
INSERT INTO public.record VALUES ('user_1728362023197', 521);
INSERT INTO public.record VALUES ('user_1728362023197', 567);
INSERT INTO public.record VALUES ('user_1728362134199', 412);
INSERT INTO public.record VALUES ('user_1728362134199', 379);
INSERT INTO public.record VALUES ('user_1728362134198', 224);
INSERT INTO public.record VALUES ('user_1728362134198', 882);
INSERT INTO public.record VALUES ('user_1728362134199', 138);
INSERT INTO public.record VALUES ('user_1728362134199', 412);
INSERT INTO public.record VALUES ('user_1728362134199', 272);
INSERT INTO public.record VALUES ('user_1728362184778', 582);
INSERT INTO public.record VALUES ('user_1728362184778', 881);
INSERT INTO public.record VALUES ('user_1728362184777', 701);
INSERT INTO public.record VALUES ('user_1728362184777', 437);
INSERT INTO public.record VALUES ('user_1728362184778', 87);
INSERT INTO public.record VALUES ('user_1728362184778', 405);
INSERT INTO public.record VALUES ('user_1728362184778', 541);
INSERT INTO public.record VALUES ('user_1728362209327', 466);
INSERT INTO public.record VALUES ('user_1728362209327', 486);
INSERT INTO public.record VALUES ('user_1728362209326', 770);
INSERT INTO public.record VALUES ('user_1728362209326', 936);
INSERT INTO public.record VALUES ('user_1728362209327', 520);
INSERT INTO public.record VALUES ('user_1728362209327', 333);
INSERT INTO public.record VALUES ('user_1728362209327', 383);
INSERT INTO public.record VALUES ('user_1728362226931', 575);
INSERT INTO public.record VALUES ('user_1728362226931', 257);
INSERT INTO public.record VALUES ('user_1728362226930', 193);
INSERT INTO public.record VALUES ('user_1728362226930', 330);
INSERT INTO public.record VALUES ('user_1728362226931', 673);
INSERT INTO public.record VALUES ('user_1728362226931', 197);
INSERT INTO public.record VALUES ('user_1728362226931', 971);


--
-- PostgreSQL database dump complete
--

