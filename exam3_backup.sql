--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    created_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    user_id bigint,
    description character varying(255),
    name character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_id_seq OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id character varying(255) NOT NULL,
    role_name character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    revoked boolean NOT NULL,
    created_at timestamp(6) without time zone,
    user_id bigint,
    id character varying(255) NOT NULL,
    token character varying(255)
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    enabled boolean,
    id bigint NOT NULL,
    email character varying(255),
    password character varying(255),
    username character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_id bigint NOT NULL,
    role_id character varying(255) NOT NULL
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (created_at, id, updated_at, user_id, description, name) FROM stdin;
2025-04-07 15:30:05.478651	1	2025-04-07 15:30:05.478673	1	des1	admin project
2025-04-07 15:31:27.98256	2	2025-04-07 15:31:27.982584	2	des1	user project
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, role_name) FROM stdin;
1	ROLE_USER
2	ROLE_ADMIN
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (revoked, created_at, user_id, id, token) FROM stdin;
f	2025-04-07 15:29:32.577192	1	3a9ca063-d9bf-4c6b-b347-c66739a2cf98	eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6W3siaWQiOiIyIiwicm9sZU5hbWUiOiJST0xFX0FETUlOIn1dLCJpZCI6MSwiZW1haWwiOiJhZG1pbkBlbWFpbC5jb20iLCJ1c2VybmFtZSI6MSwic3ViIjoiYWRtaW4iLCJpYXQiOjE3NDQwMTgxNzIsImV4cCI6MTc0NDYyMjk3Mn0.hAk8QDnxlO3Ssy_Hox_MXNGlFc0GUgNSPUkoysolo1w
f	2025-04-07 15:30:58.256314	2	99f73015-56cc-49ce-9a18-ad6b0b99c94f	eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6W3siaWQiOiIxIiwicm9sZU5hbWUiOiJST0xFX1VTRVIifV0sImlkIjoyLCJlbWFpbCI6InVzZXJAZW1haWwuY29tIiwidXNlcm5hbWUiOjIsInN1YiI6InVzZXIiLCJpYXQiOjE3NDQwMTgyNTgsImV4cCI6MTc0NDYyMzA1OH0.BclsiKjk0qm_SaIQt6SSzbN2qaEkhR64hbjysHreLJA
f	2025-04-07 15:31:41.893297	1	543a5a28-74b0-4776-8c46-ad1a7c1827ec	eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6W3siaWQiOiIyIiwicm9sZU5hbWUiOiJST0xFX0FETUlOIn1dLCJpZCI6MSwiZW1haWwiOiJhZG1pbkBlbWFpbC5jb20iLCJ1c2VybmFtZSI6MSwic3ViIjoiYWRtaW4iLCJpYXQiOjE3NDQwMTgzMDEsImV4cCI6MTc0NDYyMzEwMX0.iiHoK1iMOcxzurqs8jMGlrg_G7rPtFxsHVGAOVpdsjw
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (enabled, id, email, password, username) FROM stdin;
t	1	admin@email.com	$2a$10$8vHAfGwW4mHt8ofUMOMwPeLRDaIS1YFe2B3ohgslWpo5MjJ3Avy8m	admin
t	2	user@email.com	$2a$10$jVuZwt4d1I4cBDYPnuRCk.55vYJrN//Ggi9MMA3kktgrvmgbK1hcO	user
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_roles (user_id, role_id) FROM stdin;
1	2
2	1
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 2, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_user_id_key UNIQUE (user_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: tokens fk2dylsfo39lgjyqml2tbe0b0ss; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT fk2dylsfo39lgjyqml2tbe0b0ss FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_roles fk2o0jvgh89lemvvo17cbqvdxaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products fkdb050tk37qryv15hd932626th; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fkdb050tk37qryv15hd932626th FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_roles fkj6m8fwv7oqv74fcehir1a9ffy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

