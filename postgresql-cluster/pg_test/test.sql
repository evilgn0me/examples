--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8
-- Dumped by pg_dump version 10.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: a; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a (
    id integer NOT NULL,
    data character varying(255)
);


ALTER TABLE public.a OWNER TO postgres;

--
-- Name: b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.b (
    id integer NOT NULL,
    data character varying(255)
);


ALTER TABLE public.b OWNER TO postgres;

--
-- Name: c; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.c (
    id integer NOT NULL,
    data character varying(255)
);


ALTER TABLE public.c OWNER TO postgres;

--
-- Name: b a_copy1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.b
    ADD CONSTRAINT a_copy1_pkey PRIMARY KEY (id);


--
-- Name: c a_copy2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c
    ADD CONSTRAINT a_copy2_pkey PRIMARY KEY (id);


--
-- Name: a a_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a
    ADD CONSTRAINT a_pkey PRIMARY KEY (id);

--
-- PostgreSQL database dump complete
--
