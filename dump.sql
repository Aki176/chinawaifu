--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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
-- Name: claimedlist; Type: TABLE; Schema: public; Owner: bot
--

CREATE TABLE public.claimedlist (
    id integer NOT NULL,
    userid character varying(20) NOT NULL,
    waifu character varying(64) NOT NULL,
    claimedamount bigint DEFAULT 1
);


ALTER TABLE public.claimedlist OWNER TO bot;

--
-- Name: claimedlist_id_seq; Type: SEQUENCE; Schema: public; Owner: bot
--

CREATE SEQUENCE public.claimedlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.claimedlist_id_seq OWNER TO bot;

--
-- Name: claimedlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bot
--

ALTER SEQUENCE public.claimedlist_id_seq OWNED BY public.claimedlist.id;


--
-- Name: profile; Type: TABLE; Schema: public; Owner: bot
--

CREATE TABLE public.profile (
    userid character varying(20) NOT NULL,
    money bigint DEFAULT 0
);


ALTER TABLE public.profile OWNER TO bot;

--
-- Name: waifu; Type: TABLE; Schema: public; Owner: bot
--

CREATE TABLE public.waifu (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    series character varying(32) NOT NULL,
    img text[] NOT NULL
);


ALTER TABLE public.waifu OWNER TO bot;

--
-- Name: waifu_id_seq; Type: SEQUENCE; Schema: public; Owner: bot
--

CREATE SEQUENCE public.waifu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.waifu_id_seq OWNER TO bot;

--
-- Name: waifu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bot
--

ALTER SEQUENCE public.waifu_id_seq OWNED BY public.waifu.id;


--
-- Name: claimedlist id; Type: DEFAULT; Schema: public; Owner: bot
--

ALTER TABLE ONLY public.claimedlist ALTER COLUMN id SET DEFAULT nextval('public.claimedlist_id_seq'::regclass);


--
-- Name: waifu id; Type: DEFAULT; Schema: public; Owner: bot
--

ALTER TABLE ONLY public.waifu ALTER COLUMN id SET DEFAULT nextval('public.waifu_id_seq'::regclass);


--
-- Data for Name: claimedlist; Type: TABLE DATA; Schema: public; Owner: bot
--

COPY public.claimedlist (id, userid, waifu, claimedamount) FROM stdin;
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: bot
--

COPY public.profile (userid, money) FROM stdin;
\.


--
-- Data for Name: waifu; Type: TABLE DATA; Schema: public; Owner: bot
--

COPY public.waifu (id, name, series, img) FROM stdin;
1	Rin Tohsaka	Fate Stay Night	{https://i.imgur.com/AD20gWj.png,https://i.imgur.com/JS91EYY.png,https://i.imgur.com/OeDuEpb.png}
2	Artoria Pendragon (Alter)	Fate Stay Night	{https://i.imgur.com/heL5k1H.png,https://i.imgur.com/qoYBaxe.png,https://i.imgur.com/Ka1paJo.png}
3	Saber	Fate Stay Night	{https://i.imgur.com/Fxl2OEI.png,https://i.imgur.com/p2dBSYD.png,https://i.imgur.com/jDiufgO.png}
4	Illyasviel von Einzbern	Fate Stay Night	{https://i.imgur.com/2dQa1ON.png,https://i.imgur.com/GZfIDeP.png,https://i.imgur.com/bnajQvK.png}
5	Caster - Medea	Fate Stay Night	{https://i.imgur.com/2c8y9uT.png,https://i.imgur.com/ONBCpCL.png,https://i.imgur.com/2c8y9uT.png}
6	Rider - Medusa	Fate Stay Night	{https://i.imgur.com/QFKuWW6.png,https://i.imgur.com/xQh1ThY.png,https://i.imgur.com/484HLha.png}
7	Sakura Matou	Fate Stay Night	{https://i.imgur.com/IIaqSzv.png,https://i.imgur.com/Etga8qD.png,https://i.imgur.com/qwk3Seb.png}
8	Justeaze Lizrich von Einzbern	Fate Stay Night	{https://i.imgur.com/RmqDWx2.png,https://i.imgur.com/kh8IzNU.png}
9	Sella	Fate Stay Night	{https://i.imgur.com/rHz65Xf.png,https://i.imgur.com/JIOa01U.png}
10	D.Va	Overwatch	{https://i.imgur.com/KbNjjqK.png,https://i.imgur.com/iitSmwB.png}
11	Orisa	Overwatch	{https://i.imgur.com/4GGYEtj.png}
12	Zarya	Overwatch	{https://i.imgur.com/ROuTsWc.png}
13	Mei	Overwatch	{https://i.imgur.com/y3U4jUh.png,https://i.imgur.com/HQvaaVZ.png}
14	Pharah	Overwatch	{https://i.imgur.com/KjqzHCY.png,https://i.imgur.com/1kZnGrm.png}
15	Sombra	Overwatch	{https://i.imgur.com/Bl9m8wJ.png}
16	Symmetra	Overwatch	{https://i.imgur.com/o09A7t5.png}
17	Tracer	Overwatch	{https://i.imgur.com/2L6BwSd.png,https://i.imgur.com/apdpwvw.png}
18	Widowmaker	Overwatch	{https://i.imgur.com/L5Hs4Ko.png,https://i.imgur.com/flZ0YhS.png}
19	Ana	Overwatch	{https://i.imgur.com/h36rJQK.png,https://i.imgur.com/VpC7b8Q.png}
20	Brigitte	Overwatch	{https://i.imgur.com/RARJrgK.png}
21	Mercy	Overwatch	{https://i.imgur.com/VOfUxD7.png,https://i.imgur.com/V3KuR8r.png}
22	Moira	Overwatch	{https://i.imgur.com/03KsMQL.png}
23	Himeko Inaba	Kokoro Connect	{https://i.imgur.com/oC7TC7I.png,https://i.imgur.com/Z8bD8os.png,https://i.imgur.com/DVsG19n.png}
24	Iori Nagase	Kokoro Connect	{https://i.imgur.com/KWJNNUU.png,https://i.imgur.com/lhFrG3Z.png,https://i.imgur.com/bVGiTJe.png}
25	Yui Kiriyama	Kokoro Connect	{https://i.imgur.com/vgGQb3I.png,https://i.imgur.com/MDGwVJN.png}
26	Arash	Fate Grand Order	{https://i.imgur.com/8rbI6uj.png}
27	Wolfgang Amadeus Mozart	Fate Grand Order	{https://i.imgur.com/LklhBiP.png}
28	Sasaki Kojirō	Fate Grand Order	{https://i.imgur.com/E0qYYZh.png}
29	Spartacus	Fate Grand Order	{https://i.imgur.com/WPLrzoA.png}
30	Asterios	Fate Grand Order	{https://i.imgur.com/rlbXsxc.png}
31	Angra Mainyu	Fate Grand Order	{https://i.imgur.com/yorWrg0.png}
32	Jason	Fate Grand Order	{https://i.imgur.com/2157ksz.png}
33	Bartholomew Roberts	Fate Grand Order	{https://i.imgur.com/G9loMJD.png}
34	Musashibō Benkei	Fate Grand Order	{https://i.imgur.com/x3oOK1f.png}
35	Leonidas I	Fate Grand Order	{https://i.imgur.com/NVG4AYi.png}
36	Georgios	Fate Grand Order	{https://i.imgur.com/E8BpU2j.png}
37	Edward Teach	Fate Grand Order	{https://i.imgur.com/xaorRF6.png}
38	Hans Christian Andersen	Fate Grand Order	{https://i.imgur.com/w7J0cFn.png}
39	William Shakespeare	Fate Grand Order	{https://i.imgur.com/foOQ8aX.png}
40	Hassan of the Cursed Arm	Fate Grand Order	{https://i.imgur.com/Rs2oehX.png}
41	Charles-Henri Sanson	Fate Grand Order	{https://i.imgur.com/dJLS5bs.png}
42	Phantom of the Opera	Fate Grand Order	{https://i.imgur.com/9GNe5wO.png}
43	Caligula	Fate Grand Order	{https://i.imgur.com/hoE0vHA.png}
44	Eric Bloodaxe	Fate Grand Order	{https://i.imgur.com/RsXHS03.png}
45	Paris	Fate Grand Order	{https://i.imgur.com/N1VE5v4.png}
46	Chen Gong	Fate Grand Order	{https://i.imgur.com/IGJzTEM.png}
47	Gaius Julius Caesar	Fate Grand Order	{https://i.imgur.com/07HnZzq.png}
48	Gilles de Rais (Saber)	Fate Grand Order	{https://i.imgur.com/eegAnup.png}
49	Fergus mac Róich	Fate Grand Order	{https://i.imgur.com/kvHX6H3.png}
50	Bedivere	Fate Grand Order	{https://i.imgur.com/5Ux15mK.png}
51	Robin Hood	Fate Grand Order	{https://i.imgur.com/jJtSNUC.png}
52	David	Fate Grand Order	{https://i.imgur.com/rfLstHq.png}
53	Kid Gil	Fate Grand Order	{https://i.imgur.com/KBnrfFu.png}
54	Billy the Kid	Fate Grand Order	{https://i.imgur.com/qwBVwzW.png}
55	Tawara Tōta	Fate Grand Order	{https://i.imgur.com/W1W9iQY.png}
56	William Tell	Fate Grand Order	{https://i.imgur.com/bwr83hu.png}
57	Cú Chulainn	Fate Grand Order	{https://i.imgur.com/XnyTZs0.png}
58	Cú Chulainn (Prototype)	Fate Grand Order	{https://i.imgur.com/kL2cbQc.png}
59	Diarmuid Ua Duibhne (Lancer)	Fate Grand Order	{https://i.imgur.com/qwKw3at.png}
60	Romulus	Fate Grand Order	{https://i.imgur.com/M15spNE.png}
61	Hector	Fate Grand Order	{https://i.imgur.com/yw9ubmE.png}
62	Hōzōin Inshun	Fate Grand Order	{https://i.imgur.com/5rTT6En.png}
63	Alexander	Fate Grand Order	{https://i.imgur.com/ZnrhiH3.png}
64	Christopher Columbus	Fate Grand Order	{https://i.imgur.com/lfVLBv1.png}
65	Red Hare	Fate Grand Order	{https://i.imgur.com/7EdeK8j.png}
66	Gilles de Rais (Caster)	Fate Grand Order	{https://i.imgur.com/SQmMYAP.png}
67	Mephistopheles	Fate Grand Order	{https://i.imgur.com/CqXtevW.png}
68	Cú Chulainn (Caster)	Fate Grand Order	{https://i.imgur.com/9mmNh8V.png}
69	Paracelsus von Hohenheim	Fate Grand Order	{https://i.imgur.com/qdPzz80.png}
70	Charles Babbage	Fate Grand Order	{https://i.imgur.com/oGJ8jkQ.png}
71	Geronimo	Fate Grand Order	{https://i.imgur.com/uwmdxi3.png}
72	Avicebron	Fate Grand Order	{https://i.imgur.com/Id0z0Pl.png}
73	Asclepius	Fate Grand Order	{https://i.imgur.com/AHyeOTW.png}
74	Henry Jekyll & Hyde	Fate Grand Order	{https://i.imgur.com/GPmgVEV.png}
75	Fūma Kotarō	Fate Grand Order	{https://i.imgur.com/P5lT16j.png,https://i.imgur.com/1dICbQk.png}
76	Okada Izō	Fate Grand Order	{https://i.imgur.com/uiVkb20.png}
77	Lu Bu Fengxian	Fate Grand Order	{https://i.imgur.com/Q840xvC.png}
78	Darius III	Fate Grand Order	{https://i.imgur.com/8YvMjFf.png}
79	Mori Nagayoshi	Fate Grand Order	{https://i.imgur.com/yq0nOBk.png}
80	Antonio Salieri 	Fate Grand Order	{https://i.imgur.com/BloAblR.png}
81	Siegfried	Fate Grand Order	{https://i.imgur.com/5uX2yhQ.png,https://i.imgur.com/smnEsQp.png}
82	Rama	Fate Grand Order	{https://i.imgur.com/FHGEN1i.png}
83	Lancelot (Saber)	Fate Grand Order	{https://i.imgur.com/1jxthfG.png}
84	Gawain	Fate Grand Order	{https://i.imgur.com/It79wGx.png}
85	Yagyū Munenori	Fate Grand Order	{https://i.imgur.com/52SfkOw.png}
86	Diarmuid Ua Duibhne (Saber)	Fate Grand Order	{https://i.imgur.com/XBICMoo.png}
87	Lanling Wang	Fate Grand Order	{https://i.imgur.com/GCVC0c3.png}
88	EMIYA	Fate Grand Order	{https://i.imgur.com/6JhCbn4.png}
89	Tristan	Fate Grand Order	{https://i.imgur.com/pX2HhM1.png}
90	EMIYA (Alter)	Fate Grand Order	{https://i.imgur.com/aTKCeXs.png}
91	Chiron	Fate Grand Order	{https://i.imgur.com/2E0NmYU.png}
92	Aśvatthāman	Fate Grand Order	{https://i.imgur.com/xjDsIZ0.png}
93	Fionn mac Cumhaill	Fate Grand Order	{https://i.imgur.com/Jq2hhpC.png}
94	Li Shuwen (Lancer)	Fate Grand Order	{https://i.imgur.com/K2Wsm3I.png}
95	Vlad III (EXTRA)	Fate Grand Order	{https://i.imgur.com/2UrE1So.png}
96	Sakata Kintoki (Rider)	Fate Grand Order	{https://i.imgur.com/7ljP1C7.png}
97	Sakamoto Ryōma	Fate Grand Order	{https://i.imgur.com/KpfAtQc.png}
98	Thomas Edison	Fate Grand Order	{https://i.imgur.com/0aQXNq5.png}
99	Gilgamesh (Caster)	Fate Grand Order	{https://i.imgur.com/2QkYa6Z.png,https://i.imgur.com/sg2LPWm.png}
100	Sieg	Fate Grand Order	{https://i.imgur.com/KxZy7Bh.png}
101	EMIYA (Assassin)	Fate Grand Order	{https://i.imgur.com/r2nZlo3.png}
102	Yan Qing	Fate Grand Order	{https://i.imgur.com/lnutUpx.png}
103	Heracles	Fate Grand Order	{https://i.imgur.com/gWWBtAt.png}
104	Lancelot	Fate Grand Order	{https://i.imgur.com/MfXh5Rt.png}
105	Beowulf	Fate Grand Order	{https://i.imgur.com/3t5zi9W.png}
106	Hessian Lobo	Fate Grand Order	{https://i.imgur.com/pPSWdji.png}
107	Astolfo	Fate Grand Order	{https://i.imgur.com/QF2vsUS.png,https://i.imgur.com/6knsSkR.png}
108	Arthur Pendragon (Prototype)	Fate Grand Order	{https://i.imgur.com/a77Ytbi.png,https://i.imgur.com/2fTIVbt.jpg}
109	Sigurd	Fate Grand Order	{https://i.imgur.com/N9U26QG.png}
110	Gilgamesh (Archer)	Fate Grand Order	{https://i.imgur.com/g31a0rq.png}
111	Orion	Fate Grand Order	{https://i.imgur.com/clm5jmf.png}
112	Nikola Tesla	Fate Grand Order	{https://i.imgur.com/yg8ggwZ.png}
113	Arjuna (Archer)	Fate Grand Order	{https://i.imgur.com/Hapa1oa.png}
114	James Moriarty	Fate Grand Order	{https://i.imgur.com/uBkiZ7r.png,https://i.imgur.com/if3Cej7.png}
115	Napoléon I	Fate Grand Order	{https://i.imgur.com/4z6qSII.png}
116	Enkidu	Fate Grand Order	{https://i.imgur.com/lH4KTmt.png}
117	Karna	Fate Grand Order	{https://i.imgur.com/WcsTO06.png,https://i.imgur.com/FEQJLq3.png}
118	Iskandar	Fate Grand Order	{https://i.imgur.com/56vkqQy.png}
119	Ozymandias	Fate Grand Order	{https://i.imgur.com/cNfOZMG.png}
120	Ivan the Terrible	Fate Grand Order	{https://i.imgur.com/2ELT6ew.png}
121	Achilles	Fate Grand Order	{https://i.imgur.com/FcwmFzo.png}
122	Zhuge Liang (Lord El-Melloi II)	Fate Grand Order	{https://i.imgur.com/gV1chB0.png}
123	Merlin	Fate Grand Order	{https://i.imgur.com/YtI1Fzx.png,https://i.imgur.com/vs15rWA.png}
124	<The Old Man of the Mountain>	Fate Grand Order	{https://i.imgur.com/LZY4GOC.png}
125	Li Shuwen (Assassin)	Fate Grand Order	{https://i.imgur.com/rnTLG8T.png}
126	Sakata Kintoki (Berserker)	Fate Grand Order	{https://i.imgur.com/3WE8mLZ.png}
127	Vlad III (Berserker)	Fate Grand Order	{https://i.imgur.com/YJN6PQg.png}
128	Cú Chulainn (Alter)	Fate Grand Order	{https://i.imgur.com/SK3XPne.png}
129	Hijikata Toshizō	Fate Grand Order	{https://i.imgur.com/T83DYWT.png}
130	Xiang Yu	Fate Grand Order	{https://i.imgur.com/RioqyJ8.png}
131	Arjuna (Alter)	Fate Grand Order	{https://i.imgur.com/C22N7oy.png}
132	Amakusa Shirō	Fate Grand Order	{https://i.imgur.com/wBAIHsl.png}
133	Sherlock Holmes	Fate Grand Order	{https://i.imgur.com/cUGF1lc.png}
134	Shi Huang Di	Fate Grand Order	{https://i.imgur.com/2RHUNTy.png}
135	Edmond Dantès	Fate Grand Order	{https://i.imgur.com/KPP8pqn.png,https://i.imgur.com/T6S2yxI.png}
\.


--
-- Name: claimedlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bot
--

SELECT pg_catalog.setval('public.claimedlist_id_seq', 1, false);


--
-- Name: waifu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bot
--

SELECT pg_catalog.setval('public.waifu_id_seq', 135, true);


--
-- Name: claimedlist claimedlist_pkey; Type: CONSTRAINT; Schema: public; Owner: bot
--

ALTER TABLE ONLY public.claimedlist
    ADD CONSTRAINT claimedlist_pkey PRIMARY KEY (id);


--
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: bot
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (userid);


--
-- Name: waifu waifu_name_key; Type: CONSTRAINT; Schema: public; Owner: bot
--

ALTER TABLE ONLY public.waifu
    ADD CONSTRAINT waifu_name_key UNIQUE (name);


--
-- Name: waifu waifu_pkey; Type: CONSTRAINT; Schema: public; Owner: bot
--

ALTER TABLE ONLY public.waifu
    ADD CONSTRAINT waifu_pkey PRIMARY KEY (id);


--
-- Name: claimedlist claimedlist_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bot
--

ALTER TABLE ONLY public.claimedlist
    ADD CONSTRAINT claimedlist_userid_fkey FOREIGN KEY (userid) REFERENCES public.profile(userid);


--
-- Name: claimedlist claimedlist_waifu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bot
--

ALTER TABLE ONLY public.claimedlist
    ADD CONSTRAINT claimedlist_waifu_fkey FOREIGN KEY (waifu) REFERENCES public.waifu(name);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO bot;


--
-- PostgreSQL database dump complete
--

