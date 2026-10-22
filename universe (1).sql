--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number_of_stars integer NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    description text,
    diameter_km integer
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
    has_life boolean,
    is_spherical boolean,
    number_of_moons integer,
    diameter_km numeric(12,2)
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    description text
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 7, 'Le chasseur');
INSERT INTO public.constellation VALUES (2, 'Cassiopeia', 5, 'Forme de W');
INSERT INTO public.constellation VALUES (3, 'Crux', 4, 'Croix du Sud');
INSERT INTO public.constellation VALUES (4, 'Lyra', 5, 'La Lyre');
INSERT INTO public.constellation VALUES (5, 'Scorpius', 15, 'Le Scorpion');
INSERT INTO public.constellation VALUES (6, 'Ursa Major', 7, 'La Grande Ourse');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Notre galaxie spirale barree', 13600, 0.00, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Galaxie spirale la plus proche', 10000, 2.54, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Galaxie spirale du Groupe local', 10000, 2.73, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Galaxie naine satellite', 13000, 0.16, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Galaxie naine irreguliere', 13000, 0.20, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Galaxie spirale en interaction', 400, 23.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 'Satellite de la Terre', 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 'Lune de Mars', 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 'Lune de Mars', 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 'Lune volcanique', 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 'Lune glacee', 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 'Plus grande lune', 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 'Lune cratere', 4821);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 'Petite lune de Jupiter', 167);
INSERT INTO public.moon VALUES (9, 'Mimas', 6, true, 'Lune de Saturne', 396);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, true, 'Lune a geysers', 504);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, true, 'Lune glacee', 1062);
INSERT INTO public.moon VALUES (12, 'Dione', 6, true, 'Lune de Saturne', 1123);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, true, 'Lune de Saturne', 1527);
INSERT INTO public.moon VALUES (14, 'Titan', 6, true, 'Lune a atmosphere epaisse', 5150);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, true, 'Lune a deux faces', 1469);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, true, 'Lune de Uranus', 472);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, true, 'Lune de Uranus', 1158);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, true, 'Lune sombre', 1169);
INSERT INTO public.moon VALUES (19, 'Titania', 7, true, 'Plus grande lune de Uranus', 1577);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, true, 'Lune de Uranus', 1523);
INSERT INTO public.moon VALUES (21, 'Triton', 8, true, 'Lune de Neptune', 2707);
INSERT INTO public.moon VALUES (22, 'Charon', 9, true, 'Lune de Pluton', 1212);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, true, 0, 4879.00);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, true, 0, 12104.00);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 1, 12742.00);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, true, 2, 6779.00);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, true, 97, 139820.00);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, true, 274, 116460.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 29, 50724.00);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 16, 49244.00);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, true, 5, 2377.00);
INSERT INTO public.planet VALUES (10, 'Ceres', 1, false, true, 0, 940.00);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 2, false, true, 0, NULL);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri d', 2, false, true, 0, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true, 'Etoile du systeme solaire');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, true, 'Naine rouge la plus proche');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 242, true, 'Etoile la plus brillante du ciel');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, true, 'Supergeante rouge');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 5300, true, 'Etoile principale de Alpha Centauri');
INSERT INTO public.star VALUES (6, 'Vega', 1, 455, true, 'Etoile de la Lyre');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

