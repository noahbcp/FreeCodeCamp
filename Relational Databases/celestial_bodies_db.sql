--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(255),
    name character varying(255) NOT NULL,
    galaxy_radius_in_light_years integer,
    distance_from_earth_in_mly numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    distance_from_planet_in_km integer,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    radius_in_km numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    age_in_millions_of_years numeric,
    planet_type character varying(255),
    has_life boolean,
    has_rings boolean,
    description text,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_type character varying(255),
    solar_mass numeric,
    name character varying(255) NOT NULL,
    age_in_millions_of_years numeric,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: table5; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.table5 (
    table5_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.table5 OWNER TO freecodecamp;

--
-- Name: table5_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.table5_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table5_id_seq OWNER TO freecodecamp;

--
-- Name: table5_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.table5_id_seq OWNED BY public.table5.table5_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: table5 table5_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table5 ALTER COLUMN table5_id SET DEFAULT nextval('public.table5_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'spiral', 'Milky Way', 52850, 0);
INSERT INTO public.galaxy VALUES (2, 'barred spiral', 'Andromeda', 110000, 2.536);
INSERT INTO public.galaxy VALUES (3, 'spiral', 'Black Eye Galaxy', 26481, 24);
INSERT INTO public.galaxy VALUES (4, 'barred spiral', 'Messier 83', 27750, 15.04);
INSERT INTO public.galaxy VALUES (5, 'elliptical', 'Centaurus A', 48500, 13.05);
INSERT INTO public.galaxy VALUES (6, 'ring', 'Hoag''s Object', 60500, 612.8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 23458, 'Deimos', 5, 6.2);
INSERT INTO public.moon VALUES (2, 6000, 'Phobos', 5, 11.3);
INSERT INTO public.moon VALUES (3, 422000, 'Io', 6, 1821);
INSERT INTO public.moon VALUES (4, 671000, 'Europa', 6, 1561);
INSERT INTO public.moon VALUES (5, 665869, 'Ganymede', 6, 2631);
INSERT INTO public.moon VALUES (6, 1883000, 'Callisto', 6, 2410.3);
INSERT INTO public.moon VALUES (7, 238000, 'Enceladus', 7, 252);
INSERT INTO public.moon VALUES (8, 769960, 'Titan', 7, 2574.7);
INSERT INTO public.moon VALUES (9, 86000, 'Puck', 8, 254.5);
INSERT INTO public.moon VALUES (10, 436300, 'Titania', 8, 2478.4);
INSERT INTO public.moon VALUES (11, 69900, 'Rosalind', 8, 113.1);
INSERT INTO public.moon VALUES (12, 583500, 'Oberon', 8, 2392);
INSERT INTO public.moon VALUES (13, 190900, 'Ariel', 8, 289.5);
INSERT INTO public.moon VALUES (14, 73548, 'Larissa', 9, 48.5);
INSERT INTO public.moon VALUES (15, 48227, 'Naiad', 9, 103.65);
INSERT INTO public.moon VALUES (16, 61953, 'Galatea', 9, 44);
INSERT INTO public.moon VALUES (17, 16611000, 'Halimede', 9, 15.5);
INSERT INTO public.moon VALUES (18, 354759, 'Triton', 9, 676.2);
INSERT INTO public.moon VALUES (19, 23302000, 'Kale', 6, 1);
INSERT INTO public.moon VALUES (20, 21272000, 'Iocaste', 6, 2.6);
INSERT INTO public.moon VALUES (21, 384400, 'Moon', 1, 1737.4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 4543, 'terrestrial', true, false, 'Mother Earth, Gaia', 'Earth', 1);
INSERT INTO public.planet VALUES (2, 4503, 'terrestrial', false, false, 'The smallest planet in the solar system and the closest to the sun.', 'Mercury', 1);
INSERT INTO public.planet VALUES (4, 4503, 'terrestrial', false, false, 'Named after the Roman goddess of love and beauty.', 'Venus', 1);
INSERT INTO public.planet VALUES (5, 4603, 'terrestrial', false, false, 'Named after the Roman goddess of war.', 'Mars', 1);
INSERT INTO public.planet VALUES (6, 4603, 'gas giant', false, true, 'Has a mass greater than 2.5x the rest of the planets in the solar system combined', 'Jupiter', 1);
INSERT INTO public.planet VALUES (7, 4503, 'gas giant', false, true, 'Has one eighth of the density of Earth', 'Saturn', 1);
INSERT INTO public.planet VALUES (8, 4503, 'ice giant', false, true, 'Named after the Greek god of the sky.', 'Uranus', 1);
INSERT INTO public.planet VALUES (9, 4503, 'ice giant', false, true, 'The twin of Uranus.', 'Neptune', 1);
INSERT INTO public.planet VALUES (10, NULL, 'terrestrial', NULL, NULL, 'The closest exoplanet to planet Earth.', 'Proxima Centauri b', 2);
INSERT INTO public.planet VALUES (11, NULL, 'gas giant', NULL, NULL, 'Has an equilibrium temperature of more than 1900 degrees celsius', 'WASP-76b', 3);
INSERT INTO public.planet VALUES (12, NULL, 'gas giant', NULL, NULL, 'Has an unusual "wrecking ball" orbit around its star.', 'HR 5183b', 3);
INSERT INTO public.planet VALUES (3, NULL, 'terrestrial', NULL, NULL, 'Very close to its sun and super heated. Has a lot of carbon that may take the form of diamond.', '55 Cancri e', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'yellow dwarf', 1, 'Sun', 4600, 1);
INSERT INTO public.star VALUES (2, 'red dwarf', 0.125, 'Proxima Centauri', 4850, 1);
INSERT INTO public.star VALUES (3, 'yellow-white dwarf', 1.46, 'WASP-76', 5300, 1);
INSERT INTO public.star VALUES (4, NULL, NULL, 'HR 5183', NULL, 1);
INSERT INTO public.star VALUES (5, 'binary star', 0.95, '55 Cancri', 5500, 1);
INSERT INTO public.star VALUES (6, 'red hypergiant', 14, 'Stephenson 2-18', 17, 1);


--
-- Data for Name: table5; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.table5 VALUES (1, 'Harry', 'A wizard');
INSERT INTO public.table5 VALUES (2, 'Hermione', 'A witch');
INSERT INTO public.table5 VALUES (3, 'Ron', 'A Ginger');
INSERT INTO public.table5 VALUES (4, 'Dobby', 'An Elf');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: table5_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.table5_id_seq', 4, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: table5 table5_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table5
    ADD CONSTRAINT table5_pkey PRIMARY KEY (table5_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: table5 unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table5
    ADD CONSTRAINT unique_id UNIQUE (table5_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
