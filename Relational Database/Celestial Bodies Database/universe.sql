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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    main_stars integer,
    stars_with_planets integer,
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
    name character varying(25) NOT NULL,
    distance_from_earth_in_mly numeric(11,5),
    redshift numeric(12,6),
    galaxy_morphology_id integer,
    constellation_id integer
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
-- Name: galaxy_morphology; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_morphology (
    galaxy_morphology_id integer NOT NULL,
    type character varying(4) NOT NULL,
    bar character varying(2),
    rings character varying(4),
    tightness character varying(2),
    ellipticity integer,
    is_peculiar boolean DEFAULT false,
    name character varying(20)
);


ALTER TABLE public.galaxy_morphology OWNER TO freecodecamp;

--
-- Name: galaxy_morphology_galaxy_morphology_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_morphology_galaxy_morphology_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_morphology_galaxy_morphology_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_morphology_galaxy_morphology_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_morphology_galaxy_morphology_id_seq OWNED BY public.galaxy_morphology.galaxy_morphology_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass_in_e22_kg numeric(7,5),
    radius_in_km numeric(8,4),
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
    name character varying(20) NOT NULL,
    has_life boolean DEFAULT false,
    mass numeric(8,3),
    radius numeric(8,3),
    units character varying(10),
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
    name character varying(20) NOT NULL,
    known_planets integer,
    spectral_type character varying(10),
    distance_ly numeric(6,2),
    mass_in_solar_masses numeric(6,3),
    radius_in_solar_radii numeric(6,3),
    galaxy_id integer,
    constellation_id integer
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
-- Name: galaxy_morphology galaxy_morphology_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_morphology ALTER COLUMN galaxy_morphology_id SET DEFAULT nextval('public.galaxy_morphology_galaxy_morphology_id_seq'::regclass);


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

INSERT INTO public.constellation VALUES (1, 'Andromeda', 16, 12, 'Andromeda, the Chained Woman');
INSERT INTO public.constellation VALUES (2, 'Coma Berenices', 3, 5, 'Queen Berenice II of Egypt');
INSERT INTO public.constellation VALUES (3, 'Circinus', 3, 2, 'French for compass');
INSERT INTO public.constellation VALUES (4, 'Ursa Major', 20, 21, 'the Great Bear');
INSERT INTO public.constellation VALUES (5, 'Sculptor', 4, 6, 'A small and faint constellation in the southern sky. It represents a sculptor');
INSERT INTO public.constellation VALUES (6, 'Virgo', 15, 29, 'One of the zodiac constellations. Latin for maiden');
INSERT INTO public.constellation VALUES (7, 'Centaurus', 11, 15, 'A bright constellation in the southern sky. One of the largest constellations');
INSERT INTO public.constellation VALUES (8, 'Pavo', 7, 6, 'Located in the southern sky and symbolizes a peacock');
INSERT INTO public.constellation VALUES (9, 'Sextans', 3, 5, 'A minor equatorial constellation');
INSERT INTO public.constellation VALUES (10, 'Canes Venatici', 2, 4, 'A small northern constellation, the hunting dogs');
INSERT INTO public.constellation VALUES (11, 'Cygnus', 9, 97, 'A constellation on the plane of the Milky Way symbolizing a swan');
INSERT INTO public.constellation VALUES (12, 'Serpens', 11, 15, 'Located in the northern celestial hemisphere symbolizing a serpent');
INSERT INTO public.constellation VALUES (13, 'Dorado', 3, 5, 'A constellation of the southern sky that symbolizes the dolphinfish');
INSERT INTO public.constellation VALUES (14, 'Volans', 6, 2, 'Located in the sothern sky representing a flying fish');
INSERT INTO public.constellation VALUES (15, 'Pegasus', 17, 12, 'Found in the northern sky and is named after the winged horse of Greek mythology');
INSERT INTO public.constellation VALUES (16, 'Tucana', 3, 5, 'Named after the toucan a South American bird');
INSERT INTO public.constellation VALUES (17, 'Triangulum', 3, 3, 'the triangle, derived from its three brightest stars');
INSERT INTO public.constellation VALUES (18, 'Draco', 14, 19, 'A constellation of the northern sky symbolizing a dragon');
INSERT INTO public.constellation VALUES (19, 'Hydra', 17, 18, 'Largest of the modern constellations, sybolizes the sea serpent');
INSERT INTO public.constellation VALUES (20, 'Cetus', 14, 23, 'A sea monster in Greek mythology');
INSERT INTO public.constellation VALUES (21, 'Sagittarius', 12, 32, 'Commonly represented as a centaur drawing a bow');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (25, 'Wolf-Lundmark-Melotte', 3.04000, -122.000000, 17, 20);
INSERT INTO public.galaxy VALUES (26, 'Peekaboo Galaxy', 22.20000, NULL, NULL, 19);
INSERT INTO public.galaxy VALUES (30, 'Southern Pinwheel Galaxy', 14.70000, 0.001721, 21, 19);
INSERT INTO public.galaxy VALUES (32, 'Tadpole Galaxy', 400.00000, 9401.000000, 24, 18);
INSERT INTO public.galaxy VALUES (33, 'Triangulum Galaxy', 3.20000, -0.000607, 25, 17);
INSERT INTO public.galaxy VALUES (35, 'Andromeda Galaxy', 2.50000, -0.001004, 1, 1);
INSERT INTO public.galaxy VALUES (1, 'Backward Galaxy', 200.00000, 4367.000000, 2, 7);
INSERT INTO public.galaxy VALUES (9, 'Comet Galaxy', 3200.00000, 0.226500, 8, 5);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 500.00000, 9050.000000, 5, 5);
INSERT INTO public.galaxy VALUES (2, 'Black Eye Galaxy', 17.30000, 0.001361, 3, 2);
INSERT INTO public.galaxy VALUES (8, 'Coma Pinwheel Galaxy', 45.20000, 0.008029, 7, 2);
INSERT INTO public.galaxy VALUES (7, 'Circinus Galaxy', 13.00000, 426.000000, 1, 3);
INSERT INTO public.galaxy VALUES (3, 'Bode''s Galaxy', 12.00000, -0.000113, 4, 4);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 11.90000, 203.000000, 6, 4);
INSERT INTO public.galaxy VALUES (10, 'Condor Galaxy', 212.00000, 0.015194, 9, 8);
INSERT INTO public.galaxy VALUES (11, 'Cosmos Redshift 7', 12900.00000, 6.604000, NULL, 9);
INSERT INTO public.galaxy VALUES (12, 'Eye of Sauron', 15.80000, 0.003262, 10, 10);
INSERT INTO public.galaxy VALUES (14, 'Crowbar Galaxy', 30.00000, 646.000000, 12, 10);
INSERT INTO public.galaxy VALUES (13, 'Fireworks Galaxy', 25.20000, 0.000133, 11, 11);
INSERT INTO public.galaxy VALUES (15, 'Hoag''s Object', 612.80000, 12740.000000, 13, 12);
INSERT INTO public.galaxy VALUES (16, 'Large Magellanic Cloud', 0.16300, NULL, 14, 13);
INSERT INTO public.galaxy VALUES (17, 'Lindsay-Shapley Ring', 300.00000, 6604.000000, 15, 14);
INSERT INTO public.galaxy VALUES (18, 'Little Sombrero Galaxy', 40.00000, NULL, 4, 15);
INSERT INTO public.galaxy VALUES (24, 'Needle Galaxy', 42.70000, 0.004103, 1, 2);
INSERT INTO public.galaxy VALUES (19, 'Malin 1', 1190.00000, 0.082557, 18, 2);
INSERT INTO public.galaxy VALUES (27, 'Pinwheel Galaxy', 20.90000, 0.000804, 11, 4);
INSERT INTO public.galaxy VALUES (20, 'Medusa Merger', 128.80000, 2501.000000, 19, 4);
INSERT INTO public.galaxy VALUES (21, 'Sculptor Dwarf Galaxy', 0.29000, 110.000000, 20, 5);
INSERT INTO public.galaxy VALUES (28, 'Sculptor Galaxy', 11.40000, 0.000811, 21, 5);
INSERT INTO public.galaxy VALUES (29, 'Sombrero Galaxy', 31.10000, 0.003416, 22, 6);
INSERT INTO public.galaxy VALUES (31, 'Sunflower Galaxy', 29.30000, 484.000000, 23, 10);
INSERT INTO public.galaxy VALUES (34, 'Whirlpool Galaxy', 31.00000, 0.001544, 26, 10);
INSERT INTO public.galaxy VALUES (22, 'Small Magellanic Cloud', 0.20400, 0.000527, 12, 16);
INSERT INTO public.galaxy VALUES (23, 'Milky Way', NULL, NULL, 16, 21);


--
-- Data for Name: galaxy_morphology; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_morphology VALUES (10, 'S', 'AB', '(rs)', 'ab', NULL, false, 'intermediate spiral');
INSERT INTO public.galaxy_morphology VALUES (11, 'S', 'AB', '(rs)', 'cd', NULL, false, 'intermediate spiral');
INSERT INTO public.galaxy_morphology VALUES (21, 'S', 'AB', '(s)', 'c', NULL, false, 'intermediate spiral');
INSERT INTO public.galaxy_morphology VALUES (16, 'S', 'B', '(rs)', 'bc', NULL, false, 'barred spiral');
INSERT INTO public.galaxy_morphology VALUES (9, 'S', 'B', '(s)', 'b', NULL, true, 'barred spiral');
INSERT INTO public.galaxy_morphology VALUES (24, 'S', 'B', '(s)', 'c', NULL, true, 'barred spiral');
INSERT INTO public.galaxy_morphology VALUES (25, 'S', 'B', '(s)', 'cd', NULL, false, 'barred spiral');
INSERT INTO public.galaxy_morphology VALUES (14, 'S', 'B', '(s)', 'm', NULL, false, 'barred spiral');
INSERT INTO public.galaxy_morphology VALUES (12, 'S', 'B', '(s)', 'm', NULL, true, 'barred spiral');
INSERT INTO public.galaxy_morphology VALUES (2, 'S', 'A', '(r)', 'ab', NULL, false, 'unbarred spiral');
INSERT INTO public.galaxy_morphology VALUES (3, 'S', 'A', '(rs)', 'ab', NULL, false, 'unbarred spiral');
INSERT INTO public.galaxy_morphology VALUES (22, 'S', 'A', '(s)', 'a', NULL, false, 'unbarred spiral');
INSERT INTO public.galaxy_morphology VALUES (4, 'S', 'A', '(s)', 'ab', NULL, false, 'unbarred spiral');
INSERT INTO public.galaxy_morphology VALUES (1, 'S', 'A', '(s)', 'b', NULL, false, 'unbarred spiral');
INSERT INTO public.galaxy_morphology VALUES (26, 'S', 'A', '(s)', 'bc', NULL, true, 'unbarred spiral');
INSERT INTO public.galaxy_morphology VALUES (7, 'S', 'A', '(s)', 'c', NULL, false, 'unbarred spiral');
INSERT INTO public.galaxy_morphology VALUES (23, 'S', 'A', NULL, 'bc', NULL, false, 'unbarred spiral');
INSERT INTO public.galaxy_morphology VALUES (13, 'E', NULL, '(r)', NULL, 0, false, 'spheroidal');
INSERT INTO public.galaxy_morphology VALUES (20, 'E', NULL, NULL, NULL, 0, false, 'spheroidal');
INSERT INTO public.galaxy_morphology VALUES (17, 'I', 'B', '(s)', 'm', NULL, false, 'irregular');
INSERT INTO public.galaxy_morphology VALUES (19, 'I', 'B', NULL, 'm', NULL, true, 'irregular');
INSERT INTO public.galaxy_morphology VALUES (6, 'I0', NULL, NULL, NULL, NULL, false, 'irregular');
INSERT INTO public.galaxy_morphology VALUES (8, 'dIrr', NULL, NULL, NULL, NULL, false, 'irregular');
INSERT INTO public.galaxy_morphology VALUES (15, 'S0', 'A', '(r)', NULL, NULL, false, 'lenticular');
INSERT INTO public.galaxy_morphology VALUES (18, 'S0', 'B', NULL, 'a', NULL, false, 'lenticular');
INSERT INTO public.galaxy_morphology VALUES (5, 'S', NULL, '(r)', NULL, NULL, true, 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 7.34770, 1737.1000, 1);
INSERT INTO public.moon VALUES (2, 'Io', 8.94000, 1815.0000, 3);
INSERT INTO public.moon VALUES (3, 'Europa', 4.80000, 1569.0000, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', 14.81900, 2634.1000, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', 10.75800, 2410.3000, 3);
INSERT INTO public.moon VALUES (6, 'Mimas', 0.00375, 198.3000, 4);
INSERT INTO public.moon VALUES (7, 'Enceladus', 0.01080, 252.1000, 4);
INSERT INTO public.moon VALUES (8, 'Tethys', 0.06174, 533.0000, 4);
INSERT INTO public.moon VALUES (9, 'Dione', 0.10950, 561.7000, 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 0.23060, 764.3000, 4);
INSERT INTO public.moon VALUES (11, 'Titan', 13.45200, 2576.0000, 4);
INSERT INTO public.moon VALUES (12, 'Iapetus', 0.18053, 735.6000, 4);
INSERT INTO public.moon VALUES (13, 'Miranda', 0.00659, 235.8000, 5);
INSERT INTO public.moon VALUES (14, 'Ariel', 0.13500, 578.9000, 5);
INSERT INTO public.moon VALUES (15, 'Umbriel', 0.12000, 584.7000, 5);
INSERT INTO public.moon VALUES (16, 'Titania', 0.35000, 788.9000, 5);
INSERT INTO public.moon VALUES (17, 'Oberon', 0.30140, 761.4000, 5);
INSERT INTO public.moon VALUES (18, 'Triton', 2.14000, 1353.4000, 6);
INSERT INTO public.moon VALUES (19, 'Proteus', 0.00440, 210.0000, 6);
INSERT INTO public.moon VALUES (20, 'Hyperion', 0.00056, 135.0000, 4);
INSERT INTO public.moon VALUES (21, 'Phoebe', 0.00083, 106.5000, 4);
INSERT INTO public.moon VALUES (22, 'Larissa', 0.00042, 97.0000, 6);
INSERT INTO public.moon VALUES (23, 'Janus', 0.00019, 89.5000, 4);
INSERT INTO public.moon VALUES (24, 'Galetea', 0.00021, 87.4000, 6);
INSERT INTO public.moon VALUES (25, 'Amalthea', 0.00021, 83.5000, 3);
INSERT INTO public.moon VALUES (26, 'Puck', 0.00029, 81.0000, 5);
INSERT INTO public.moon VALUES (27, 'Himalia', 0.00042, 69.8000, 3);
INSERT INTO public.moon VALUES (28, 'Portia', 0.00017, 67.6000, 5);
INSERT INTO public.moon VALUES (29, 'Epimetheus', 0.00005, 58.1000, 4);
INSERT INTO public.moon VALUES (30, 'Juliet', 0.00006, 46.8000, 5);
INSERT INTO public.moon VALUES (31, 'Prometheus', 0.00002, 43.1000, 4);
INSERT INTO public.moon VALUES (32, 'Pandora', 0.00001, 40.7000, 4);
INSERT INTO public.moon VALUES (33, 'Belinda', 0.00004, 40.3000, 5);
INSERT INTO public.moon VALUES (34, 'Cressida', 0.00003, 39.8000, 5);
INSERT INTO public.moon VALUES (35, 'Caliban', 0.00003, 21.0000, 5);
INSERT INTO public.moon VALUES (36, 'Rosalind', 0.00003, 36.0000, 5);
INSERT INTO public.moon VALUES (37, 'Desdemona', 0.00002, 32.0000, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1.000, 1.000, 'Earths', 14);
INSERT INTO public.planet VALUES (2, 'Mars', false, 0.107, 0.533, 'Earths', 14);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 1.000, 1.000, 'Jovian', 14);
INSERT INTO public.planet VALUES (4, 'Saturn', false, 95.159, 9.140, 'Earths', 14);
INSERT INTO public.planet VALUES (5, 'Uranus', false, 14.536, 4.007, 'Earths', 14);
INSERT INTO public.planet VALUES (6, 'Neptune', false, 17.147, 3.883, 'Earths', 14);
INSERT INTO public.planet VALUES (7, 'Venus', false, 0.815, 0.950, 'Earths', 14);
INSERT INTO public.planet VALUES (8, 'Mercury', false, 0.055, 0.383, 'Earths', 14);
INSERT INTO public.planet VALUES (9, 'Dimidium', false, 0.460, NULL, 'Jupiters', 18);
INSERT INTO public.planet VALUES (10, 'Taphao Kaew', false, NULL, NULL, NULL, 17);
INSERT INTO public.planet VALUES (11, 'Taphao Thong', false, NULL, NULL, NULL, 17);
INSERT INTO public.planet VALUES (12, 'Vlasina', false, 0.560, 1.225, 'Jupiters', 27);
INSERT INTO public.planet VALUES (13, 'Dopere', false, 2.540, NULL, 'Jupiters', 28);
INSERT INTO public.planet VALUES (14, 'Teberda', false, 0.609, 0.890, 'Jupiters', 29);
INSERT INTO public.planet VALUES (15, 'Pirx', false, NULL, 1.050, 'Jupiters', 25);
INSERT INTO public.planet VALUES (16, 'Leklsullun', false, 0.172, NULL, 'Jupiters', 26);
INSERT INTO public.planet VALUES (17, 'Xolotlan', false, 0.804, NULL, 'Jupiters', 23);
INSERT INTO public.planet VALUES (18, 'Hairu', false, 0.290, NULL, 'Jupiters', 1);
INSERT INTO public.planet VALUES (19, 'Staburags', false, 2.173, 1.133, 'Jupiters', 2);
INSERT INTO public.planet VALUES (20, 'Bran', false, 1.832, 1.264, 'Jupiters', 6);
INSERT INTO public.planet VALUES (21, 'Kavian', false, 0.598, NULL, 'Jupiters', 5);
INSERT INTO public.planet VALUES (22, 'Abol', false, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (23, 'Onasilos', false, 0.230, NULL, 'Jupiters', 13);
INSERT INTO public.planet VALUES (24, 'Finlay', false, 4.300, NULL, 'Jupiters', 12);
INSERT INTO public.planet VALUES (25, 'Asye', false, 0.542, 1.428, 'Jupiters', 11);
INSERT INTO public.planet VALUES (26, 'Pipitea', false, 3.120, NULL, 'Jupiters', 10);
INSERT INTO public.planet VALUES (27, 'Caleuche', false, 14.300, NULL, 'Jupiters', 9);
INSERT INTO public.planet VALUES (28, 'Mastika', false, 0.980, NULL, 'Jupiters', 7);
INSERT INTO public.planet VALUES (29, 'Phobetor', false, 3.000, 1.500, 'Earths', 21);
INSERT INTO public.planet VALUES (30, 'Poltergeist', false, 4.300, NULL, 'Earths', 21);
INSERT INTO public.planet VALUES (31, 'Draugr', false, 0.020, NULL, 'Earths', 21);
INSERT INTO public.planet VALUES (32, 'Majriti', false, 10.250, 1.020, 'Jupiters', 20);
INSERT INTO public.planet VALUES (33, 'Samh', false, 13.980, NULL, 'Jupiters', 20);
INSERT INTO public.planet VALUES (34, 'Saffar', false, 1.700, 1.800, 'Jupiters', 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Emiw', 1, 'K1IV', 118.00, 0.930, 0.980, 23, 16);
INSERT INTO public.star VALUES (2, 'Liesma', 1, 'K0IV', 301.70, 1.230, 2.000, 23, 4);
INSERT INTO public.star VALUES (3, 'Buna', 1, 'F8IV', 195.60, 1.340, 1.660, 23, 1);
INSERT INTO public.star VALUES (4, 'Bibha', 1, 'G1V', 340.00, 1.210, 1.460, 23, 9);
INSERT INTO public.star VALUES (5, 'Kaveh', 1, 'G6/8IV', 424.00, 1.450, 4.070, 23, 12);
INSERT INTO public.star VALUES (6, 'Tuiren', 1, 'G', 958.00, 1.022, 1.096, 23, 10);
INSERT INTO public.star VALUES (7, 'Gumala', 1, 'F8V', 90.00, 1.230, 1.200, 23, 21);
INSERT INTO public.star VALUES (8, 'Tanga', 1, 'G3V', 849.00, 0.890, 1.136, 23, 15);
INSERT INTO public.star VALUES (9, 'Pincoya', 1, 'K3.5V(k)', 130.50, 0.770, 0.770, 23, 21);
INSERT INTO public.star VALUES (10, 'Poerava', 1, 'F7V', 182.70, 1.209, 1.183, 23, 16);
INSERT INTO public.star VALUES (11, 'Nyamien', 1, 'F5', 930.00, 1.180, 1.477, 23, 7);
INSERT INTO public.star VALUES (12, 'Felixvarela', 1, 'K4V(k)', 112.58, 0.720, 0.700, 23, 20);
INSERT INTO public.star VALUES (13, 'Alasia', 1, 'G5V', 135.70, 0.880, NULL, 23, 12);
INSERT INTO public.star VALUES (14, 'Sun', 8, 'G2V', NULL, 1.000, 1.000, 23, NULL);
INSERT INTO public.star VALUES (15, 'Intercrus', 1, 'K0III', 280.00, 2.070, 11.000, 23, 4);
INSERT INTO public.star VALUES (16, 'Fafnir', 1, 'K1.5III', 315.00, 0.879, 21.760, 23, 18);
INSERT INTO public.star VALUES (17, 'Chalawan', 3, 'G1V', 45.90, 1.080, 1.172, 23, 4);
INSERT INTO public.star VALUES (18, 'Helvetios', 1, 'G2IV', 50.64, 1.120, 1.237, 23, 15);
INSERT INTO public.star VALUES (19, 'Edasich', 2, 'K2III', 101.20, 1.560, 11.830, 23, 18);
INSERT INTO public.star VALUES (20, 'Titawin', 3, 'F8V', 45.97, 1.270, 1.480, 23, 1);
INSERT INTO public.star VALUES (21, 'Lich', 3, 'Pulsar', 2300.00, 1.400, NULL, 23, 6);
INSERT INTO public.star VALUES (22, 'Veritate', 1, 'K0III', 247.00, 1.120, 10.490, 23, 1);
INSERT INTO public.star VALUES (23, 'Cocibolca', 1, 'G7V', 111.60, 0.883, 0.846, 23, 5);
INSERT INTO public.star VALUES (24, 'Sterrennacht', 1, 'F8V', 895.00, 1.290, 1.460, 23, 1);
INSERT INTO public.star VALUES (25, 'Solaris', 1, 'K2V', 161.20, 0.820, 0.780, 23, 15);
INSERT INTO public.star VALUES (26, 'Uklun', 1, 'G6V', 129.20, 1.370, 1.030, 23, 7);
INSERT INTO public.star VALUES (27, 'Morava', 1, 'F9', 1420.00, 1.229, 1.401, 23, 15);
INSERT INTO public.star VALUES (28, 'Belel', 1, 'K0III', 394.00, 1.780, 4.550, 23, 21);
INSERT INTO public.star VALUES (29, 'Dombay', 1, 'K5', 439.80, 0.925, 0.850, 23, 4);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 21, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 35, true);


--
-- Name: galaxy_morphology_galaxy_morphology_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_morphology_galaxy_morphology_id_seq', 26, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 37, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 34, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 29, true);


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
-- Name: galaxy_morphology galaxy_morphology_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_morphology
    ADD CONSTRAINT galaxy_morphology_pkey PRIMARY KEY (galaxy_morphology_id);


--
-- Name: galaxy_morphology galaxy_morphology_type_bars_rings_tightness_ellipticity_is__key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_morphology
    ADD CONSTRAINT galaxy_morphology_type_bars_rings_tightness_ellipticity_is__key UNIQUE (type, bar, rings, tightness, ellipticity, is_peculiar);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: galaxy galaxy_galaxy_morphology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_morphology_id_fkey FOREIGN KEY (galaxy_morphology_id) REFERENCES public.galaxy_morphology(galaxy_morphology_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
