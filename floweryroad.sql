--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "floweryroadAdmin";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "floweryroadAdmin";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "floweryroadAdmin";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: core_birth; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_birth (
    id integer NOT NULL,
    date date NOT NULL,
    flower_id integer NOT NULL
);


ALTER TABLE public.core_birth OWNER TO "floweryroadAdmin";

--
-- Name: core_birth_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_birth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_birth_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_birth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_birth_id_seq OWNED BY public.core_birth.id;


--
-- Name: core_color; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_color (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    code character varying(7) NOT NULL
);


ALTER TABLE public.core_color OWNER TO "floweryroadAdmin";

--
-- Name: core_color_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_color_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_color_id_seq OWNED BY public.core_color.id;


--
-- Name: core_comment; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_comment (
    id integer NOT NULL,
    content character varying(200) NOT NULL,
    star double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    flower_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_comment OWNER TO "floweryroadAdmin";

--
-- Name: core_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_comment_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_comment_id_seq OWNED BY public.core_comment.id;


--
-- Name: core_commentlike; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_commentlike (
    id integer NOT NULL,
    "like" boolean NOT NULL,
    liked_at timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_commentlike OWNER TO "floweryroadAdmin";

--
-- Name: core_commentlike_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_commentlike_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_commentlike_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_commentlike_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_commentlike_id_seq OWNED BY public.core_commentlike.id;


--
-- Name: core_flower; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_flower (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL,
    season integer NOT NULL
);


ALTER TABLE public.core_flower OWNER TO "floweryroadAdmin";

--
-- Name: core_flower_colors; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_flower_colors (
    id integer NOT NULL,
    flower_id integer NOT NULL,
    color_id integer NOT NULL
);


ALTER TABLE public.core_flower_colors OWNER TO "floweryroadAdmin";

--
-- Name: core_flower_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_flower_colors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_flower_colors_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_flower_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_flower_colors_id_seq OWNED BY public.core_flower_colors.id;


--
-- Name: core_flower_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_flower_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_flower_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_flower_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_flower_id_seq OWNED BY public.core_flower.id;


--
-- Name: core_flower_languages; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_flower_languages (
    id integer NOT NULL,
    flower_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.core_flower_languages OWNER TO "floweryroadAdmin";

--
-- Name: core_flower_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_flower_languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_flower_languages_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_flower_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_flower_languages_id_seq OWNED BY public.core_flower_languages.id;


--
-- Name: core_flower_purposes; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_flower_purposes (
    id integer NOT NULL,
    flower_id integer NOT NULL,
    purpose_id integer NOT NULL
);


ALTER TABLE public.core_flower_purposes OWNER TO "floweryroadAdmin";

--
-- Name: core_flower_purposes_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_flower_purposes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_flower_purposes_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_flower_purposes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_flower_purposes_id_seq OWNED BY public.core_flower_purposes.id;


--
-- Name: core_image; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_image (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    flower_id integer
);


ALTER TABLE public.core_image OWNER TO "floweryroadAdmin";

--
-- Name: core_image_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_image_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_image_id_seq OWNED BY public.core_image.id;


--
-- Name: core_language; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_language (
    id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.core_language OWNER TO "floweryroadAdmin";

--
-- Name: core_language_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_language_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_language_id_seq OWNED BY public.core_language.id;


--
-- Name: core_purpose; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_purpose (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.core_purpose OWNER TO "floweryroadAdmin";

--
-- Name: core_purpose_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_purpose_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_purpose_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_purpose_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_purpose_id_seq OWNED BY public.core_purpose.id;


--
-- Name: core_view; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.core_view (
    id integer NOT NULL,
    view_at timestamp with time zone NOT NULL,
    flower_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_view OWNER TO "floweryroadAdmin";

--
-- Name: core_view_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.core_view_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_view_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: core_view_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.core_view_id_seq OWNED BY public.core_view.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "floweryroadAdmin";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "floweryroadAdmin";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "floweryroadAdmin";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "floweryroadAdmin";

--
-- Name: flauth_user; Type: TABLE; Schema: public; Owner: floweryroadAdmin
--

CREATE TABLE public.flauth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(255) NOT NULL,
    nickname character varying(30) NOT NULL,
    is_active boolean NOT NULL,
    is_admin boolean NOT NULL,
    color_id integer,
    purpose_id integer,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.flauth_user OWNER TO "floweryroadAdmin";

--
-- Name: flauth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: floweryroadAdmin
--

CREATE SEQUENCE public.flauth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flauth_user_id_seq OWNER TO "floweryroadAdmin";

--
-- Name: flauth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: floweryroadAdmin
--

ALTER SEQUENCE public.flauth_user_id_seq OWNED BY public.flauth_user.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: core_birth id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_birth ALTER COLUMN id SET DEFAULT nextval('public.core_birth_id_seq'::regclass);


--
-- Name: core_color id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_color ALTER COLUMN id SET DEFAULT nextval('public.core_color_id_seq'::regclass);


--
-- Name: core_comment id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_comment ALTER COLUMN id SET DEFAULT nextval('public.core_comment_id_seq'::regclass);


--
-- Name: core_commentlike id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_commentlike ALTER COLUMN id SET DEFAULT nextval('public.core_commentlike_id_seq'::regclass);


--
-- Name: core_flower id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower ALTER COLUMN id SET DEFAULT nextval('public.core_flower_id_seq'::regclass);


--
-- Name: core_flower_colors id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_colors ALTER COLUMN id SET DEFAULT nextval('public.core_flower_colors_id_seq'::regclass);


--
-- Name: core_flower_languages id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_languages ALTER COLUMN id SET DEFAULT nextval('public.core_flower_languages_id_seq'::regclass);


--
-- Name: core_flower_purposes id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_purposes ALTER COLUMN id SET DEFAULT nextval('public.core_flower_purposes_id_seq'::regclass);


--
-- Name: core_image id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_image ALTER COLUMN id SET DEFAULT nextval('public.core_image_id_seq'::regclass);


--
-- Name: core_language id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_language ALTER COLUMN id SET DEFAULT nextval('public.core_language_id_seq'::regclass);


--
-- Name: core_purpose id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_purpose ALTER COLUMN id SET DEFAULT nextval('public.core_purpose_id_seq'::regclass);


--
-- Name: core_view id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_view ALTER COLUMN id SET DEFAULT nextval('public.core_view_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: flauth_user id; Type: DEFAULT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.flauth_user ALTER COLUMN id SET DEFAULT nextval('public.flauth_user_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can delete user	1	delete_user
4	Can view user	1	view_user
5	Can add color	2	add_color
6	Can change color	2	change_color
7	Can delete color	2	delete_color
8	Can view color	2	view_color
9	Can add purpose	3	add_purpose
10	Can change purpose	3	change_purpose
11	Can delete purpose	3	delete_purpose
12	Can view purpose	3	view_purpose
13	Can add language	4	add_language
14	Can change language	4	change_language
15	Can delete language	4	delete_language
16	Can view language	4	view_language
17	Can add flower	5	add_flower
18	Can change flower	5	change_flower
19	Can delete flower	5	delete_flower
20	Can view flower	5	view_flower
21	Can add image	6	add_image
22	Can change image	6	change_image
23	Can delete image	6	delete_image
24	Can view image	6	view_image
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add permission	8	add_permission
30	Can change permission	8	change_permission
31	Can delete permission	8	delete_permission
32	Can view permission	8	view_permission
33	Can add group	9	add_group
34	Can change group	9	change_group
35	Can delete group	9	delete_group
36	Can view group	9	view_group
37	Can add content type	10	add_contenttype
38	Can change content type	10	change_contenttype
39	Can delete content type	10	delete_contenttype
40	Can view content type	10	view_contenttype
41	Can add session	11	add_session
42	Can change session	11	change_session
43	Can delete session	11	delete_session
44	Can view session	11	view_session
45	Can add comment	12	add_comment
46	Can change comment	12	change_comment
47	Can delete comment	12	delete_comment
48	Can view comment	12	view_comment
49	Can add comment like	13	add_commentlike
50	Can change comment like	13	change_commentlike
51	Can delete comment like	13	delete_commentlike
52	Can view comment like	13	view_commentlike
53	Can add view	14	add_view
54	Can change view	14	change_view
55	Can delete view	14	delete_view
56	Can view view	14	view_view
57	Can add birth	15	add_birth
58	Can change birth	15	change_birth
59	Can delete birth	15	delete_birth
60	Can view birth	15	view_birth
\.


--
-- Data for Name: core_birth; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_birth (id, date, flower_id) FROM stdin;
1	1970-08-10	55
\.


--
-- Data for Name: core_color; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_color (id, name, code) FROM stdin;
1	빨간색	#FF0000
2	주황색	#FF8000
3	노란색	#FFFF00
4	초록색	#00FF00
5	파란색	#0040FF
6	보라색	#4000FF
7	분홍색	#FF00FF
8	흰색	#FFFFFF
\.


--
-- Data for Name: core_comment; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_comment (id, content, star, created_at, flower_id, user_id) FROM stdin;
2	히히히히	4.5	2019-08-09 20:24:17.728886+00	49	1
3	참 좋은꽃이네요	4	2019-08-11 11:42:56.575852+00	49	1
4	향이 좋아요	3.5	2019-08-11 11:43:15.558325+00	49	1
5	히야신스 이즈 베스트	4.5	2019-08-11 11:43:43.90605+00	49	1
\.


--
-- Data for Name: core_commentlike; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_commentlike (id, "like", liked_at, comment_id, user_id) FROM stdin;
\.


--
-- Data for Name: core_flower; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_flower (id, name, description, season) FROM stdin;
5	장미	18세기 말에 아시아의 각 원종이 유럽에 도입되고 이들 유럽과 아시아 원종간의 교배가 이루어져 화색이나 화형은 물론 사계성이나 개화성 등 생태적으로 변화가 많은 품종들이 만들어졌다. 18세기 이전의 장미를 고대장미(old?rose), 19세기 이후의 장미를 현대장미(modern?rose)라 한다. 장미는 온대성의 상록관목으로 햇빛을 좋아하는 식물이다. 적정생육온도는 구간 24~27℃이고 야간온도 15~18℃이다. 30℃이상이면 꽃이 작아지고 꽃잎수가 줄어들어 퇴색하고 잎이 작아지며 엽색이 진해진다. 5℃정도이면 생육이 정지되고 0℃이하가 되면 낙엽이 지면서 휴면에 들어간다.	1
7	국화	개화형태에 따라 하나의 꽃대에 하나의 꽃을 피우는 스탠더드국화로 흔히 장례식이나 제례용으로 사용되는 흰색, 노란색이 국내에서는 유통되고 있으며, 하나의 꽃대에 여러 개의 꽃을 피우는 스프레이국화로 보통 꽃꽂이나 꽃다발용으로 사용되며 시장이나 화원에서 보이는 다양한 색들이 많이 재배되고 있다. 국화는 화색이 아주 다양하고 화형도 가장 흔하게 보이는 홑꽃형을 비롯하여 겹꽃형, 아네모네형, 탁구공같은 폼폰형, 가늘고 긴 거미줄 모양같은 스파이더형까지 다양함. 최근에는 실내인테리어용으로 사용되는 분화용(초장이 30cm미만) 국화들도 많이 선을 보이고 있다.\n추위에 아주 강하여 노지에서 월동이 가능한 여러해살이 화초로 낮의 길이가 12시간 이하상태에서 꽃눈분화가 이루어지는 특징을 가지고 있음.	2
8	동백	동백은 중국과 일본 그리고 우리나라에 자생하는 나무로서 다른 꽃들이 다지고 난 추운 계절에 홀로 피어 사랑을 듬뿍 받는 꽃이다. 겨울에는 수분을 도와줄 곤충이 없어 향기 보다는 강한 꽃의 색으로 동박새를 불러들여 꽃가루 받이를 한다. 주로 섬에 많은데 동으로는 울릉도, 서로는 대청도까지 올라간다. 육지에서는 충청남도 서천군 서면 마량리 춘장대 것이 가장 북쪽이고 내륙에서는 전북 고창의 선운사 경내에서 자라는 것들이 가장 북쪽에 위치한 것이다.	3
9	능소화	금등화(金藤花)라고도 한다. 중국이 원산지이다. 옛날에서는 능소화를 양반집 마당에만 심을 수 있었다는 이야기가 있어, 양반꽃이라고 부르기도 한다. 가지에 흡착근이 있어 벽에 붙어서 올라가고 길이가 10m에 달한다. 잎은 마주나고 홀수 1회 깃꼴겹잎이다. 작은잎은 7∼9개로 달걀 모양 또는 달걀 모양의 바소꼴이고 길이가 3∼6cm이며 끝이 점차 뾰족해지고 가장자리에는 톱니와 더불어 털이 있다.\n꽃은 8~9월경에 피고 가지 끝에 원추꽃차례를 이루며 5∼15개가 달린다. 꽃의 지름은 6∼8cm이고, 색은 귤색인데, 안쪽은 주황색이다. 꽃받침은 길이가 3cm이고 5개로 갈라지며, 갈라진 조각은 바소 모양이고 끝이 뾰족하다. 화관은 깔때기와 비슷한 종 모양이다.\n수술은 4개 중 2개가 길고, 암술은 1개이다. 열매는 삭과이고 네모지며 2개로 갈라지고 10월에 익는다. 중부 지방 이남의 절에서 심어 왔으며 관상용으로도 심는다.	1
4	튤립	남동 유럽과 중앙아시아 원산이다. 내한성 구근초로 가을에 심는다. 비늘줄기는 달걀 모양이고 원줄기는 곧게 서며 갈라지지 않는다. 잎은 밑에서부터 서로 계속 어긋나고 밑부분은 원줄기를 감싼다. 길이 20∼30cm로서 넓은 바소꼴이거나 타원 모양 바소꼴이고 가장자리는 물결 모양이며 안쪽으로 약간 말린다. 빛깔은 파란빛을 띤 녹색 바탕에 흰빛이 돌지만 뒷면은 짙다. 꽃은 4∼5월에 1개씩 위를 향하여 빨간색·노란색 등 여러 빛깔로 피고 길이 7cm 정도이며 넓은 종 모양이다. 화피는 위로 약간 퍼지지만 옆으로는 퍼지지 않으며 수술은 6개이고 암술은 2cm 정도로서 원기둥 모양이며 녹색이다. 열매는 삭과로서 7월에 익는다. 관상용 귀화식물로서 원예농가에서 재배한다.	0
10	백일홍	백일초라고도 한다. 높이 60∼90cm이다. 잎은 마주나고 달걀 모양이며 잎자루가 없고 가장자리는 밋밋하며 털이 나서 거칠다. 끝이 뾰족하며 밑은 심장 모양이다. 꽃은 6∼10월에 피고 두화(頭花)는 긴 꽃줄기 끝에 1개씩 달린다. 꽃은 지름 5∼15cm이고 빛깔은 녹색과 하늘색을 제외한 여러 가지이다.\n총포조각은 둥글고 끝이 둔하며 윗가장자리가 검은색이다. 종자로 번식하며 품종은 주로 꽃의 크기에 따라서 대륜(大輪)·중륜·소륜으로 나눈다. 열매는 수과로서 9월에 익는다. 씨를 심어 번식한다.\n멕시코 원산의 귀화식물이며 관상용으로 널리 재배한다. 백일홍이란 꽃이 100일 동안 붉게 핀다는 뜻이다. 꽃말(흰꽃)은 ‘순결’이다. 백일홍은 원래 잡초였으나 여러 화훼가들이 개량하여 현재의 모습이 되었다. 들꽃을 개량한 본보기의 하나이다. 배롱나무의 꽃을 백일홍이라고도 하는데 이것은 다른 식물이다.	1
11	진달래	참꽃 또는 두견화라고도 한다. 전국의 50~2,000m 높이의 산야에서 무리지어 자란다. 높이는 2∼3m이고 줄기 윗부분에서 많은 가지가 갈라지며, 작은가지는 연한 갈색이고 비늘조각이 있다. 잎은 어긋나고 긴 타원 모양의 바소꼴 또는 거꾸로 세운 바소꼴이며 길이가 4∼7cm이고 양끝이 좁으며 가장자리가 밋밋하다. 잎 표면에는 비늘 조각이 약간 있고, 뒷면에는 비늘 조각이 빽빽이 있으며 털이 없고, 잎자루는 길이가 6∼10mm이다.\n꽃은 4월에 잎보다 먼저 피고 가지 끝 부분의 곁눈에서 1개씩 나오지만 2∼5개가 모여 달리기도 한다. 화관은 벌어진 깔때기 모양이고 지름이 4∼5cm이며 붉은빛이 강한 자주색 또는 연한 붉은 색이고 겉에 털이 있으며 끝이 5개로 갈라진다. 수술은 10개이고 수술대 밑 부분에 흰색 털이 있으며, 암술은 1개이고 수술보다 훨씬 길다.\n열매는 삭과이고 길이 2cm의 원통 모양이며 끝 부분에 암술대가 남아 있다. 관상용으로 심기도 하고, 꽃은 이른봄에 꽃전을 만들어 먹거나 진달래술(두견주)을 담그기도 한다. 한방에서는 꽃을 영산홍(迎山紅)이라는 약재로 쓰는데, 해수·기관지염·감기로 인한 두통에 효과가 있고, 이뇨 작용이 있다.\n한국·일본·중국 등지에 분포한다. 흰색 꽃이 피는 것을 흰진달래(for. albiflorum)라고 하고, 작은 가지와 잎에 털이 있는 것을 털진달래(var. ciliatum)라고 하며 바닷가와 높은 산에서 흔히 자란다. 털진달래 중에서 흰색 꽃이 피는 것을 흰털진달래(for. alba)라고 하며 해안 근처에서 간혹 볼 수 있다. 잎이 둥글거나 넓은 타원 모양인 것을 왕진달래(var. latifolium)라고 한다.\n바닷가 근처에서 자라는 것 중에서 잎에 윤기가 있고 양면에 사마귀 같은 돌기가 있는 것을 반들진달래(var. maritimum)라고 하고, 열매가 보다 가늘고 긴 것을 한라진달래(var. taquetii)라고 한다. 키가 작고 꽃도 작으며 5개의 수술이 있는 것을 제주진달래(R.saisiuense)라고 하며 한라산 정상 근처에서 자란다.	0
12	시스터스	유럽 남부, 지중해 연안에 자라는 꽃잎이 크고 화려한 꽃으로, 우리나라에서는 볼 수 없는 꽃입니다. 세계에 약 120여종이 있으며, 푸른빛을 띤 자주색, 분홍색, 빨간색 꽃등이 있습니다.  6월에 여러 개가 분리한 가지에 작은 꽃이 뭉쳐서 피며 흰색 꽃이 섞이는 것도 있습니다.런던 교외에 있는 왕립 큐 식물원에는 성서의 식물이 많이 자라고 있어서 식물원내의 윌리암 템풀 가까이 군생하면서 그 아름다운 자태로 관광객들을 놀라게 한다고 합니다.	1
13	이끼 장미	채송화라고도 불리는 이끼 장미는 남아메리카 원산이며 관상용으로 심는다. 마당의 한켠이나 담벼락 아래 주로 심었으며 양지바른 곳에서 잘 자란다. 줄기는 붉은 빛을 띠고 가지가 많이 갈라져서 퍼지며 높이 20cm 내외이다. 잎은 육질로 어긋나고 가늘고 긴 원기둥 모양이고 잎겨드랑이에 흰색 털이 있다. 꽃은 가지 끝에 1~2송이씩 달리고 지름 2.5cm 정도로 2개의 꽃받침조각과 5개의 꽃잎이 있다. 꽃잎은 끝이 파지고 붉은색 ·노란색 ·흰색과 더불어 겹꽃도 있다.  \n꽃은 7∼10월에 피고 맑은날 낮에 피며 오후 2시경에 시든다. 꽃받침은 2개로 넓은 달걀 모양이고 막질이며, 꽃잎은 5개로 달걀을 거꾸로 세운 모양이고 끝이 파진다. 수술은 많으며 암술대에 5~9개의 암술머리가 있다. 열매는 삭과(?果)로 막질이고 9월에 성숙하며 중앙부에서 수평으로 갈라져 많은 종자가 나온다. 분이나 뜰에서 가꾸고 1번 심으면 종자가 떨어져서 매년 자란다. 전초를 반지련(半支蓮)이라고 하며, 주로 외용약으로 사용한다.	2
14	라벤더	지중해 연안이 원산지이다. 높이는 30∼60cm이고 정원에서 잘 가꾸면 90cm까지 자란다. 전체에 흰색 털이 있으며 줄기는 둔한 네모꼴이고 뭉쳐나며 밑 부분에서 가지가 많이 갈라진다. 잎은 돌려나거나 마주나고 바소 모양이며 길이가 4cm, 폭이 4∼6mm이다. 잎자루는 없으며 잎에 잔털이 있다.\n꽃은 6∼9월에 연한 보라색이나 흰색으로 피고 잎이 달리지 않은 긴 꽃대 끝에 수상꽃차례를 이루며 드문드문 달린다. 꽃·잎·줄기를 덮고 있는 털들 사이에 향기가 나오는 기름샘이 있다. 물이 잘 빠지는 모래땅에 약간의 자갈이 섞인 곳에서 잘 자라고 너무 비옥하지 않은 땅이 좋다. 햇빛을 잘 받는 남향과 습하지 않은 곳에서 잘 자란다.\n꽃과 식물체에서 향유(香油)를 채취하기 위하여 재배하고 관상용으로도 심는다. 향유는 향수와 화장품의 원료로 사용하고 요리의 향료로 사용할 뿐만 아니라 두통이나 신경안정을 치료하는 데도 쓴다. 라반둘라 오피시날리스(Lavandula officnalis) 또는 라반둘라 안구스티폴리아(Lavandula angustifolia) 종(種)이 주로 아로마서로피에 사용된다. 고대 로마 사람들은 욕조 안에 라벤더를 넣고 목욕을 했으며, 향기가 나도록 말린 꽃을 서랍이나 벽장 등에 넣었다고 한다. 그리고 영국의 엘리자베스 시대에 출판된 가사 책에는 살균·방충용으로 라벤더가 자주 등장하고, 엘리자베스 1세가 라벤더로 만든 사탕과자를 좋아했다는 기록이 있다.	1
15	벚나무	산지에서 널리 자란다. 높이 20m에 달하고 나무껍질이 옆으로 벗겨지며 검은 자갈색(紫褐色)이고 작은가지에 털이 없다. 잎은 어긋나고 달걀 모양 또는 달걀 모양의 바소꼴로 끝이 급하게 뾰족하며 밑은 둥글거나 넓은 예저(銳底)로 길이 6∼12cm이다. 잎 가장자리에 침 같은 겹톱니가 있다. \n털이 없고 처음에는 적갈색 또는 녹갈색이지만 완전히 자라면 앞면은 짙은 녹색, 뒷면은 다소 분백색(粉白色)이 도는 연한 녹색이 된다. 잎자루는 길이 2∼3cm이며 2∼4개의 꿀샘이 있다.\n꽃은 4∼5월에 분홍색 또는 흰색으로 피며 2∼5개가 산방상(揀房狀) 또는 총상(總狀)으로 달린다. 꽃자루에 포(苞)가 있으며 작은꽃자루와 꽃받침통 및 암술대에는 털이 없다. 열매는 둥글고 6∼7월에 적색에서 흑색으로 익으며 버찌라고 한다.	0
33	아네모네	알뿌리에서 7∼8개의 꽃줄기가 자라서 끝에 꽃이 1개씩 달린다. 잎은 밑에서는 3개씩 갈라진 깃꼴겹잎이고 윗부분에 달린 포는 잎처럼 생겼으나 대가 없으며 갈래조각에는 모두 톱니가 있다. \n꽃은 4∼5월에 피는데, 지름 6∼7cm이고 홑꽃과 여러 겹꽃이 있으며, 빨간색·흰색·분홍색·하늘색·노란색·자주색 등으로 핀다. 6월에 잎이 누렇게 되면 알뿌리를 캐어서 그늘에 말려 저장하였다가, 9∼10월 기름진 중성 토양에 깊이 심는다. 번식은 알뿌리나누기나 종자로 한다.\n북반구에 약 90종의 원종이 있다. 대표적인 아네모네 코로나리아(A. coronaria)는 지중해 연안 원산이며, 햇볕이 들고 통풍이 잘 되는 곳에서 잘 자란다. 가을에 심으며 이른봄에 꽃줄기가 나와 지름 6∼7cm의 꽃이 달린다.	0
16	개나리	연교·신리화라고도 하며, 북한에서는 개나리꽃나무라고 부른다. 산기슭 양지에서 많이 자란다. 높이 약 3m이다. 가지 끝이 밑으로 처지며, 잔가지는 처음에는 녹색이지만 점차 회갈색으로 변하고 껍질눈[皮目]이 뚜렷하게 나타난다. 잎은 마주나고 타원형이며 톱니가 있고 길이 3∼12cm이다. 잎 앞면은 짙은 녹색이고 뒷면은 황록색인데 양쪽 모두 털이 없다. 잎자루는 길이 1∼2cm이다.\n4월에 잎겨드랑이에서 노란색 꽃이 1∼3개씩 피며 꽃자루는 짧다. 꽃받침은 4갈래이며 녹색이다. 화관은 길이 2.5cm 정도이고 끝이 4갈래로 깊게 갈라지는데 갈라진 조각은 긴 타원형이다. 수술은 2개이고 화관에 붙어 있으며 암술은 1개이다. 암술대가 수술보다 위로 솟은 것은 암꽃이고, 암술대가 짧아 수술 밑에 숨은 것은 수꽃이다.\n열매는 9월에 삭과로 달리는데, 길이는 1.5∼2cm이고 달걀 모양이다. 번식은 종자로도 하지만 가지를 휘묻이하거나 꺾꽂이로 한다. 병충해와 추위에 잘 견디므로 흔히 관상용·생울타리용으로 심는다.	0
17	라일락	유럽 원산으로 전국에 심어 기르는 낙엽 작은키나무이다. 줄기는 가지가 갈라지고 높이 3-7m이다. 잎자루는 길이 1.5-3.0cm, 털이 없다. 잎은 마주나며, 난형 또는 난상 타원형, 길이 6-12cm, 폭 5-8cm, 가장자리가 밋밋하다. 잎밑은 보통 둥글지만 드물게 넓은 쐐기 모양 또는 얕은 심장 모양이다. 꽃은 4-5월에 피고 묵은 가지에서 난 길이 15-20cm의 원추꽃차례에 피며, 지름 8-12mm, 보라색 또는 연한 보라색을 띠고 향기가 진하다. 화관은 깔때기 모양으로 끝이 4갈래로 갈라진다. 열매는 삭과이며, 타원형, 길이 1.2-1.5cm이다. 세계적으로 많은 품종이 개발되어 있다.	0
18	해바라기	향일화(向日花)·산자연·조일화(朝日花)라고도 한다. 아무데서나 잘 자라지만, 특히 양지바른 곳에서 잘 자란다. 중앙아메리카 원산이며 널리 심고 있다. 높이 2m 내외로 자라고 억센 털이 있다. 잎은 어긋나고 잎자루가 길며 심장형 달걀 모양이고 가장자리에 톱니가 있다. \n꽃은 8∼9월에 피고 원줄기가 가지 끝에 1개씩 달려서 옆으로 처진다. 꽃은 지름 8∼60cm이다. 설상화는 노란색이고 중성이며, 관상화는 갈색 또는 노란색이고 양성이다. 열매는 10월에 익는데, 2개의 능선이 있고 달걀을 거꾸로 세운 듯한 모양으로 길이 1cm 내외이며 회색 바탕에 검은 줄이 있다. 종자는 20∼30％의 기름을 포함하며 식용한다. \n관상용으로 심으며, 줄기 속을 약재로 이용하는데 이뇨·진해·지혈에 사용한다. 품종에는 관상용과 채종용이 있다. 채종용은 특히 러시아에서 많이 심고 있으며, 유럽의 중부와 동부, 인도, 페루, 중국 북부에서도 많이 심는다. 찌꺼기는 사료로 이용한다.\n해바라기란 중국 이름인 향일규(向日葵)를 번역한 것이며, 해를 따라 도는 것으로 오인한 데서 붙여진 것이다. 콜럼버스가 아메리카대륙을 발견한 다음 유럽에 알려졌으며 태양의 꽃또는 황금꽃이라고 부르게 되었다. 해바라기는 페루의 국화(國花)이고 미국 캔자스주(州)의 주화(州花)이다. 영어의 sunflower는 속명 헬리안투스(Helianthus)를 번역한 것이다.	1
19	목화	면화(綿花)·초면(草綿)이라고도 한다. 열대지방 원산이 많으나, 섬유작물로서 온대지방에서도 널리 재배하고 있다. 보통 한해살이풀이지만 작은 관목형태도 있다. 온대에서는 90cm 내외, 열대에서는 2m까지 자라기도 한다. 뿌리는 곧게 뻗으며, 줄기가 곧게 자라면서 가지가 갈라진다. 잎은 어긋나고 3∼5개가 손바닥 모양으로 갈라지며, 턱잎은 세모꼴의 바소꼴이다. 꽃은 백색 또는 황색이고, 지름 4cm 내외다. 5개의 꽃잎은 나선상으로 말린다. 꽃받침 밑에 톱니가 있는 3개의 포(苞)가 있고, 안쪽에 작은 꽃받침이 있다. 1개의 암술과 약 130개의 수술이 있다. 열매는 삭과(?果)로 달걀 모양이며 끝이 뾰족하다. 삭과가 성숙하면 긴 솜털이 달린 종자가 나오는데, 털은 모아서 솜을 만들고 종자는 기름을 짠다.	1
20	접시꽃	보통 2년생이며 때로는 다년생 숙근 초화로 높이는 1~3m 정도 자란다. 줄기는 단단하며 직립한다. 전주에 잔털이 밀생해 있다. 잎은 대형의 심장형이고 긴 엽병이 있고 일반적으로 5~7장으로 깊이 갈라져 있고 둔한 거치가 있다. 꽃은 줄기 중부 이상의 엽액마다 1~2송이가 피며 원추화서는 1m 이상으로 아래서부터 위로 피어 올라간다. 꽃의 직경은 5~7㎝ 정도고 꽃잎 가장자리는 파상 또는 둔한 거치가 있다. 꽃은 흰색, 적색, 연황색, 연홍색, 주홍색, 적자색, 흑홍색, 흑갈색이 있고 홑꽃과 겹꽃이 있다. 개화기는 6~8월에 피며 뿌리는 약용한다. 원산은 북반구 온대에 약 12~15종이 있다.	1
21	데이지	유럽 원산이다. 수염뿌리가 사방으로 퍼진다. 잎은 뿌리에서 나오고 달걀을 거꾸로 세운 듯한 주걱 모양이며 밑쪽이 밑으로 흘러 잎자루 윗부분의 날개로 된다. 잎의 가장자리가 밋밋하거나 약간 톱니가 있다.\n꽃은 봄부터 가을까지 피며 흰색, 연한 홍색, 홍자색이다. 뿌리에서 꽃자루가 나오는데 길이 6∼9cm이고 그 끝에 1개의 두화(頭花)가 달리며 밤에는 오므라든다. 두화는 설상화가 1줄인 것부터 전체가 설상화로 된 것 등 변종에 따라 다양하다.\n유럽에서는 잎을 식용한다. 종자로 번식시키고 가을이나 봄에 관상화로 널리 심는다. 한국의 주문진·속초·강릉 일대의 동해안에서도 볼 수 있다.	0
22	프리지아	프리지아는 재배가 용이하고, 촉성이 가능하며, 정식에서 절화까지의 생육일수가 60여일 정도로 짧기 때문에 다른 작물과의 윤작으로 시설활용도를 높일 수 있는 장점이 있는 반면 우리나라 고온기인 여름재배는 어렵다. 가을에 정식한 구근은 온난한 지방에서는 생육을 계속하여 곧 꽃눈분화하고 봄에 온도가 올라감에 따라 개화한다.\n프리지아는 남아프리카 원산의 비내한성 춘식구근으로서 고유특성인 은은한 향기가 있는 대표적인 절화이다. 프리지아 구근은 원추형으로 줄기가 변하여 몇 개의 마디를 지닌 구경(Corm)에 속한다.	0
31	토끼풀	토끼풀은 콩과 식물의 특징인 질소고정 식물이다.\n식물 생장에 필요한 질소를 공급해서 토양을 비옥하게 만드는 역할을 한다. 토끼풀의 뿌리에 공생하는 뿌리혹박테리아는 질소를 고정해 식물의 생장과 건강을 돕는데 토끼풀이 사용하는 질소는 그 일부에 불과하다. 따라서 토끼풀이 사용하고 남은 질소가 토양에 남아 있어 다른 식물이 이용할 수 있게 된다.\n잎은 대부분 3개이지만 간혹 4-5개까지 나타나기도 한다.네잎클로버는 행운을 가져온다는 속설이 있어 인기가 높다. 네잎클로버는 사실 돌연변이로 토양이나 주변 환경에 의해 나타나는 현상인데 드물게 나타나므로 행운의 상징으로 여기는 것 같다.\n토끼풀은 줄기로 번식을 하지만 다른 쌍떡잎식물처럼 씨앗으로 번식 하기도 한다.	1
23	수선화	설중화·수선(水仙)이라고도 한다. 지중해 연안 원산이다. 비늘줄기는 넓은 달걀 모양이며 껍질은 검은색이다. 잎은 늦가을에 자라기 시작하고 줄 모양이며 길이 20∼40cm, 너비 8∼15mm로서 끝이 둔하고 녹색빛을 띤 흰색이다. \n꽃은 12∼3월에 피며 통부(筒部)는 길이 18∼20mm, 꽃자루는 높이 20∼40cm이다. 포는 막질이며 꽃봉오리를 감싸고 꽃자루 끝에 5∼6개의 꽃이 옆을 향하여 핀다. 화피갈래조각은 6개이고 흰색이며, 부화관은 높이 4mm 정도로서 노란색이다. 6개의 수술은 부화관 밑에 달리고, 암술은 열매를 맺지 못하며 비늘줄기로 번식한다.\n수선화의 생즙을 갈아 부스럼을 치료하고, 꽃은 향유를 만들어 풍을 제거한다. 비늘줄기는 거담·백일해 등에 약용한다. 수선이란 중국명이며 하늘에 있는 것을 천선(天仙), 땅에 있는 것을 지선(地仙), 그리고 물에 있는 것을 수선이라고 하였다. \n수선화의 속명인 나르키수스(Narcissus)는 그리스 신화에 나오는 나르시스(나르키소스)라는 청년의 이름에서 유래한다. 나르시스는 연못 속에 비친 자기 얼굴의 아름다움에 반해서 물속에 빠져 죽었는데, 그곳에서 수선화가 피었다고 한다. 그래서 꽃말은 나르시스라는 미소년의 전설에서 자기주의(自己主義) 또는 자기애(自己愛)를 뜻하게 되었다.	0
24	꽃담배	꽃은 원줄기와 가지 끝에 달린다. 꽃받침은 녹색이고 길이 15~20mm로서 맥이 뚜렷하며 5갈래로 갈라지고 열편은 맥의 연장이며 길이 8mm 정도로서 가장자리가 흰색 막질이다. 꽃부리는 길이 7~10cm로서 판통이 길고 꽃받침과 더불어 겉에 샘털이 있으며 윗부분이 굵고 가장자리가 얕게 5개로 갈라진다. 수술은 5개이며 수술대는 판통의 중앙까지 붙어 있고 꽃밥은 후부喉部에서 나타나며 암술대보다 다소 짧다.	1
25	쟈스민	쌍떡잎식물 용담목 물푸레나무과 영춘화속에 속하는 식물의 총칭. 원산지는 히말라야. 이 속의 꽃에서 채취한 향료명을 가리키기도 한다. 상록관목이며, 열대와 아열대에 200여 종이 분포하고 한국에 자생종은 없으나 영춘화(J. nudiflorum)가 서울 근처에서 월동한다. 소형화(J. officinale var. grandiflorum)는 히말라야 원산이며 흰색 꽃이 피고 향료를 채취한다. 청향등(J. paniculatum)으로 재스민차를 만든다.	0
26	박하	야식향(夜息香)·번하채·인단초(仁丹草)·구박하(歐薄荷)라고도 한다. 습기가 있는 들에서 자란다. 높이 60∼100cm이다. 줄기는 단면이 사각형이고 표면에 털이 있다. 잎은 자루가 있는 홑잎으로 마주나고 가장자리는 톱니 모양이다. 잎 표면에는 기름샘이 있어 여기서 기름을 분비하는데 정유(精油)의 대부분은 이 기름샘에 저장된다. \n여름에서 가을에 줄기의 위쪽 잎겨드랑이에 엷은 보라색의 작은 꽃이 이삭 모양으로 달린다. 수술이 4개이고 1개의 암술은 끝이 2개로 갈라지며 씨방은 4실이다. 꽃은 주로 오전 중에 피는데 암술은 꽃이 핀 후 3~4일, 수술은 2~3일 만에 수정된다. 종자는 달걀 모양의 연한 갈색으로 가볍고 작으며 20 → 30 → 15℃의 변온에서 발아가 잘 된다.박하유의 주성분은 멘톨이며, 이 멘톨은 도포제(塗布劑)·진통제·흥분제·건위제·구충제 등에 약용하거나 치약·잼·사탕·화장품·담배 등에 청량제나 향료로 쓴다.	1
27	노란별수선화	꽃이 노란색의 별 모양이고 땅 속의 덩이줄기가 수선화과 식물의 비늘줄기를 닮았다는 뜻에서 붙여진 이름이다. 여러해살이풀이며, 높이는 5~50㎝이다. 땅 속에 구형 또는 두꺼운 원통형의 덩이줄기가 있고, 그 위에 방사상으로 뻗은 뿌리와 수염뿌리가 있다.\n잎은 선형이고 횡단면이 V자 모양이며, 뚜렷한 잎맥이 있고 끝이 뾰족하다. 기다란 흰색 털이 많아서 꽃이 없을 때는 사초과 식물처럼 보인다. 길이는 5~50㎝, 폭은 0.2~0.6㎝이다.\n꽃은 5~6월에 잎 사이에서 가늘게 나오는 1~4개의 꽃줄기 끝에 노란색으로 1~3개가 핀다. 포는 2개이고 선형이다. 화피조각은 6개이고 긴 타원상의 피침형이며 수평으로 펼쳐진다. 대개 오전에 피었다가 오후 1시 이후면 오므라든다. 맑은 날보다 흐린 날에 더 오랫동안 꽃을 볼 수 있다. 수술은 6개이고 화피조각의 안쪽에 달린다. 암술대는 1개이다.\n열매는 여러 개의 방에서 튀어나오는 삭과(?果)이고 긴 타원형이며 긴 털이 있다. 씨는 표면에 돌기가 빽빽이 덮인다.	1
28	금잔화	유럽 원산의 한해살이풀로 전국 각지에서 관상용으로 심어 기른다. 전체에 짧은 털이 난다. 줄기는 곧추서고 높이 20-50cm이며, 밑에서부터 가지가 갈라진다. 뿌리잎은 모여 나며, 긴 난형이다. 줄기잎은 어긋나며, 넓은 피침형 또는 긴 타원형으로 아래쪽이 줄기를 조금 감싼다. 잎 가장자리에 톱니가 있으며, 잎자루는 없다. 꽃은 6-9월에 줄기나 가지 끝에 머리모양꽃차례가 1개씩 달리며, 지름 1.5-2.0cm이다. 머리모양꽃차례의 가장자리에는 붉은빛이 도는 노란색의 혀모양꽃이 달리며, 안쪽에는 노란색의 관모양꽃이 배열한다. 열매는 겉에 가시 모양의 돌기가 난다. 식물체를 약용 또는 식용색소용으로 쓴다.	1
29	앵초	앵초과에 속하는 다년생 초본식물. 학명은 Primula sieboldi E. MORR이다. 우리나라의 각처에서 널리 자라고 있는 식물로 잎과 줄기에는 흰 털이 많이 있으며, 꽃은 7월에 홍자색으로 핀다. 열매는 삭과로서 둥글고 원추형이며, 익으면 갈라진다. 어린 싹은 나물로 먹고 꽃이 아름다워 관상용으로 기른다.	1
30	미모사	신경초, 잠풀이라고도 한다. 브라질이 원산지인 관상식물로 원산지에서는 다년초이나 한국에서는 일년초이다. 전체에 잔털과 가시가 있고 높이가 30cm에 달한다. 잎은 어긋나고 긴 잎자루가 있으며 보통 4장의 깃꼴겹잎이 손바닥 모양으로 배열한다. 작은잎은 줄 모양이고 가장자리가 밋밋하며 턱잎이 있다. 꽃은 7∼8월에 연한 붉은색으로 피고 꽃대 끝에 두상꽃차례를 이루며 모여 달린다. 꽃받침은 뚜렷하지 않으며, 꽃잎은 4개로 갈라진다. 수술은 4개이고 길게 밖으로 나오며, 암술은 1개이고 암술대는 실 모양이며 길다.\n열매는 협과이고 마디가 있으며 겉에 털이 있고 3개의 종자가 들어 있다. 잎을 건드리면 밑으로 처지고 작은잎이 오므라들어 시든 것처럼 보인다. 밤에도 잎이 처지고 오므라든다. 한방에서 뿌리를 제외한 식물체 전부를 함수초(含羞草)라는 약재로 쓰는데, 장염·위염·신경쇠약으로 인한 불면증·신경과민으로 인한 안구충혈과 동통에 효과가 있고, 대상포진에 짓찧어 환부에 붙인다.	1
32	달맞이꽃	바늘꽃과에 속하는 2년생 초본식물. 꽃이 밤에 달을 맞이하며 피는 습성에서 붙여진 이름이다. 남아메리카 원산의 귀화식물로, 높이 50∼90㎝로 곧추 자라며 잔털이 빽빽하게 난다. 줄기의 잎은 어긋나고 넓은 선형이다. 열매는 곤봉모양의 삭과이며, 종자의 기름은 당뇨에 사용한다.	1
34	자목련	중국에서 들어온 귀화식물이다. 관목상인 것이 많으며 관상용으로 심는다. 높이 15m에 달하고 가지가 많이 갈라진다. 잎은 마주나고 달걀을 거꾸로 세운 듯한 모양이며 가장자리가 밋밋하다. 양면에 털이 있으나 점차 없어지고 잎자루는 길이 7∼15mm이다. \n꽃은 4월에 잎보다 먼저 피고 검은 자주색이다. 꽃받침조각은 녹색이며 3개이다. 꽃잎은 6개이고 길이 10cm 내외이며 햇빛을 충분히 받았을 때 활짝 핀다. 꽃잎의 겉은 짙은 자주색이며 안쪽은 연한 자주색이다. 수술과 암술은 많다. \n열매는 달걀 모양 타원형으로 많은 골돌과로 되고 10월에 갈색으로 익으며 빨간 종자가 실에 매달린다. 꽃잎의 겉면이 연한 홍색빛을 띤 자주색이고 안쪽이 흰색인 것을 자주목련(M. denudata var. purpurascens)이라고 한다. 정원수로 가꾼다.	0
35	복숭아꽃	장미과에 속하며 대개 4~5월에 잎보다 꽃이 먼저 핀다. 복숭아는 식용, 관상용, 약용 등 두루 쓰이며 특히 약재로 많이 사용되는 씨는 편도유라는 담황색의 지방분을 채취하여 비누 제조에 사용되기도 한다.	0
36	나팔꽃	학명은 Pharbitis nil CHOIS.이다. 중국에서 관상용 또는 약용으로 전래되어 우리나라에 널리 재배되고 있다. 잎은 어긋나고 줄기는 덩굴지며 감아 올라가면서 길이 3m 정도로 자라고 밑을 향한 털이 있다. 꽃은 통꽃이며 나팔모양이고, 청자색·흰색 또는 분홍색으로 여름철에 핀다.\n수술은 5개, 암술은 1개이며, 열매는 둥근 삭과(?果: 여러 개의 씨방으로 된 열매)로 된다. 삭과는 익어서 세 갈래로 갈라지고 보통 6개의 세모진 씨가 들어 있다. 씨는 견우자(牽牛子)라 하여 예로부터 준하제(峻下劑) 또는 이뇨제(利尿劑)로 쓰여 왔다. 꽃은 아침 일찍 피는데, 야생하는 메꽃은 꽃모양이 나팔꽃과 비슷하나 대낮에 꽃이 핀다.	1
37	매화	학명은 Prunus mume S. et Z.이다. 높이는 5m 정도 자라고, 가지는 초록색이며 잔털이 돋는 것도 있다. 잎은 어긋나고 난형 또는 넓은 난형으로 끝이 뾰족하고 가장자리에 예리한 잔 톱니가 있다. 꽃은 4월에 잎보다 먼저 피며, 연한 홍색이 도는 흰빛으로 향기가 강하다. 꽃잎은 다섯 개인 것이 기본형이지만 그 이상인 것도 있다.\n열매는 살구 비슷하게 생기고 녹색이며 털로 덮였으나, 7월이 되면 황색으로 되고 매우 시다. 홍색으로 익기 전에 따서 소금에 절였다가 햇볕에 말린 것은 백매(白梅), 소금에 절이지 않고 볏짚을 태워 연기를 쐬면서 말린 것은 오매(烏梅)라 하여 약용하였다.	0
38	겹벚꽃	높이는 10m이다. 일본에서 산벚나무를 육종(育種)해 만든 품종이다. 햇볕이 잘 들고 비교적 습기가 많은 모래질 토양에서 잘 자란다. 잎은 어긋나고, 생김새는 달걀을 거꾸로 세워 놓은 듯한 타원형이다. 어린 잎은 붉은 갈색이지만 커 가면서 점점 녹색을 띤다. 길이는 8~12㎝이고, 끝이 뾰족하다.\n꽃은 다른 벚나무 종류보다 늦게 펴서 5월이 되어야 핀다. 흰색이 섞인 분홍색 꽃이 겹꽃으로 피는데, 씨방과 꽃잎이 변해 꽃이 되기 때문에 열매는 맺지 못한다. 즉 1개의 수술과 1개의 암술이 있지만, 암술이 퇴화되어 꽃잎으로 변하기 때문에 열매를 맺지 못하는 것이다. 꽃은 갈수록 짙은 분홍색으로 변해 절정기에 달하면 나무 전체가 온통 분홍빛으로 물들어 장관을 연출한다.\n번식은 벚나무를 대목(臺木:접붙일 때 바탕이 되는 뿌리 달린 나무)으로 삼아 접붙이기를 한다. 나무의 생김새[樹形]가 아름답고 꽃이 보기 좋아 관상용으로 많이 심는다. 추위에 약하기 때문에 중부 이북에서는 잘 자라지 않고, 병충해에 약해 수명도 짧다.	0
39	자운영	연화초(蓮花草)·홍화채(紅花菜)·쇄미제(碎米濟)·야화생이라고도 한다. 중국 원산으로 논·밭·풀밭 등에서 자란다. 밑에서 가지가 많이 갈라져 옆으로 자라다가 곧게 서서 높이 10∼25cm가 된다. 줄기는 사각형이다. 잎은 1회깃꼴겹잎이고 작은잎은 9∼11개이며 달걀을 거꾸로 세운 듯한 모양 또는 타원형이고 끝이 둥글거나 파진다. 잎자루는 길며 턱잎은 달걀 모양이고 끝이 뾰족하다. \n꽃은 4∼5월에 피고 길이 10∼20cm의 꽃줄기 끝에 7∼10개가 산형(傘形)으로 달리며 홍색빛을 띤 자주색이다. 꽃받침은 흰색 털이 드문드문 있으며 5개의 톱니가 있고 수술은 10개 중 9개가 서로 달라붙으며 씨방은 가늘며 길다.\n열매는 협과로 꼭지가 짧고 긴 타원형이며 6월에 익는다. 꼬투리는 검게 익고 길이 2∼2.5cm로서 2실이다. 꼬투리 속에 종자가 2∼5개 들어 있고 납작하며 노란색이다. 어린 순을 나물로 하며, 풀 전체를 해열·해독·종기·이뇨에 약용한다. 뿌리에 뿌리혹박테리아가 붙어서 공중질소를 고정시키며 꽃은 중요한 밀원식물이다. 남쪽에서 녹비로 재배한다.	0
40	과꽃	Callistephus는 그리스어의 kallos(아름답다)와 stephos(화관)의 합성어로, 관모가 겹으로 발생하여 아름답다라는 데서 이름이 붙여짐.\n꽃색은 홍색, 적색, 자색, 백색, 청색이 있으며, 초장은 60cm에서 120cm까지도 있으며 최근에는 키가 작은 25-40cm미만의 품종도 있다. 초장에 따라 고성종, 중성종, 왜성종으로 구분되며, 초형에 따라서는 주지의 중간부위부터 위로 올라가면서 곁가지가 나오는 형으로 대부분 절화용 품종이며, 주지의 밑부분에서부터 곁가지가 나오는 분화 및 화단용이 있다. 꽃잎형태는 평평한 모습인 평상, 빨대와 같이 관모양이 모여진 관상, 뾰족한 바늘과 같은 침상 등이 있으며 꽃잎이 한겹인 홑꽃, 여러겹인 겹꽃, 반정도의 비율을 가지는 반겹꽃도 있다.\n북한의 함경남북도와 중국 북부지역에 자생하며, 속명이 오래전에는 Aster였으나 현재는 Callistephus로 부르고 있는 일년초 국화과 초본이다. 1년생 초화중 가장 이어짓기를 싫어하고 연작장애가 있어 주기적으로 돌려짓기가 필요하다. 프랑스, 독일, 영국 등 유럽에서 품종이 개량된 이후 미국, 일본등에서도 화색이나 화형이 다양한 절화품종이 개발되어 국내에서 볼수 있는 과꽃은 대부분 일본에서 개량된 것이 많다.	1
41	알로에	노회, 또는 나무노회라고도 하고,  알로에속(Aloe)에 속하는 식물 전체를 가리키거나 그 한 종을 가리킨다. 아프리카가 원산지이고, 전세계에 약 300종이 있다. 관엽식물로 온실에서 재배하거나 약으로 쓰려고 가정에서 기르기도 한다. \n잎은 뿌리와 줄기에 달리며 어긋나고 반원기둥 모양이며 잎 가장자리에 날카로운 톱니 모양의 가시가 있고 밑 부분은 넓어서 줄기를 감싸며 로제트 모양으로 퍼진다. 잎 뒷면은 둥글고 앞면은 약간 들어간다.꽃은 여름에 귤색으로 피고 총상꽃차례를 이루며 밑을 향해 달린다. 화피 조각은 6개이고, 수술도 6개이며, 암술은 1개이다. 열매는 삭과이고 3개로 갈라진다. 알로에란 아라비아어로 ‘맛이 쓰다’는 뜻으로 붙여진 이름이고, 노회란 Aloe의‘로에’를 한자로 바꾼 이름이다.\n제2차 세계대전 직후부터 알로에의 성분이 속속 밝혀지고 있다. 지금까지 밝혀진 결과의 의하면, 세균과 곰팡이에 대한 살균력이 있고 독소를 중화하는 알로에틴이 들어 있으며, 궤양에 효과가 있는 알로에우르신과 항암효과가 있는 알로미틴이 들어 있다고 한다.\n이 밖에도 스테로이드·아미노산·사포닌·항생물질·상처치유 호르몬·무기질 등 다양한 성분이 들어 있다. 알로에는 과로로 인한 피로 회복과 과음으로 인한 숙취 해소 등에 효과가 있고, 알로에의 잎을 잘라두면 유난히 쓴 황색 물질이 흘러나오는데, 이것은 변비에 특히 효과가 있다. 민간에서는 알로에 잎의 액즙을 위장병에 내복하고 외상이나 화상 등에도 이용한다. 또한 건성 피부와 지성 피부를 중성화시키고 피부 보습 효과가 있어 화장품 원료로도 쓰인다.	3
42	제라늄	다양하고 화려한 꽃색으로 꽃의 관상기간이 길어 정원의 화단, 아파트 베란다, 벽장식으로 사용되며 분화, 플라워박스, 행잉바스켓 등으로 다양하게 이용되고 있다. 최근에는 절화로도 이용되고 있다.비내한성의 다년초로 남아프리카에 자생하는 온대식물이다. 약광, 건조 등 불량환경에 대한 적응력이 강하고 병충해에 강하기 때문에 최근 정원화단 및 실내환경 조성 등에 인기가 높다.	0
43	샤프란	온난하고 비가 적은 곳에서 잘 자란다 . 높이 약 15cm이다. 알뿌리는 지름 3cm로 납작한 공 모양이다. 잎은 알뿌리 끝에 모여나며 줄 모양이고 꽃이 진 다음 자란다. 끝이 점차 뾰족해진다. 꽃은 깔때기 모양이며 10~11월에 자주색으로 핀다. 새잎 사이에서 나온 꽃줄기 끝에 1개가 달린다. 꽃줄기는 짧고 밑동이 잎집으로 싸인다. 화피와 수술은 6개씩이고 암술은 1개이다. 암술대는 3개로 갈라지고 붉은빛이 돌며 암술머리는 육질이다. 유럽남부와 소아시아 원산이다. 원예상으로는 꽃이 봄에 피는 종과 가을에 피는 종으로 크게 나누는데, 봄에 피는 종을 크로커스, 가을에 피는 종을 사프란이라고 하여 구분 하기도 한다.	2
44	은방울꽃	오월화·녹령초·둥구리아싹 등이라고도 한다. 산지에서 자란다. 높이는 25∼35cm이다. 땅속줄기가 옆으로 길게 뻗으면서 군데군데에서 새순이 나오고 수염뿌리가 사방으로 퍼진다. 밑부분에서는 칼집 모양의 잎이 있고 그 가운데에서 2개의 잎이 나와 마주 감싼다. 잎몸은 긴 타원형이거나 달걀 모양 타원형이며 길이 12∼18cm, 너비 3∼7cm이다. 끝이 뾰족하고 가장자리가 밋밋하며 잎자루가 길다. 꽃은 5∼6월에 흰색으로 피는데, 길이 6∼8mm이고 종 모양이다. 꽃줄기는 잎이 나온 바로 밑에서 나오며, 길이 5∼10cm의 총상꽃차례에 10송이 정도가 아래를 향하여 핀다. 포는 막질(膜質:얇은 종이처럼 반투명한 것)이고 넓은 줄 모양이며, 작은꽃자루의 길이와 비슷하거나 짧다. 화피는 6장이고 수술은 6개로서 화관 밑에 달린다. 씨방은 달걀 모양이며 3실이고 암술대는 짧다. 열매는 장과로서 둥글며 7월에 붉게 익는다. 번식은 포기나누기로 한다.\n관상초로 심으며 어린 잎은 식용한다. 향기가 은은하여 고급향수를 만드는 재료로 쓰기도 한다. 한방에서는 강심·이뇨 등의 효능이 있어 심장쇠약·부종·타박상 등에 약재로 쓴다. 꽃말은 ‘순결, 다시 찾은 행복’이다. 한국·중국·동시베리아·일본에 분포한다.	0
45	다알리아	멕시코가 원산지이며 관상용으로 흔히 심는다. 고구마처럼 생긴 뿌리로 번식한다. 줄기는 원기둥 모양이고 가지를 잘 치며 털이 없고 녹색을 띠며 높이가 1.5∼2m이다. 잎은 마주나고 1∼2회 깃꼴로 갈라진다. 작은잎은 달걀 모양이고 가장자리에 톱니가 있으며 표면은 짙은 녹색이고 뒷면은 흰빛을 띠고 잎자루에 다소 날개가 있다. 꽃은 7∼8월에 흰빛·붉은빛·노란빛 등으로 피고 줄기와 가지 끝에 두상화(頭狀花:꽃대 끝에 꽃자루가 없는 많은 작은 꽃이 모여 피어 머리 모양을 이룬 꽃)가 각각 1개씩 옆을 향해 달린다. 두상화의 지름은 5∼7.5cm이지만 더 큰 것도 있다. 총포의 조각은 6∼7개이고 잎 모양이다. 열매는 10월에 익는다. 세계 각국에서 원예용으로 재배하고 있으며 원예 품종은 300종류가 넘는다.	1
46	봉선화	봉선화과에 속하는 1년생 초본식물. 봉숭아라고도 한다. 60㎝ 정도로 자라는데, 줄기에 털이 없고 밑부분의 마디가 두드러진다. 우리나라 어디에서나 볼 수 있는 꽃이며, 일제시대에는 우리 조상들이 망국의 한을 노래하던 꽃이기도 하다. 꽃잎에 괭이밥의 잎을 섞고, 백반 또는 소금을 약간 넣고 빻아서 손톱에 물을 들인다.	1
47	에리카	상록 소관목이다. erica는 그리스어의 ereike(깨뜨리다)라는 뜻에서 유래된 말로 본래의 의미는 밝지 못하다는 뜻이다. 높이 15∼30cm이며 3m에 달하는 것도 있다. 줄기는 많은 잔가지로 분지하며 떨기 모양으로 수부룩한 것과 직립하는 것 등이 있다. 잎은 3∼6개가 돌려나며 선형 또는 달걀 모양으로 두껍고 뒷면에 깊은 홈이 1줄 있다. 가지 끝에 여러 개의 꽃이 돌려나거나 많은 작은 꽃이 총상 또는 산방상으로 달린다. 꽃받침은 종 모양으로 끝이 4개로 갈라진다. 화관은 통 모양 또는 종 모양으로 끝이 4개로 갈라진다.	0
48	엉겅퀴	가시나물이라고도 한다. 산이나 들에서 자란다. 줄기는 곧게 서고 높이 50∼100cm이고 전체에 흰 털과 더불어 거미줄 같은 털이 있다.\n뿌리잎은 꽃필 때까지 남아 있고 줄기잎보다 크다. 줄기잎은 바소꼴모양의 타원형으로 깃처럼 갈라지고 밑은 원대를 감싸며 갈라진 가장자리가 다시 갈라지고 깊이 패어 들어간 모양의 톱니와 더불어 가시가 있다. 꽃은 6∼8월에 피고 자주색에서 적색이다. 가지와 줄기 끝에 두화가 달린다. 총포의 포조각은 7∼8열로 배열하고 안쪽일수록 길어진다. 관모는 길이 16∼19mm이다. 연한 식물체를 나물로 하고 성숙한 뿌리를 약용으로 한다. 열매는 수과로 3.5∼4mm이다.\n한국·일본·중국 북동부 및 우수리에 분포한다. 잎이 좁고 녹색이며 가시가 다소 많은 것을 좁은잎엉겅퀴, 잎이 다닥다닥 달리고 보다 가시가 많은 것을 가시엉겅퀴, 백색 꽃이 피는 것을 흰가시엉겅퀴라고 한다.	1
50	연령초	숲속에서 자란다. 영문명으로 Birthroot라고도 한다. 약으로 썼을 때 수명을 연장하는 풀이라는 뜻으로 연령초라 한다. 전체 모양이 특이한데, 줄기 하나에 넓은 잎 세 장이 잎자루도 없이 시원하게 붙고, 그 위쪽 가운데에서 꽃이 핀다. 꽃잎도 세 장이다.	0
51	무궁화	무궁화는 낙엽 관목으로서 여러 품종이 있고 높이가 3-4m에 달하며, 어린 가지에 털이 많으나 점차 없어진다. 무궁화는 정원에서 재배가 쉽고 씨로 번식이 가능하지만 꺽꽂이로 번식되므로 형질을 변형시키지 않고 유지하는 것이 쉽다. 잎은 어긋나며 달걀모양이고 대개 3개로 갈라지고 가장자리에는 톱니가 있다.\n또한 무궁화는 우리나라를 상징하는 꽃이다. 무궁화를 나라꽃으로 선정한 것은 1896년 독립문 주춧돌을 놓는 의식 때 애국가 후렴에 ‘무궁화 삼천리 화려강산’이라는 구절을 넣으면서 민족을 상징하는 꽃이 되었다고 한다.\n한편 무궁화정신은 우리겨레의 단결과 협동심으로 꽃잎이 떨어져 있는 것 같으면서도 꽃잎의 근원은 하나인 통꽃이며, 우리겨레의 인내, 끈기 그리고 진취성으로 여름철 100여 일간 한그루에서 3천 송이 이상의 꽃을 피운다.	1
52	코스모스	쌍떡잎식물 초롱꽃목 국화과의 한해살이풀. 멕시코가 원산지이며 관상용으로 흔히 심는다. 줄기는 높이가 1∼2m이고 윗부분에서 가지가 갈라지며 털이 없다. 잎은 마주나고 2회 깃꼴로 갈라지며, 갈라진 조각은 줄 모양이다.\n꽃은 6∼10월에 피고 가지와 줄기 끝에 두상화(頭狀花:꽃대 끝에 꽃자루가 없는 작은 꽃이 많이 모여 피어 머리 모양을 이룬 꽃)가 1개씩 달린다. 두상화는 지름이 6cm이고 6∼8개의 설상화와 황색의 관상화로 구성된다.\n설상화는 색깔이 연분홍색·흰색·붉은색 등 매우 다양하고 꽃잎의 끝이 톱니 모양으로 얕게 갈라지며, 통상화는 꽃밥이 짙은 갈색이고 열매를 맺는다. 총포 조각은 2줄로 배열하고 달걀 모양의 바소꼴이며 끝이 뾰족하다. 열매는 수과이고 털이 없으며 끝이 부리 모양이다.\n한방에서는 뿌리를 제외한 식물체 전체를 추영(秋英)이라는 약재로 쓰는데, 눈이 충혈되고 아픈 증세와 종기에 사용한다. 코스모스란 그리스어의 코스모스(kosmos)에서 유래하였는데, 이 식물로 장식한다는 뜻이다. 비슷한 종류로 꽃이 황색인 것을 노랑코스모스(C. lutea)라고 한다.	2
53	안개꽃	석죽과에 속하는 내한성 한해살이풀. 높이는 30∼45cm에 털이 없고, 잎은 마주나며 위쪽 것은 바소와 같은 잎의 모양으로 통통하고 끝이 뾰족하다. 많은 가지가 갈라져 여름에서 가을에 걸쳐 잘고 흰 꽃이 무리지어 핀다. 꽃잎은 5장이고, 끝이 오목하다. 담홍색이나 선홍색의 품종도 있으며, 캅카스 원산으로 화단 및 꽃꽂이용으로 재배한다. 안개꽃은 한해살이풀로 가장 대중적인 품종은 흰꽃인 코벤트 가든 마킷이다. 이 꽃은 추위에 강한 올피기의 대륜인데, 화단심기와 절화용으로 인기가 있다. 붉은꽃에는 크림손·카르미네아가 있으며, 적화종은 소륜으로 키가 40∼50cm로 약간 크게 자란다. \n최근에는 여러해살이뿌리의 안개꽃도 인기가 있다. 안개꽃은 무수히 많은 잔가지가 갈라져서 그 끝에 눈송이처럼 희고 작은 꽃이 피어 올라와 장미나 카네이션 등을 한층 돋보이게 해준다. 관상용이나 꽃꽂이용으로 주로 쓰인다. 한창 꽃이 피어날 때는 안개가 서린 것처럼 희뿌옇게 된다고 하여 안개꽃이라는 이름이 붙었으며, 깁소필라는 석회질의 토양에 잘 자라기 때문에 붙여진 이름으로서 이 꽃의 성질을 잘 말해 주고 있다.	1
54	수국	쌍떡잎식물 장미목 범의귀과의 낙엽관목. 잎은 마주나고 달걀 모양인데, 두껍고 가장자리에는 톱니가 있다. 꽃은 중성화로 6∼7월에 피며 10∼15cm 크기이고 산방꽃차례로 달린다. 꽃받침조각은 꽃잎처럼 생겼고 4∼5개이며, 처음에는 연한 자주색이던 것이 하늘색으로 되었다가 다시 연한 홍색이 된다. 꽃잎은 작으며 4∼5개이고, 수술은 10개 정도이며 암술은 퇴화하고 암술대는 3∼4개이다. \n일본에서 개발된 것인데, 서양으로 간 것은 꽃이 보다 크고 연한 홍색, 짙은 홍색, 짙은 하늘색 등 화려하게 발전시켰다. 옛날에는 꽃을 말려 해열제로 사용하였다. 관상용으로 많이 심는다.	1
55	이끼	이끼류는 관다발 조직이 없고, 생활사에서 배우체가 광합성을 수행하면서 독립생활을 지속하는 식물이다. 줄기, 잎, 그리고 헛뿌리로 이루어진 식물로서 꽃이나 종자를 생식하지 않으며 포자를 통해 번식한다. 대부분의 이끼류 식물은 줄기와 잎이 분화된 경엽체의 형태이지만 우산이끼류나 뿔이끼류와같이 잎과 줄기가 분화되지 않는 엽상체를 보이기도 한다. 헛뿌리는 흡수작용이 거의 없으며 다른 물체를 붙잡거나 줄기를 지탱하는 역할을 한다.	1
6	카네이션	남부 유럽과 서아시아가 원산지이다. 줄기는 곧게 서고 높이가 40∼50cm이며 전체가 분처럼 흰색을 띤다. 잎은 마주나고 줄 모양이며 밑 부분이 줄기를 감싸고 끝이 뾰족하다. 꽃은 7∼8월에 피지만 온실에서는 언제나 필 수 있도록 조절할 수 있으며, 줄기 윗부분의 잎겨드랑이와 줄기 끝에 1∼3개씩 달리고 향기가 있다. 꽃받침은 원통 모양이고 끝이 짧게 5개로 갈라진다. 꽃잎은 달걀을 거꾸로 세운 모양이고 끝 부분이 얕게 갈라진다. 수술은 10개이고 암술대는 2개이다. 열매는 삭과이고 달걀 모양이며 꽃받침에 싸여 있다.\r\n2,000여 년 전부터 재배한 기록이 있으며, 장미·국화·튤립과 함께 세계 4대 절화(切花)로 취급한다. 원래 봄과 여름에 하루의 햇볕을 쬐는 시간이 길어지고 온도가 높아지면서 꽃이 피는 종이지만, 중국계 패랭이꽃(D. chinensis)과 교잡하여 오랫동안 복잡한 개량 과정을 거치면서 사계절 내내 꽃이 피는 계통이 만들어졌다.\r\n한국에서는 온실과 비닐하우스에서 재배하는 것이 거의 대부분을 차지한다. 카네이션은 미국의 한 여성에 의해 어머니에 대한 사랑을 상징하는 꽃이 되었다. 한국에서는 어버이날과 스승의 날에 부모님과 스승의 가슴에 붉은 색 카네이션을 달아드려 감사의 뜻을 표한다.	1
49	히야신스	히아신스의 달콤한 향기는 매력적이어서 튤립이나 수선화 다음가는 중요한 추식 구근이다. 구근의 증식률이 낮고 번식부터 개화구에 이르기까지 3년이상 소요되기 때문에 구근 값이 비싸다. 그러므로 히아신스는 우리나라에 아직 대중화훼로서 재배되기 보다는 특수한 화단용, 분화용, 가정이나 사무실에서 물을 이용한 용기재배로 이용되고 있다.히아신스는 내한성이 있는 다년생 유피인경으로서 지상부 잎이 황변하여 구근수확기가 되면 구근 내부에서 다음해 출현할 잎이 이미 분화되어 저장중에 꽃눈분화를 시작한다. 꽃눈분화가 시작할 무렵에는 다음해의 생장점이 별도로 생겨서, 2~3매의 엽초와 여러 개의 잎이 다음해 수확기까지 발육한다.	0
\.


--
-- Data for Name: core_flower_colors; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_flower_colors (id, flower_id, color_id) FROM stdin;
2	55	4
3	6	1
4	4	4
5	49	2
\.


--
-- Data for Name: core_flower_languages; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_flower_languages (id, flower_id, language_id) FROM stdin;
2	55	586
3	6	552
4	4	553
5	49	554
\.


--
-- Data for Name: core_flower_purposes; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_flower_purposes (id, flower_id, purpose_id) FROM stdin;
2	55	9
3	6	4
4	6	5
5	6	6
6	4	2
7	4	4
8	4	5
9	4	6
10	49	2
11	49	4
12	49	5
13	49	6
14	49	7
15	49	8
\.


--
-- Data for Name: core_image; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_image (id, url, flower_id) FROM stdin;
2	moss1.jpg	55
3	moss2.jpg	55
4	moss3.jpg	55
5	tulip1.jpg	4
6	tulip2.jpg	4
7	tulip3.jpg	4
8	rose1.png	5
9	rose2.jpg	5
10	rose3.jpg	5
11	carnation1.jpg	6
12	carnation2.jpg	6
13	carnation3.jpg	6
14	Chrysanthemum1.jpg	7
15	Chrysanthemum2.png	7
16	Chrysanthemum3.jpg	7
17	Camellia1.jpg	8
18	Camellia2.jpg	8
19	Camellia3.jpg	8
20	trumpet_flower1.jpg	9
21	Zinnia3.jpg	10
22	korean_rosebay2.jpg	11
23	cistus1.jpg	12
24	moss_rose1.jpg	13
25	lavender2.jpg	14
26	cherry_blossom2.jpg	15
27	anemone3.jpg	33
28	korean_forsythia1.jpg	16
29	lilac1.jpg	17
30	sunflower1.jpg	18
31	cotton_plant1.jpg	19
32	holly_hock1.png	20
33	daisy2.jpg	21
34	daisy1.jpg	21
35	daisy3.jpg	21
36	freesia1.jpg	22
37	clover2.jpg	31
38	narcissus2.jpg	23
39	Nicotiana3.png	24
40	jasmine1.jpg	25
41	mint3.jpg	26
42	hypoxidaceae1.png	27
43	marigold1.jpg	28
44	primrose1.jpg	29
45	sensitive_plant1.jpg	30
46	evening_primrose1.jpg	32
47	lily_magnolia1.jpg	34
48	peach2.jpg	35
49	morning_glory1.jpg	36
50	prunus1.jpg	37
51	donarium_cherry1.jpg	38
52	astragalus1.jpg	39
53	china_aster2.jpg	40
54	aloe1.jpg	41
55	Geranium1.jpg	42
56	Saffron2.png	43
57	may_lily1.jpg	44
58	Dahlia1.jpg	45
59	garden_balsam1.jpg	46
60	Erica2.jpg	47
61	korean_thistle1.jpg	48
62	hyacinth2.jpg	49
63	Trillium3.jpg	50
64	rose_of_sharon2.jpg	51
65	rose_of_sharon1.jpg	51
66	rose_of_sharon3.jpg	51
67	cosmos1.jpg	52
68	Common_Gypsophila1.jpg	53
69	Bigleaf_hydrangea2.jpg	54
\.


--
-- Data for Name: core_language; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_language (id, name) FROM stdin;
552	믿음직한 사랑
553	고상
554	변화
555	슬픔
556	건강
557	만능
558	미신
559	진실한 애정
560	그대를 사랑합니다
561	환희
562	지나간 행복
563	다시 찾은 행복
564	정열
565	불안정
566	부귀
567	어린 아이같은 마음씨
568	고독
569	젊은 슬픔
570	엄격
571	독립
572	고독한 사람
573	유희
574	겸손한 사랑
575	그윽한 마음
576	일편단심
577	순정
578	애정
579	조화
580	맑은 마음
581	깨끗한 마음
582	사랑의 성공
583	진심
584	변덕
586	모성애
410	사랑의 고백
411	매혹
412	영원한 애정
413	경솔
414	열렬한 사랑
415	순결함
416	청순함
417	우정
418	영원한 사랑
419	모정
420	사랑
421	부인의 애정
422	성실
423	진실
424	감사
425	실망
426	짝사랑
427	나는 당신을 사랑합니다
428	애타는 사랑
429	누구보다 그대를 사랑합니다
430	비밀스러운 사랑
431	명예
432	행복
433	인연
434	그리움
435	사랑의 기쁨
436	절제
437	청렴
438	인기
439	가련함
440	정절
441	결박
442	정신의 아름다움
443	기대
444	깊은 정
445	달성
446	첫사랑
447	젊은 날의 추억
448	숭배
449	기다림
450	어머니의 사랑
451	단순
452	편안
453	다산
454	풍요
455	희망
456	평화
457	천진난만
458	자기자랑
459	청함
460	자기 사랑
461	자존심
462	고결
463	신비
464	예민한마음
465	수줍음
466	부끄러움
467	비애
468	행복의 열쇠
469	가련
470	빛을 찾다
471	순진한 마음
472	그대가 있어 외롭지 않네
473	영감
474	믿음
475	지혜
476	친절
477	상냥함
478	약속
479	행운
480	밤의 요정
481	소원
482	마법
483	마력
484	배신
485	속절 없는 사랑
486	숭고한 사랑
487	자연애
488	은애
489	존경
490	사랑의 노예
491	용서
492	기쁜 소식
493	결백
494	미덕
495	충실
496	정숙
497	단아함
498	관대한 사랑
\.


--
-- Data for Name: core_purpose; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_purpose (id, name, image) FROM stdin;
2	선물	present-icon.jpg
4	프러포즈	propose-icon.jpg
5	결혼식	marriage-icon.jpg
6	졸업식	graduate-icon.jpg
7	기념일	celebrate-icon.jpg
8	조화(추모용)	dead-icon.jpg
9	관상용	decoration-icon.jpg
10	테라피	therapy-icon.jpg
11	식용	edible-icon.jpg
\.


--
-- Data for Name: core_view; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.core_view (id, view_at, flower_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-08-08 15:09:58.372545+00	1	Image object (1)	1	[{"added": {}}]	6	1
2	2019-08-09 06:58:55.024793+00	1	Language object (1)	1	[{"added": {}}]	4	1
3	2019-08-09 06:59:05.43763+00	1	Color object (1)	1	[{"added": {}}]	2	1
4	2019-08-09 06:59:20.884312+00	1	Purpose object (1)	1	[{"added": {}}]	3	1
5	2019-08-09 06:59:23.710978+00	1	Flower object (1)	1	[{"added": {}}]	5	1
6	2019-08-09 06:59:53.57085+00	1	Comment object (1)	1	[{"added": {}}]	12	1
7	2019-08-09 07:00:22.396099+00	1	Image object (1)	2	[{"changed": {"fields": ["flower"]}}]	6	1
8	2019-08-09 13:17:26.590879+00	1	Image object (1)	3		6	1
9	2019-08-09 14:37:19.349397+00	1	테스트꽃	3		5	1
10	2019-08-09 14:37:30.74822+00	2	튤립	3		5	1
11	2019-08-09 15:08:39.132295+00	1	빨간색	2	[{"changed": {"fields": ["code"]}}]	2	1
12	2019-08-09 15:09:04.58524+00	2	주황색	1	[{"added": {}}]	2	1
13	2019-08-09 15:09:26.910599+00	3	노란색	1	[{"added": {}}]	2	1
14	2019-08-09 15:09:50.140421+00	4	초록색	1	[{"added": {}}]	2	1
15	2019-08-09 15:10:07.089447+00	5	파란색	1	[{"added": {}}]	2	1
16	2019-08-09 15:10:30.230232+00	6	보라색	1	[{"added": {}}]	2	1
17	2019-08-09 15:10:50.551883+00	7	분홍색	1	[{"added": {}}]	2	1
18	2019-08-09 15:11:10.154466+00	8	흰색	1	[{"added": {}}]	2	1
19	2019-08-09 15:12:15.9645+00	1	호호	3		4	1
20	2019-08-09 16:53:53.776757+00	1	식용	3		3	1
21	2019-08-09 16:54:48.271914+00	2	선물	1	[{"added": {}}]	3	1
22	2019-08-09 16:54:51.804469+00	3	선물	1	[{"added": {}}]	3	1
23	2019-08-09 16:55:06.848583+00	4	프러포즈	1	[{"added": {}}]	3	1
24	2019-08-09 16:55:18.970116+00	3	선물	3		3	1
25	2019-08-09 16:55:43.678048+00	5	결혼식	1	[{"added": {}}]	3	1
26	2019-08-09 16:55:54.634755+00	6	졸업식	1	[{"added": {}}]	3	1
27	2019-08-09 16:56:10.022603+00	7	기념일	1	[{"added": {}}]	3	1
28	2019-08-09 16:56:33.313459+00	8	조화(추모용)	1	[{"added": {}}]	3	1
29	2019-08-09 16:56:48.916602+00	9	관상용	1	[{"added": {}}]	3	1
30	2019-08-09 17:01:45.917046+00	10	테라피	1	[{"added": {}}]	3	1
31	2019-08-09 17:01:58.621078+00	11	식용	1	[{"added": {}}]	3	1
32	2019-08-09 17:56:55.442664+00	586	모성애	1	[{"added": {}}]	4	1
33	2019-08-09 18:00:37.091963+00	55	이끼	1	[{"added": {}}]	5	1
34	2019-08-09 18:00:42.02378+00	1	Birth object (1)	1	[{"added": {}}]	15	1
35	2019-08-09 18:01:02.578813+00	1	Birth object (1)	2	[{"changed": {"fields": ["date"]}}]	15	1
36	2019-08-09 18:02:11.763813+00	2	Image object (2)	1	[{"added": {}}]	6	1
37	2019-08-09 18:02:30.774978+00	3	Image object (3)	1	[{"added": {}}]	6	1
38	2019-08-09 18:02:41.793515+00	4	Image object (4)	1	[{"added": {}}]	6	1
39	2019-08-09 18:19:22.885624+00	5	Image object (5)	1	[{"added": {}}]	6	1
40	2019-08-09 18:20:35.867679+00	6	Image object (6)	1	[{"added": {}}]	6	1
41	2019-08-09 18:21:03.017878+00	7	Image object (7)	1	[{"added": {}}]	6	1
42	2019-08-09 18:21:27.388703+00	8	Image object (8)	1	[{"added": {}}]	6	1
43	2019-08-09 18:21:53.275488+00	9	Image object (9)	1	[{"added": {}}]	6	1
44	2019-08-09 18:22:07.753939+00	10	Image object (10)	1	[{"added": {}}]	6	1
45	2019-08-09 18:23:04.914964+00	11	Image object (11)	1	[{"added": {}}]	6	1
46	2019-08-09 18:23:49.535777+00	12	Image object (12)	1	[{"added": {}}]	6	1
47	2019-08-09 18:24:21.559974+00	13	Image object (13)	1	[{"added": {}}]	6	1
48	2019-08-09 18:24:46.871296+00	14	Image object (14)	1	[{"added": {}}]	6	1
49	2019-08-09 18:25:13.312591+00	15	Image object (15)	1	[{"added": {}}]	6	1
50	2019-08-09 18:25:53.06351+00	16	Image object (16)	1	[{"added": {}}]	6	1
51	2019-08-09 18:26:23.995587+00	17	Image object (17)	1	[{"added": {}}]	6	1
52	2019-08-09 18:26:44.707201+00	18	Image object (18)	1	[{"added": {}}]	6	1
53	2019-08-09 18:27:08.002003+00	19	Image object (19)	1	[{"added": {}}]	6	1
54	2019-08-09 18:27:39.897627+00	20	Image object (20)	1	[{"added": {}}]	6	1
55	2019-08-09 18:28:09.815625+00	21	Image object (21)	1	[{"added": {}}]	6	1
56	2019-08-09 18:28:44.11192+00	22	Image object (22)	1	[{"added": {}}]	6	1
57	2019-08-09 18:29:27.744244+00	23	Image object (23)	1	[{"added": {}}]	6	1
58	2019-08-09 18:30:12.36992+00	24	Image object (24)	1	[{"added": {}}]	6	1
59	2019-08-09 18:30:47.006301+00	25	Image object (25)	1	[{"added": {}}]	6	1
60	2019-08-09 18:31:51.029105+00	26	Image object (26)	1	[{"added": {}}]	6	1
61	2019-08-09 18:39:10.178832+00	27	Image object (27)	1	[{"added": {}}]	6	1
62	2019-08-09 18:39:43.86276+00	28	Image object (28)	1	[{"added": {}}]	6	1
63	2019-08-09 18:44:32.778211+00	29	Image object (29)	1	[{"added": {}}]	6	1
64	2019-08-09 18:45:00.23978+00	30	Image object (30)	1	[{"added": {}}]	6	1
65	2019-08-09 18:45:29.433713+00	31	Image object (31)	1	[{"added": {}}]	6	1
66	2019-08-09 18:46:24.376807+00	32	Image object (32)	1	[{"added": {}}]	6	1
67	2019-08-09 18:46:54.778506+00	33	Image object (33)	1	[{"added": {}}]	6	1
68	2019-08-09 18:47:12.21691+00	34	Image object (34)	1	[{"added": {}}]	6	1
69	2019-08-09 18:47:38.993273+00	35	Image object (35)	1	[{"added": {}}]	6	1
70	2019-08-09 18:48:30.594294+00	36	Image object (36)	1	[{"added": {}}]	6	1
71	2019-08-09 18:50:16.062275+00	37	Image object (37)	1	[{"added": {}}]	6	1
72	2019-08-09 18:50:46.814147+00	38	Image object (38)	1	[{"added": {}}]	6	1
73	2019-08-09 18:51:25.924465+00	39	Image object (39)	1	[{"added": {}}]	6	1
74	2019-08-09 18:51:58.257011+00	40	Image object (40)	1	[{"added": {}}]	6	1
75	2019-08-09 18:52:43.378357+00	41	Image object (41)	1	[{"added": {}}]	6	1
76	2019-08-09 18:53:13.291375+00	42	Image object (42)	1	[{"added": {}}]	6	1
77	2019-08-09 18:53:58.127483+00	43	Image object (43)	1	[{"added": {}}]	6	1
78	2019-08-09 18:54:29.812753+00	44	Image object (44)	1	[{"added": {}}]	6	1
79	2019-08-09 18:55:05.368679+00	45	Image object (45)	1	[{"added": {}}]	6	1
80	2019-08-09 18:55:34.898059+00	46	Image object (46)	1	[{"added": {}}]	6	1
81	2019-08-09 18:56:04.978285+00	47	Image object (47)	1	[{"added": {}}]	6	1
82	2019-08-09 18:57:28.274551+00	48	Image object (48)	1	[{"added": {}}]	6	1
83	2019-08-09 18:58:03.21812+00	49	Image object (49)	1	[{"added": {}}]	6	1
84	2019-08-09 18:58:19.576372+00	50	Image object (50)	1	[{"added": {}}]	6	1
85	2019-08-09 18:59:15.285408+00	51	Image object (51)	1	[{"added": {}}]	6	1
86	2019-08-09 18:59:35.066643+00	52	Image object (52)	1	[{"added": {}}]	6	1
87	2019-08-09 18:59:55.304398+00	53	Image object (53)	1	[{"added": {}}]	6	1
88	2019-08-09 19:00:38.451025+00	54	Image object (54)	1	[{"added": {}}]	6	1
89	2019-08-09 19:01:43.293639+00	55	Image object (55)	1	[{"added": {}}]	6	1
90	2019-08-09 19:02:33.852444+00	56	Image object (56)	1	[{"added": {}}]	6	1
91	2019-08-09 19:27:58.342672+00	57	Image object (57)	1	[{"added": {}}]	6	1
92	2019-08-09 19:28:28.964789+00	58	Image object (58)	1	[{"added": {}}]	6	1
93	2019-08-09 19:28:54.983217+00	59	Image object (59)	1	[{"added": {}}]	6	1
94	2019-08-09 19:29:47.323262+00	60	Image object (60)	1	[{"added": {}}]	6	1
95	2019-08-09 19:30:11.155535+00	61	Image object (61)	1	[{"added": {}}]	6	1
96	2019-08-09 19:30:36.550628+00	62	Image object (62)	1	[{"added": {}}]	6	1
97	2019-08-09 19:31:47.52684+00	63	Image object (63)	1	[{"added": {}}]	6	1
98	2019-08-09 19:33:12.201422+00	64	Image object (64)	1	[{"added": {}}]	6	1
99	2019-08-09 19:33:26.244872+00	65	Image object (65)	1	[{"added": {}}]	6	1
100	2019-08-09 19:33:40.676282+00	66	Image object (66)	1	[{"added": {}}]	6	1
101	2019-08-09 19:34:01.592353+00	67	Image object (67)	1	[{"added": {}}]	6	1
102	2019-08-09 19:34:44.575418+00	68	Image object (68)	1	[{"added": {}}]	6	1
103	2019-08-09 19:35:13.867091+00	69	Image object (69)	1	[{"added": {}}]	6	1
104	2019-08-09 20:14:38.217807+00	6	카네이션	2	[{"changed": {"fields": ["description", "languages", "colors", "purposes"]}}]	5	1
105	2019-08-09 20:14:51.511175+00	4	튤립	2	[{"changed": {"fields": ["languages", "colors", "purposes"]}}]	5	1
106	2019-08-09 20:15:18.03646+00	49	히야신스	2	[{"changed": {"fields": ["languages", "colors", "purposes"]}}]	5	1
107	2019-08-09 20:24:17.736337+00	2	Comment object (2)	1	[{"added": {}}]	12	1
108	2019-08-11 11:42:56.61271+00	3	Comment object (3)	1	[{"added": {}}]	12	1
109	2019-08-11 11:43:15.578426+00	4	Comment object (4)	1	[{"added": {}}]	12	1
110	2019-08-11 11:43:43.929424+00	5	Comment object (5)	1	[{"added": {}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	flauth	user
2	core	color
3	core	purpose
4	core	language
5	core	flower
6	core	image
7	admin	logentry
8	auth	permission
9	auth	group
10	contenttypes	contenttype
11	sessions	session
12	core	comment
13	core	commentlike
14	core	view
15	core	birth
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	core	0001_initial	2019-08-08 14:51:09.936719+00
2	flauth	0001_initial	2019-08-08 14:51:09.994091+00
3	contenttypes	0001_initial	2019-08-08 14:51:10.261443+00
4	admin	0001_initial	2019-08-08 14:51:10.318141+00
5	admin	0002_logentry_remove_auto_add	2019-08-08 14:51:10.393942+00
6	admin	0003_logentry_add_action_flag_choices	2019-08-08 14:51:10.43399+00
7	contenttypes	0002_remove_content_type_name	2019-08-08 14:51:10.495274+00
8	auth	0001_initial	2019-08-08 14:51:10.588306+00
9	auth	0002_alter_permission_name_max_length	2019-08-08 14:51:10.723419+00
10	auth	0003_alter_user_email_max_length	2019-08-08 14:51:10.762815+00
11	auth	0004_alter_user_username_opts	2019-08-08 14:51:10.806885+00
12	auth	0005_alter_user_last_login_null	2019-08-08 14:51:10.846618+00
13	auth	0006_require_contenttypes_0002	2019-08-08 14:51:10.881564+00
14	auth	0007_alter_validators_add_error_messages	2019-08-08 14:51:10.925953+00
15	auth	0008_alter_user_username_max_length	2019-08-08 14:51:10.966512+00
16	auth	0009_alter_user_last_name_max_length	2019-08-08 14:51:11.007462+00
17	auth	0010_alter_group_name_max_length	2019-08-08 14:51:11.054977+00
18	auth	0011_update_proxy_permissions	2019-08-08 14:51:11.100114+00
19	core	0002_flower_language	2019-08-08 14:51:11.220808+00
20	core	0003_image	2019-08-08 14:51:11.451712+00
21	flauth	0002_auto_20190806_1119	2019-08-08 14:51:11.618145+00
22	sessions	0001_initial	2019-08-08 14:51:11.683562+00
23	core	0004_auto_20190808_1617	2019-08-09 06:57:31.922914+00
24	core	0005_comment	2019-08-09 06:57:31.988949+00
25	core	0006_auto_20190809_0554	2019-08-09 06:57:32.147011+00
26	flauth	0003_user_deta_joined	2019-08-09 06:57:32.258544+00
27	flauth	0004_auto_20190809_0212	2019-08-09 06:57:32.310107+00
28	core	0007_auto_20190809_1224	2019-08-09 12:25:45.413618+00
29	core	0008_auto_20190809_1406	2019-08-09 14:07:20.222677+00
30	core	0009_birth_view	2019-08-09 17:47:33.564779+00
31	core	0010_auto_20190810_0247	2019-08-09 17:47:33.752272+00
32	core	0010_auto_20190809_1745	2019-08-09 17:48:30.911698+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7kc23tcwp95iunq2zzc6vgm8fvp7tq36	MzE2ZGIyMDc2MmY1YmJjNDU0YWQwMTZlZDg4ZTEwNmU0ZmNkMWRhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZGU2MjkzNzVmNTRmNTQ4NjUxMjNlMjVhNmFlZGE3NGM1ZTdiYTk1In0=	2019-08-22 15:09:33.698053+00
0qwe0monzjmnvt1wte83uij6u6iihwbq	MzE2ZGIyMDc2MmY1YmJjNDU0YWQwMTZlZDg4ZTEwNmU0ZmNkMWRhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZGU2MjkzNzVmNTRmNTQ4NjUxMjNlMjVhNmFlZGE3NGM1ZTdiYTk1In0=	2019-08-23 06:58:07.8413+00
elr3j9jq6ckupm00uqjtokq1xu8jegj3	MzE2ZGIyMDc2MmY1YmJjNDU0YWQwMTZlZDg4ZTEwNmU0ZmNkMWRhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZGU2MjkzNzVmNTRmNTQ4NjUxMjNlMjVhNmFlZGE3NGM1ZTdiYTk1In0=	2019-08-23 07:38:19.309086+00
x3l0d9w97z0f0d34zo4uuj2jpfotxlne	MzE2ZGIyMDc2MmY1YmJjNDU0YWQwMTZlZDg4ZTEwNmU0ZmNkMWRhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZGU2MjkzNzVmNTRmNTQ4NjUxMjNlMjVhNmFlZGE3NGM1ZTdiYTk1In0=	2019-08-23 12:33:03.599904+00
u4df5gakbq6u3y4gv62uumbx74ovdc8l	MzE2ZGIyMDc2MmY1YmJjNDU0YWQwMTZlZDg4ZTEwNmU0ZmNkMWRhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZGU2MjkzNzVmNTRmNTQ4NjUxMjNlMjVhNmFlZGE3NGM1ZTdiYTk1In0=	2019-08-23 13:17:01.706419+00
eewn7x5ovd5sfqa0fzuvreijaekuwvkv	MzE2ZGIyMDc2MmY1YmJjNDU0YWQwMTZlZDg4ZTEwNmU0ZmNkMWRhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZGU2MjkzNzVmNTRmNTQ4NjUxMjNlMjVhNmFlZGE3NGM1ZTdiYTk1In0=	2019-08-23 20:11:53.058253+00
usul1kdj07kdmwn1hk3b5dff2he1ttuc	MzE2ZGIyMDc2MmY1YmJjNDU0YWQwMTZlZDg4ZTEwNmU0ZmNkMWRhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZGU2MjkzNzVmNTRmNTQ4NjUxMjNlMjVhNmFlZGE3NGM1ZTdiYTk1In0=	2019-08-24 15:57:51.671766+00
\.


--
-- Data for Name: flauth_user; Type: TABLE DATA; Schema: public; Owner: floweryroadAdmin
--

COPY public.flauth_user (id, password, last_login, email, nickname, is_active, is_admin, color_id, purpose_id, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$5e3bQUoDnw49$M65h6ENLD7mvWN9UbdZaRs6CNMH0Z1fUUhUmS3Umt3c=	2019-08-10 15:57:51.648635+00	floweryroadAdmin@gmail.com		t	t	\N	\N	2019-08-09 06:57:32.21625+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: core_birth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_birth_id_seq', 1, true);


--
-- Name: core_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_color_id_seq', 8, true);


--
-- Name: core_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_comment_id_seq', 5, true);


--
-- Name: core_commentlike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_commentlike_id_seq', 1, false);


--
-- Name: core_flower_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_flower_colors_id_seq', 5, true);


--
-- Name: core_flower_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_flower_id_seq', 55, true);


--
-- Name: core_flower_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_flower_languages_id_seq', 5, true);


--
-- Name: core_flower_purposes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_flower_purposes_id_seq', 15, true);


--
-- Name: core_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_image_id_seq', 69, true);


--
-- Name: core_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_language_id_seq', 586, true);


--
-- Name: core_purpose_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_purpose_id_seq', 11, true);


--
-- Name: core_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.core_view_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 110, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 32, true);


--
-- Name: flauth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: floweryroadAdmin
--

SELECT pg_catalog.setval('public.flauth_user_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: core_birth core_birth_date_key; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_birth
    ADD CONSTRAINT core_birth_date_key UNIQUE (date);


--
-- Name: core_birth core_birth_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_birth
    ADD CONSTRAINT core_birth_pkey PRIMARY KEY (id);


--
-- Name: core_color core_color_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_color
    ADD CONSTRAINT core_color_pkey PRIMARY KEY (id);


--
-- Name: core_comment core_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_comment
    ADD CONSTRAINT core_comment_pkey PRIMARY KEY (id);


--
-- Name: core_commentlike core_commentlike_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_commentlike
    ADD CONSTRAINT core_commentlike_pkey PRIMARY KEY (id);


--
-- Name: core_flower_colors core_flower_colors_flower_id_color_id_a12b21e1_uniq; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_colors
    ADD CONSTRAINT core_flower_colors_flower_id_color_id_a12b21e1_uniq UNIQUE (flower_id, color_id);


--
-- Name: core_flower_colors core_flower_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_colors
    ADD CONSTRAINT core_flower_colors_pkey PRIMARY KEY (id);


--
-- Name: core_flower_languages core_flower_languages_flower_id_language_id_0df569ee_uniq; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_languages
    ADD CONSTRAINT core_flower_languages_flower_id_language_id_0df569ee_uniq UNIQUE (flower_id, language_id);


--
-- Name: core_flower_languages core_flower_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_languages
    ADD CONSTRAINT core_flower_languages_pkey PRIMARY KEY (id);


--
-- Name: core_flower core_flower_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower
    ADD CONSTRAINT core_flower_pkey PRIMARY KEY (id);


--
-- Name: core_flower_purposes core_flower_purposes_flower_id_purpose_id_859f7b58_uniq; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_purposes
    ADD CONSTRAINT core_flower_purposes_flower_id_purpose_id_859f7b58_uniq UNIQUE (flower_id, purpose_id);


--
-- Name: core_flower_purposes core_flower_purposes_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_purposes
    ADD CONSTRAINT core_flower_purposes_pkey PRIMARY KEY (id);


--
-- Name: core_image core_image_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_image
    ADD CONSTRAINT core_image_pkey PRIMARY KEY (id);


--
-- Name: core_language core_language_name_key; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_language
    ADD CONSTRAINT core_language_name_key UNIQUE (name);


--
-- Name: core_language core_language_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_language
    ADD CONSTRAINT core_language_pkey PRIMARY KEY (id);


--
-- Name: core_purpose core_purpose_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_purpose
    ADD CONSTRAINT core_purpose_pkey PRIMARY KEY (id);


--
-- Name: core_view core_view_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_view
    ADD CONSTRAINT core_view_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: flauth_user flauth_user_email_key; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.flauth_user
    ADD CONSTRAINT flauth_user_email_key UNIQUE (email);


--
-- Name: flauth_user flauth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.flauth_user
    ADD CONSTRAINT flauth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: core_birth_flower_id_b46a58e2; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_birth_flower_id_b46a58e2 ON public.core_birth USING btree (flower_id);


--
-- Name: core_comment_flower_id_a93e3725; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_comment_flower_id_a93e3725 ON public.core_comment USING btree (flower_id);


--
-- Name: core_comment_user_id_a9a9430c; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_comment_user_id_a9a9430c ON public.core_comment USING btree (user_id);


--
-- Name: core_commentlike_comment_id_33e5cb2b; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_commentlike_comment_id_33e5cb2b ON public.core_commentlike USING btree (comment_id);


--
-- Name: core_commentlike_user_id_6a8238cf; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_commentlike_user_id_6a8238cf ON public.core_commentlike USING btree (user_id);


--
-- Name: core_flower_colors_color_id_bd54da51; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_flower_colors_color_id_bd54da51 ON public.core_flower_colors USING btree (color_id);


--
-- Name: core_flower_colors_flower_id_4cb06502; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_flower_colors_flower_id_4cb06502 ON public.core_flower_colors USING btree (flower_id);


--
-- Name: core_flower_languages_flower_id_5e2b9c62; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_flower_languages_flower_id_5e2b9c62 ON public.core_flower_languages USING btree (flower_id);


--
-- Name: core_flower_languages_language_id_5931aebf; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_flower_languages_language_id_5931aebf ON public.core_flower_languages USING btree (language_id);


--
-- Name: core_flower_purposes_flower_id_95b2aa4a; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_flower_purposes_flower_id_95b2aa4a ON public.core_flower_purposes USING btree (flower_id);


--
-- Name: core_flower_purposes_purpose_id_1d40b296; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_flower_purposes_purpose_id_1d40b296 ON public.core_flower_purposes USING btree (purpose_id);


--
-- Name: core_image_flower_id_ec5119f4; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_image_flower_id_ec5119f4 ON public.core_image USING btree (flower_id);


--
-- Name: core_language_name_ba98092a_like; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_language_name_ba98092a_like ON public.core_language USING btree (name varchar_pattern_ops);


--
-- Name: core_view_flower_id_d860f8c3; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_view_flower_id_d860f8c3 ON public.core_view USING btree (flower_id);


--
-- Name: core_view_user_id_64c245a9; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX core_view_user_id_64c245a9 ON public.core_view USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: flauth_user_color_id_e2327a13; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX flauth_user_color_id_e2327a13 ON public.flauth_user USING btree (color_id);


--
-- Name: flauth_user_email_2b193a94_like; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX flauth_user_email_2b193a94_like ON public.flauth_user USING btree (email varchar_pattern_ops);


--
-- Name: flauth_user_purpose_id_10fb8968; Type: INDEX; Schema: public; Owner: floweryroadAdmin
--

CREATE INDEX flauth_user_purpose_id_10fb8968 ON public.flauth_user USING btree (purpose_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_birth core_birth_flower_id_b46a58e2_fk_core_flower_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_birth
    ADD CONSTRAINT core_birth_flower_id_b46a58e2_fk_core_flower_id FOREIGN KEY (flower_id) REFERENCES public.core_flower(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_comment core_comment_flower_id_a93e3725_fk_core_flower_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_comment
    ADD CONSTRAINT core_comment_flower_id_a93e3725_fk_core_flower_id FOREIGN KEY (flower_id) REFERENCES public.core_flower(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_comment core_comment_user_id_a9a9430c_fk_flauth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_comment
    ADD CONSTRAINT core_comment_user_id_a9a9430c_fk_flauth_user_id FOREIGN KEY (user_id) REFERENCES public.flauth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_commentlike core_commentlike_comment_id_33e5cb2b_fk_core_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_commentlike
    ADD CONSTRAINT core_commentlike_comment_id_33e5cb2b_fk_core_comment_id FOREIGN KEY (comment_id) REFERENCES public.core_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_commentlike core_commentlike_user_id_6a8238cf_fk_flauth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_commentlike
    ADD CONSTRAINT core_commentlike_user_id_6a8238cf_fk_flauth_user_id FOREIGN KEY (user_id) REFERENCES public.flauth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_flower_colors core_flower_colors_color_id_bd54da51_fk_core_color_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_colors
    ADD CONSTRAINT core_flower_colors_color_id_bd54da51_fk_core_color_id FOREIGN KEY (color_id) REFERENCES public.core_color(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_flower_colors core_flower_colors_flower_id_4cb06502_fk_core_flower_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_colors
    ADD CONSTRAINT core_flower_colors_flower_id_4cb06502_fk_core_flower_id FOREIGN KEY (flower_id) REFERENCES public.core_flower(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_flower_languages core_flower_languages_flower_id_5e2b9c62_fk_core_flower_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_languages
    ADD CONSTRAINT core_flower_languages_flower_id_5e2b9c62_fk_core_flower_id FOREIGN KEY (flower_id) REFERENCES public.core_flower(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_flower_languages core_flower_languages_language_id_5931aebf_fk_core_language_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_languages
    ADD CONSTRAINT core_flower_languages_language_id_5931aebf_fk_core_language_id FOREIGN KEY (language_id) REFERENCES public.core_language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_flower_purposes core_flower_purposes_flower_id_95b2aa4a_fk_core_flower_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_purposes
    ADD CONSTRAINT core_flower_purposes_flower_id_95b2aa4a_fk_core_flower_id FOREIGN KEY (flower_id) REFERENCES public.core_flower(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_flower_purposes core_flower_purposes_purpose_id_1d40b296_fk_core_purpose_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_flower_purposes
    ADD CONSTRAINT core_flower_purposes_purpose_id_1d40b296_fk_core_purpose_id FOREIGN KEY (purpose_id) REFERENCES public.core_purpose(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_image core_image_flower_id_ec5119f4_fk_core_flower_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_image
    ADD CONSTRAINT core_image_flower_id_ec5119f4_fk_core_flower_id FOREIGN KEY (flower_id) REFERENCES public.core_flower(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_view core_view_flower_id_d860f8c3_fk_core_flower_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_view
    ADD CONSTRAINT core_view_flower_id_d860f8c3_fk_core_flower_id FOREIGN KEY (flower_id) REFERENCES public.core_flower(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_view core_view_user_id_64c245a9_fk_flauth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.core_view
    ADD CONSTRAINT core_view_user_id_64c245a9_fk_flauth_user_id FOREIGN KEY (user_id) REFERENCES public.flauth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_flauth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_flauth_user_id FOREIGN KEY (user_id) REFERENCES public.flauth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flauth_user flauth_user_color_id_e2327a13_fk_core_color_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.flauth_user
    ADD CONSTRAINT flauth_user_color_id_e2327a13_fk_core_color_id FOREIGN KEY (color_id) REFERENCES public.core_color(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flauth_user flauth_user_purpose_id_10fb8968_fk_core_purpose_id; Type: FK CONSTRAINT; Schema: public; Owner: floweryroadAdmin
--

ALTER TABLE ONLY public.flauth_user
    ADD CONSTRAINT flauth_user_purpose_id_10fb8968_fk_core_purpose_id FOREIGN KEY (purpose_id) REFERENCES public.core_purpose(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: floweryroadAdmin
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO "floweryroadAdmin";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

