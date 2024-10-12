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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_visible_to_naked_eye boolean,
    has_tail boolean,
    age_in_millions_of_years integer,
    speed numeric(15,5),
    mass_in_kg integer,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_type character varying(50),
    distance_from_earth numeric(15,5),
    number_of_stars integer,
    description text
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
    name character varying(30) NOT NULL,
    is_visible_to_naked_eye boolean,
    is_habitable boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(15,5),
    mass_in_kg integer,
    description text,
    planet_id integer
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
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_type character varying(50),
    distance_from_earth numeric(15,5),
    mass_in_kg integer,
    description text,
    star_id integer
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
    name character varying(30) NOT NULL,
    is_visible_to_naked_eye boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(15,5),
    mass_in_kg integer,
    description text,
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'vfvddfb', true, true, 1515, 15151.00000, 515151, 'rvervrvervrverv');
INSERT INTO public.comet VALUES (2, 'brtbtyn', true, true, 1515, 15151.00000, 515151, 'rvervrvervrverv');
INSERT INTO public.comet VALUES (3, 'brytjyvn', true, true, 1515, 15151.00000, 515151, 'rvervrvervrverv');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, false, 135, 'Spiral', 0.00000, 100000000, 'A barred spiral galaxy that contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, false, 10000, 'Spiral', 2530.00000, 1000000000, 'The nearest spiral galaxy to the Milky Way and on a collision course with it.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, false, 13, 'Spiral', 3000.00000, 40000000, 'A small spiral galaxy, part of the Local Group, near the Andromeda Galaxy.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', false, false, 13000, 'Spiral', 29000.00000, 80000000, 'An unbarred spiral galaxy with a bright, extended halo, giving it a sombrero-like appearance.');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', false, true, 13500, 'Elliptical', 53000.00000, 1200000000, 'A supergiant elliptical galaxy known for its large black hole at the center.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', false, false, 500, 'Spiral', 23000.00000, 100000000, 'A grand-design spiral galaxy with distinctive arms, located in the constellation Canes Venatici.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, false, 4500, 0.00000, 73522, 'The only natural satellite of Earth.', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, false, 4500, 0.00000, 10616, 'A small, irregularly shaped moon of Mars.', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, false, 4500, 0.00000, 2415, 'The smaller and outermost moon of Mars.', 2);
INSERT INTO public.moon VALUES (4, 'Proxima c1', false, false, 4500, 4.24000, 5021, 'A small moon orbiting Proxima b.', 3);
INSERT INTO public.moon VALUES (5, 'Proxima c2', false, false, 4500, 4.24000, 4821, 'Another moon orbiting Proxima b.', 3);
INSERT INTO public.moon VALUES (6, 'Vulcanis', false, false, 2000, 16.70000, 6322, 'A fictional moon orbiting the planet Vulcan.', 5);
INSERT INTO public.moon VALUES (7, 'Alpha Centauri Bb-1', false, false, 4600, 4.37000, 3922, 'A moon orbiting the exoplanet Alpha Centauri Bb.', 6);
INSERT INTO public.moon VALUES (8, 'Betelgeuse V-a', false, false, 2000, 642.50000, 5622, 'A massive moon orbiting Betelgeuse V.', 7);
INSERT INTO public.moon VALUES (9, 'Kepler-22b I', false, false, 5000, 600.00000, 1523, 'A moon of the exoplanet Kepler-22b.', 4);
INSERT INTO public.moon VALUES (10, 'Kepler-22b II', false, false, 5000, 600.00000, 1323, 'Another moon of the exoplanet Kepler-22b.', 4);
INSERT INTO public.moon VALUES (11, 'Altair I', false, false, 1600, 16.70000, 6422, 'A moon orbiting the fictional planet Vulcan.', 5);
INSERT INTO public.moon VALUES (12, 'Alpha Centauri Bb-2', false, false, 4600, 4.37000, 4222, 'Another moon orbiting Alpha Centauri Bb.', 6);
INSERT INTO public.moon VALUES (13, 'Europa', false, false, 4500, 0.00000, 4822, 'An icy moon of Jupiter with a subsurface ocean.', 8);
INSERT INTO public.moon VALUES (14, 'Titan', true, false, 4500, 0.00000, 134523, 'The largest moon of Saturn, known for its thick atmosphere.', 8);
INSERT INTO public.moon VALUES (15, 'Io', true, false, 4500, 0.00000, 8922, 'The most volcanically active moon in the solar system, orbiting Jupiter.', 8);
INSERT INTO public.moon VALUES (16, 'Callisto', false, false, 4500, 0.00000, 107523, 'The second-largest moon of Jupiter and the most heavily cratered.', 8);
INSERT INTO public.moon VALUES (17, 'Ganymede', false, false, 4500, 0.00000, 148223, 'The largest moon in the solar system, orbiting Jupiter.', 8);
INSERT INTO public.moon VALUES (18, 'Sirius c1', false, false, 2000, 8.60000, 5222, 'A moon orbiting Sirius c.', 9);
INSERT INTO public.moon VALUES (19, 'Vega IX-a', false, false, 1500, 25.00000, 6122, 'A moon orbiting the ice giant Vega IX.', 10);
INSERT INTO public.moon VALUES (20, 'Rigel b1', false, false, 3000, 860.00000, 4822, 'A moon orbiting the gas giant Rigel b.', 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 4500, 'Terrestrial', 0.00000, 597224, 'The only known planet to harbor life, third planet from the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 4500, 'Terrestrial', 0.00000, 641723, 'Known as the Red Planet, Mars is the fourth planet from the Sun.', 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', false, true, 4500, 'Terrestrial', 4.24000, 12725, 'A potentially habitable exoplanet orbiting Proxima Centauri.', 4);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', false, true, 5000, 'Super-Earth', 600.00000, 26825, 'A super-Earth exoplanet in the habitable zone of the star Kepler-22.', 3);
INSERT INTO public.planet VALUES (5, 'Vulcan', false, true, 2000, 'Terrestrial', 16.70000, 74224, 'A hypothetical planet orbiting Altair, sometimes referenced in science fiction.', 5);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', false, true, 4600, 'Terrestrial', 4.37000, 5125, 'An exoplanet orbiting Alpha Centauri B.', 3);
INSERT INTO public.planet VALUES (7, 'Betelgeuse V', false, true, 1000, 'Gas Giant', 642.50000, 1927, 'A large gas giant planet orbiting the massive star Betelgeuse.', 6);
INSERT INTO public.planet VALUES (8, 'HD 189733 b', false, true, 4000, 'Gas Giant', 63.00000, 11427, 'A hot Jupiter exoplanet known for its deep blue color.', 5);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', false, true, 7000, 'Super-Earth', 20.30000, 2125, 'A potentially habitable planet orbiting the red dwarf Gliese 581.', 4);
INSERT INTO public.planet VALUES (10, 'Rigel b', false, true, 3000, 'Gas Giant', 860.00000, 31427, 'A gas giant planet orbiting the blue supergiant star Rigel.', 2);
INSERT INTO public.planet VALUES (11, 'Vega IX', false, true, 1500, 'Ice Giant', 25.00000, 10226, 'An ice giant planet orbiting the star Vega.', 5);
INSERT INTO public.planet VALUES (12, 'Sirius c', false, true, 2000, 'Terrestrial', 8.60000, 4824, 'A small rocky planet orbiting the bright star Sirius.', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Rigel', true, true, 8000, 863.00000, 338631, 'Rigel is a blue supergiant and the brightest star in the constellation Orion.', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', true, true, 4600, 4.37000, 218830, 'Alpha Centauri A is the primary star in the closest star system to Earth.', 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', true, true, 4600, 4.37000, 18043, 'Alpha Centauri B is part of the Alpha Centauri system, orbiting close to Alpha Centauri A.', 2);
INSERT INTO public.star VALUES (4, 'Antares', true, true, 12000, 554.00000, 10833, 'Antares is a red supergiant star in the constellation Scorpius.', 1);
INSERT INTO public.star VALUES (5, 'Altair', true, true, 1600, 16.70000, 3116, 'Altair is the brightest star in the constellation Aquila.', 3);
INSERT INTO public.star VALUES (6, 'Mizar', true, true, 370, 86.00000, 200563, 'Mizar is a binary star system in the constellation Ursa Major, part of the Big Dipper.', 4);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

