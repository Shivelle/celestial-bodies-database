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
    name character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean,
    galaxy_type character varying(100)
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
    name character varying(255) NOT NULL,
    planet_id integer,
    description text,
    orbital_period numeric
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
    name character varying(255) NOT NULL,
    star_id integer,
    planet_type character varying(100),
    has_life boolean
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_type_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    typical_distance_from_star integer
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;
ALTER TABLE public.planet_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean DEFAULT true,
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
-- Name: planet_types planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.537, false, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, false, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 12, false, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23, false, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Lenticular Galaxy', 30, false, 'Lenticular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Earth''s moon, dusty and rocky.', 27.3);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'One of Mars'' moons, irregularly shaped.', 0.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Smaller and farther of Mars'' two moons.', 1.3);
INSERT INTO public.moon VALUES (4, 'Titan', 5, 'Largest moon of Kepler-22b, has thick atmosphere.', 15.9);
INSERT INTO public.moon VALUES (5, 'Europa', 6, 'Moon of Jupiter, hypothesized to have underground ocean.', 3.5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 'Largest moon in the Solar System, orbiting Jupiter.', 7.2);
INSERT INTO public.moon VALUES (10, 'Callisto', 6, 'The second largest moon of Jupiter, heavily cratered.', 16.7);
INSERT INTO public.moon VALUES (11, 'Io', 6, 'Active volcanic moon of Jupiter, most geologically active object in the Solar System.', 1.8);
INSERT INTO public.moon VALUES (12, 'Amalthea', 6, 'One of Jupiter''s smaller inner moons, red-tinted.', 0.5);
INSERT INTO public.moon VALUES (13, 'Himalia', 6, 'Largest of Jupiter''s irregular outer moons.', 250.6);
INSERT INTO public.moon VALUES (14, 'Elara', 6, 'A member of the Himalia group, orbiting Jupiter.', 259.7);
INSERT INTO public.moon VALUES (15, 'Pasiphae', 6, 'Irregular moon of Jupiter, in retrograde orbit.', 743.6);
INSERT INTO public.moon VALUES (16, 'Sinope', 6, 'Irregular, retrograde moon of Jupiter, discovered in 1914.', 758.9);
INSERT INTO public.moon VALUES (17, 'Lysithea', 6, 'One of Jupiter''s moons, belongs to the Himalia group.', 259.2);
INSERT INTO public.moon VALUES (18, 'Carme', 6, 'Moon of Jupiter, discovered in 1938, part of the Ananke group.', 734.2);
INSERT INTO public.moon VALUES (19, 'Ananke', 6, 'Parent body of the Ananke group, a retrograde irregular moon.', 630.8);
INSERT INTO public.moon VALUES (20, 'Leda', 6, 'One of Jupiter''s smallest moons, discovered in 1974.', 240.9);
INSERT INTO public.moon VALUES (21, 'Thebe', 6, 'Orbits Jupiter at the outer edge of its main ring system.', 0.7);
INSERT INTO public.moon VALUES (22, 'Adrastea', 6, 'One of the smallest moons of Jupiter, orbits very close to it.', 0.3);
INSERT INTO public.moon VALUES (23, 'Metis', 6, 'Innermost moon of Jupiter, orbits within its main ring.', 0.3);
INSERT INTO public.moon VALUES (24, 'Hyperion', 7, 'A moon of Saturn known for its chaotic rotation.', 21.3);
INSERT INTO public.moon VALUES (25, 'Iapetus', 7, 'Known for its unusual two-tone coloration.', 79.3);
INSERT INTO public.moon VALUES (26, 'Mimas', 7, 'Has a large crater making it resemble the Death Star.', 0.9);
INSERT INTO public.moon VALUES (27, 'Enceladus', 7, 'Known for its icy surface and geysers of water vapor.', 1.4);
INSERT INTO public.moon VALUES (28, 'Tethys', 7, 'Has a massive crater called Odysseus and a large valley named Ithaca Chasma.', 1.9);
INSERT INTO public.moon VALUES (29, 'Dione', 7, 'Characterized by its trailing hemisphere having bright ice cliffs.', 2.7);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', false);
INSERT INTO public.planet VALUES (4, 'Kepler-452b', 4, 'Exoplanet', false);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 5, 'Exoplanet', false);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1, 'Gas Giant', false);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 'Ice Giant', false);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Ice Giant', false);
INSERT INTO public.planet VALUES (9, 'Saturn', 1, 'Gas Giant', false);
INSERT INTO public.planet VALUES (10, 'Mercury', 1, 'Terrestrial', false);
INSERT INTO public.planet VALUES (11, 'Pluto', 1, 'Dwarf Planet', false);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 4, 'Exoplanet', false);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types (planet_type_id, name, description, typical_distance_from_star) VALUES (1, 'Terrestrial', 'Solid, rocky surfaces.', 1);
INSERT INTO public.planet_types (planet_type_id, name, description, typical_distance_from_star) VALUES (2, 'Gas Giant', 'Primarily composed of hydrogen and helium.', 5);
INSERT INTO public.planet_types (planet_type_id, name, description, typical_distance_from_star) VALUES (3, 'Ice Giant', 'Composed mainly of substances like water, ammonia, and methane.', 10);
INSERT INTO public.planet_types (planet_type_id, name, description, typical_distance_from_star) VALUES (4, 'Dwarf Planet', 'Orbits the sun and is spherical but has not cleared its orbital path.', 50);
INSERT INTO public.planet_types (planet_type_id, name, description, typical_distance_from_star) VALUES (5, 'Exoplanet', 'Planets outside our solar system.', 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4500, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 5000, true, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 242, true, 2);
INSERT INTO public.star VALUES (5, 'Vega', 455, true, 3);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 8, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_types planet_types_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_description_key UNIQUE (description);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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