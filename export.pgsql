--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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


CREATE TABLE public.recipe (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image_url character varying(255)
);


ALTER TABLE public.recipe OWNER TO "mikro-orm-bug";

--
-- Name: recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: mikro-orm-bug
--

CREATE SEQUENCE public.recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_id_seq OWNER TO "mikro-orm-bug";

--
-- Name: recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikro-orm-bug
--

ALTER SEQUENCE public.recipe_id_seq OWNED BY public.recipe.id;


--
-- Name: recipe_step; Type: TABLE; Schema: public; Owner: mikro-orm-bug
--

CREATE TABLE public.recipe_step (
    id integer NOT NULL,
    text character varying(255) NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.recipe_step OWNER TO "mikro-orm-bug";

--
-- Name: recipe_step_id_seq; Type: SEQUENCE; Schema: public; Owner: mikro-orm-bug
--

CREATE SEQUENCE public.recipe_step_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_step_id_seq OWNER TO "mikro-orm-bug";

--
-- Name: recipe_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikro-orm-bug
--

ALTER SEQUENCE public.recipe_step_id_seq OWNED BY public.recipe_step.id;

--
-- Name: recipe id; Type: DEFAULT; Schema: public; Owner: mikro-orm-bug
--

ALTER TABLE ONLY public.recipe ALTER COLUMN id SET DEFAULT nextval('public.recipe_id_seq'::regclass);

--
-- Name: recipe_step id; Type: DEFAULT; Schema: public; Owner: mikro-orm-bug
--

ALTER TABLE ONLY public.recipe_step ALTER COLUMN id SET DEFAULT nextval('public.recipe_step_id_seq'::regclass);


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: mikro-orm-bug
--

COPY public.recipe (id, name, image_url) FROM stdin;
1	Roast Beef with Onions	https://i.ytimg.com/vi/3zDVy7p9hR0/maxresdefault.jpg
2	Truffle Burger	https://i0.wp.com/bbqlicate.de/wp-content/uploads/2017/10/Hirsch-Burger-Pfifferlinge-Trueffel-Mayo-3.jpg?fit=1400%2C933&ssl=1
3	Sweet Potato Fries 	https://cdn.gutekueche.de/upload/rezept/5510/suesskartoffel-pommes.jpg
4	Rib-Eye Steak	https://cdn.gutekueche.de/upload/rezept/10862/1600x1200_rib-eye-steak.jpg
5	Fried Chicken Salad	https://www.falstaff.at/fileadmin/_processed_/2/b/csm_01-Salat-in-Schuessel-c-Julian-Kutos-2640_a24a97ee2d.jpg
6	Potato Wedges	https://www.indianhealthyrecipes.com/wp-content/uploads/2020/10/potato-wedges-recipe.jpg
7	Pan-Seared Steak	https://natashaskitchen.com/wp-content/uploads/2020/03/Pan-Seared-Steak-4.jpg
8	Test Recipe	\N
9	Onion Rings	https://image.brigitte.de/11682720/t/O6/v3/w1440/r1/-/zwiebelringe.jpg
\.


--
-- Data for Name: recipe_step; Type: TABLE DATA; Schema: public; Owner: mikro-orm-bug
--

COPY public.recipe_step (id, text, recipe_id) FROM stdin;
1	Pat dry – use paper towels to pat the steaks dry to get a perfect sear and reduce oil splatter.	7
2	Season generously – just before cooking steaks, sprinkle both sides liberally with salt and pepper.	7
3	Preheat the pan on medium and brush with oil. Using just 1/2 Tbsp oil reduces splatter.	7
4	Sear steaks – add steaks and sear each side 3-4 minutes until a brown crust has formed then use tongs to turn steaks on their sides and sear edges (1 min per edge).	7
5	Add butter and aromatics – melt in butter with quartered garlic cloves and rosemary sprigs. Tilt pan to spoon garlic butter over steaks and cook to your desired doneness (see chart below).	7
6	Remove steak and rest 10 minutes before slicing against the grain.	7
7	Peel the onion and cut into rings.	9
8	Beat the egg in a plate and add a little salt.	9
9	The flour in another plate also a little salt.	9
10	In another plate, prepare the breadcrumbs.	9
11	Roll the onion first in the flour, then in the egg dough. Further dip in the breadcrumbs, press lightly.	9
12	Fry the onion rings in hot oil (or fritter).	9
13	New1	1
14	New2	1
\.

--
-- Name: recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikro-orm-bug
--

SELECT pg_catalog.setval('public.recipe_id_seq', 9, true);

--
-- Name: recipe_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikro-orm-bug
--

SELECT pg_catalog.setval('public.recipe_step_id_seq', 14, true);

--
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: mikro-orm-bug
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id);


--
-- Name: recipe_step recipe_step_pkey; Type: CONSTRAINT; Schema: public; Owner: mikro-orm-bug
--

ALTER TABLE ONLY public.recipe_step
    ADD CONSTRAINT recipe_step_pkey PRIMARY KEY (id);


--
-- Name: recipe_step recipe_step_recipe_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: mikro-orm-bug
--

ALTER TABLE ONLY public.recipe_step
    ADD CONSTRAINT recipe_step_recipe_id_foreign FOREIGN KEY (recipe_id) REFERENCES public.recipe(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

