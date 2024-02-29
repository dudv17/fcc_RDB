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
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth_mly numeric,
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth_mly numeric,
    diameter_in_km integer
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth_mly numeric,
    planet_type_id integer,
    has_life boolean,
    has_atmosphere boolean,
    diameter_in_km integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth_mly numeric
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0.027, 1);
INSERT INTO public.galaxy VALUES (2, 'M87', 12000, 53.5, 2);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud (LMC)', 1500, 0.16, 3);
INSERT INTO public.galaxy VALUES (4, 'Sculptor Dwarf Galaxy', 2000, 0.28, 4);
INSERT INTO public.galaxy VALUES (5, 'NGC 5866 (Spindle Galaxy)', 10000, 44, 5);
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 500, 61, 6);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A (NGC 5128)', 12, 11, 7);
INSERT INTO public.galaxy VALUES (8, '3C 273', 13000, 2.4, 8);
INSERT INTO public.galaxy VALUES (9, 'Andromeda Galaxy (M31)', 11500, 2.5, 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral Galaxies', 'Spiral galaxies have a well-defined spiral arm structure that extends from a central nucleus. These arms often contain young stars, and the central bulge consists of older stars. The Milky Way is an example of a spiral galaxy.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical Galaxies', 'Elliptical galaxies have a smooth and ellipsoidal shape, lacking the spiral arms seen in spiral galaxies. They are often composed of older stars and contain little interstellar matter. Elliptical galaxies come in a range of sizes from small to very large.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular Galaxies', 'Irregular galaxies lack a defined shape and structure. They often appear chaotic and may contain young stars, dust, and gas. Irregular galaxies are less common than spiral and elliptical galaxies.');
INSERT INTO public.galaxy_type VALUES (4, 'Dwarf Galaxies', 'Dwarf galaxies are smaller and less massive compared to spiral, elliptical, or irregular galaxies. They are often found in proximity to larger galaxies and are crucial for understanding the evolution of galaxies in groups and clusters.');
INSERT INTO public.galaxy_type VALUES (5, 'Lenticular Galaxies', 'Lenticular galaxies have a disk-like structure without prominent spiral arms. They share some characteristics with both spiral and elliptical galaxies. Lenticular galaxies are often considered transitional forms between spiral and elliptical galaxies.');
INSERT INTO public.galaxy_type VALUES (6, 'Barred Spiral Galaxies', 'Barred spiral galaxies have a central bar-shaped structure extending from the nucleus. Spiral arms may originate from the ends of this bar. The Milky Way is sometimes classified as a barred spiral galaxy.');
INSERT INTO public.galaxy_type VALUES (7, 'Active Galactic Nuclei (AGN)', 'Galaxies with an active galactic nucleus exhibit unusually high luminosity at their centers. AGN can include quasars and Seyfert galaxies. The high luminosity is attributed to the presence of a supermassive black hole at the galactic center.');
INSERT INTO public.galaxy_type VALUES (8, 'Quasars', 'Quasars are extremely luminous and energetic objects found at the centers of some galaxies. They are powered by accretion of mass onto a supermassive black hole. Quasars were more common in the early universe.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 4.6, 0.384, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 4.6, 0.009, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 4.6, 0.023, 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, 4.6, 0.421, 3642);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4.6, 0.671, 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 4.6, 1.07, 5262);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4.6, 1.88, 4800);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 4.6, 1.22, 5150);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 4.6, 1.27, 504);
INSERT INTO public.moon VALUES (10, 'Triton', 8, 4.6, 30.2, 2706);
INSERT INTO public.moon VALUES (11, 'Phoebe', 6, 4.6, 8.29, 220);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 4.6, 1.27, 396);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 4.6, 1.52, 1528);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 4.6, 1.69, 1122);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 4.6, 3.56, 1436);
INSERT INTO public.moon VALUES (16, 'Miranda', 8, 4.6, 4.3, 471);
INSERT INTO public.moon VALUES (17, 'Ariel', 8, 4.6, 7.4, 1158);
INSERT INTO public.moon VALUES (18, 'Umbriel', 8, 4.6, 9.46, 1169);
INSERT INTO public.moon VALUES (19, 'Oberon', 8, 4.6, 11.83, 1523);
INSERT INTO public.moon VALUES (20, 'Titania', 8, 4.6, 11.43, 1578);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4.6, 0.39, 1, false, false, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4.6, 0.72, 2, false, true, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4.6, 1, 2, true, true, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 4.6, 1.5, 1, false, true, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4.6, 5.2, 3, false, true, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 4.6, 9.58, 3, false, true, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 4.6, 19.22, 3, false, true, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 4.6, 30.05, 3, false, true, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 4.6, 4.67, 1, false, false, NULL);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri A I', 2, 6, 4.37, 4, false, true, NULL);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri A II', 2, 6, 4.37, 4, false, true, NULL);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri A III', 2, 6, 4.37, 4, false, true, NULL);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri I', 5, 4.85, 4.24, 4, false, true, NULL);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri II', 5, 4.85, 4.24, 4, false, true, NULL);
INSERT INTO public.planet VALUES (15, 'Proxima Centauri III', 5, 4.85, 4.24, 4, false, true, NULL);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial planets', 'These planets have solid surfaces and are primarily made up of silicate compounds.');
INSERT INTO public.planet_type VALUES (2, 'Silicate planets', 'These planets are primarily made up of silicate compounds.');
INSERT INTO public.planet_type VALUES (3, 'Puffy planets', 'These planets are less dense than water and have a thick atmosphere.');
INSERT INTO public.planet_type VALUES (4, 'Protoplanets', 'These are early-stage planets that are still forming.');
INSERT INTO public.planet_type VALUES (5, 'Ocean planets', 'These planets are primarily made up of water.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.6, 0);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 6, 4.37);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 230, 8.6);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 8, 640);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 2, 4.85, 4.24);
INSERT INTO public.star VALUES (6, 'Antares', 4, 12, 554);
INSERT INTO public.star VALUES (7, 'Vega', 1, 455, 25);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_unique UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_unique UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy galaxy_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_id_fk FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon planet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_id_fk FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

