--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-22 06:32:37

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

DROP DATABASE pro_gol;
--
-- TOC entry 3508 (class 1262 OID 16562)
-- Name: pro_gol; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pro_gol WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';


ALTER DATABASE pro_gol OWNER TO postgres;

\connect pro_gol

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
-- TOC entry 222 (class 1259 OID 16660)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO webuser;

--
-- TOC entry 221 (class 1259 OID 16659)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO webuser;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 224 (class 1259 OID 16669)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO webuser;

--
-- TOC entry 223 (class 1259 OID 16668)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO webuser;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 220 (class 1259 OID 16653)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO webuser;

--
-- TOC entry 219 (class 1259 OID 16652)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO webuser;

--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 219
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 226 (class 1259 OID 16676)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO webuser;

--
-- TOC entry 228 (class 1259 OID 16685)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO webuser;

--
-- TOC entry 227 (class 1259 OID 16684)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO webuser;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 227
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 225 (class 1259 OID 16675)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO webuser;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 225
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 230 (class 1259 OID 16692)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO webuser;

--
-- TOC entry 229 (class 1259 OID 16691)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO webuser;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 229
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 232 (class 1259 OID 16751)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: webuser
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


ALTER TABLE public.django_admin_log OWNER TO webuser;

--
-- TOC entry 231 (class 1259 OID 16750)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO webuser;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 231
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 218 (class 1259 OID 16644)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO webuser;

--
-- TOC entry 217 (class 1259 OID 16643)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO webuser;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 217
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 216 (class 1259 OID 16635)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO webuser;

--
-- TOC entry 215 (class 1259 OID 16634)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO webuser;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 215
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 233 (class 1259 OID 16780)
-- Name: django_session; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO webuser;

--
-- TOC entry 237 (class 1259 OID 17043)
-- Name: gestionVideos_tbl_usuarios; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public."gestionVideos_tbl_usuarios" (
    id character varying(10) NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public."gestionVideos_tbl_usuarios" OWNER TO webuser;

--
-- TOC entry 241 (class 1259 OID 17055)
-- Name: gestionVideos_tbl_usuarios_videos; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public."gestionVideos_tbl_usuarios_videos" (
    id bigint NOT NULL,
    id_user_id character varying(10) NOT NULL,
    id_video_id integer NOT NULL
);


ALTER TABLE public."gestionVideos_tbl_usuarios_videos" OWNER TO webuser;

--
-- TOC entry 240 (class 1259 OID 17054)
-- Name: gestionVideos_tbl_usuarios_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

ALTER TABLE public."gestionVideos_tbl_usuarios_videos" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."gestionVideos_tbl_usuarios_videos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 17049)
-- Name: gestionVideos_tbl_videos; Type: TABLE; Schema: public; Owner: webuser
--

CREATE TABLE public."gestionVideos_tbl_videos" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    extension character varying(5) NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public."gestionVideos_tbl_videos" OWNER TO webuser;

--
-- TOC entry 238 (class 1259 OID 17048)
-- Name: gestionVideos_tbl_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser
--

ALTER TABLE public."gestionVideos_tbl_videos" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."gestionVideos_tbl_videos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16601)
-- Name: tbl_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_usuarios (
    nombre character varying(50) DEFAULT NULL::character varying,
    id character varying(10) NOT NULL
);


ALTER TABLE public.tbl_usuarios OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16812)
-- Name: tbl_usuarios_videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_usuarios_videos (
    id_user character varying(10) DEFAULT NULL::character varying,
    id_video integer
);


ALTER TABLE public.tbl_usuarios_videos OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16804)
-- Name: tbl_videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_videos (
    id integer NOT NULL,
    nombre character varying(50) DEFAULT NULL::character varying,
    extension character varying(5) DEFAULT NULL::character varying,
    size integer
);


ALTER TABLE public.tbl_videos OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16803)
-- Name: tbl_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_videos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_videos_id_seq OWNER TO postgres;

--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 234
-- Name: tbl_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_videos_id_seq OWNED BY public.tbl_videos.id;


--
-- TOC entry 3248 (class 2604 OID 16663)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 16672)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 16656)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 16679)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 16688)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 16695)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 16754)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 16647)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16638)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 16807)
-- Name: tbl_videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_videos ALTER COLUMN id SET DEFAULT nextval('public.tbl_videos_id_seq'::regclass);


--
-- TOC entry 3483 (class 0 OID 16660)
-- Dependencies: 222
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: webuser
--



--
-- TOC entry 3485 (class 0 OID 16669)
-- Dependencies: 224
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: webuser
--



--
-- TOC entry 3481 (class 0 OID 16653)
-- Dependencies: 220
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: webuser
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add tbl_videos', 7, 'add_tbl_videos');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change tbl_videos', 7, 'change_tbl_videos');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete tbl_videos', 7, 'delete_tbl_videos');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view tbl_videos', 7, 'view_tbl_videos');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add tbl_usuarios', 8, 'add_tbl_usuarios');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change tbl_usuarios', 8, 'change_tbl_usuarios');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete tbl_usuarios', 8, 'delete_tbl_usuarios');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view tbl_usuarios', 8, 'view_tbl_usuarios');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add tbl_usuarios_videos', 9, 'add_tbl_usuarios_videos');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change tbl_usuarios_videos', 9, 'change_tbl_usuarios_videos');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete tbl_usuarios_videos', 9, 'delete_tbl_usuarios_videos');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view tbl_usuarios_videos', 9, 'view_tbl_usuarios_videos');


--
-- TOC entry 3487 (class 0 OID 16676)
-- Dependencies: 226
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: webuser
--

INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$260000$qVX0easKvptyoYVkgUVqEl$ZAzfU3OYPfANulUxl04IE7+JoSf6b3MINtexZRZuJ5A=', '2023-06-28 02:10:19.02505-06', true, 'webuser', '', '', '', true, true, '2023-06-28 02:08:01.332507-06');


--
-- TOC entry 3489 (class 0 OID 16685)
-- Dependencies: 228
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: webuser
--



--
-- TOC entry 3491 (class 0 OID 16692)
-- Dependencies: 230
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: webuser
--



--
-- TOC entry 3493 (class 0 OID 16751)
-- Dependencies: 232
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: webuser
--



--
-- TOC entry 3479 (class 0 OID 16644)
-- Dependencies: 218
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: webuser
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'gestionVideos', 'tbl_videos');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'gestionVideos', 'tbl_usuarios');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'gestionVideos', 'tbl_usuarios_videos');


--
-- TOC entry 3477 (class 0 OID 16635)
-- Dependencies: 216
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: webuser
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2023-06-28 01:10:02.351856-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2023-06-28 01:10:02.498117-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2023-06-28 01:10:02.537741-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-06-28 01:10:02.548723-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-28 01:10:02.563089-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-06-28 01:10:02.581572-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-06-28 01:10:02.589575-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-06-28 01:10:02.602154-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-06-28 01:10:02.612639-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-06-28 01:10:02.621073-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-06-28 01:10:02.625958-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-06-28 01:10:02.637201-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-06-28 01:10:02.660534-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-06-28 01:10:02.669494-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-06-28 01:10:02.684143-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-06-28 01:10:02.695355-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-06-28 01:10:02.703283-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'sessions', '0001_initial', '2023-06-28 01:10:02.729924-06');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'gestionVideos', '0001_initial', '2023-07-20 21:31:13.81114-06');


--
-- TOC entry 3494 (class 0 OID 16780)
-- Dependencies: 233
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: webuser
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('hn713groa6kiff79bu9zct1uqr39ags1', '.eJxVjEEOwiAQRe_C2hDK0AIu3XsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwkziLQZx-t4jpwXUHdMd6azK1ui5zlLsiD9rltRE_L4f7d1Cwl2-dk51YgUmWIBPDhF6NjgjJqMheZYigIWYwmZ01TmnKegQPhjQBD-L9Af3RODE:1qEQFn:cEQrerryyJPO5N86mycBbXm--gzzZZf6q9USwz_yvdM', '2023-07-12 02:10:19.025575-06');


--
-- TOC entry 3498 (class 0 OID 17043)
-- Dependencies: 237
-- Data for Name: gestionVideos_tbl_usuarios; Type: TABLE DATA; Schema: public; Owner: webuser
--

INSERT INTO public."gestionVideos_tbl_usuarios" (id, nombre) VALUES ('qwerty1', 'Alicia');
INSERT INTO public."gestionVideos_tbl_usuarios" (id, nombre) VALUES ('kio3', 'kio Tres');
INSERT INTO public."gestionVideos_tbl_usuarios" (id, nombre) VALUES ('test', 'Alicia');
INSERT INTO public."gestionVideos_tbl_usuarios" (id, nombre) VALUES ('kio1', 'kio');
INSERT INTO public."gestionVideos_tbl_usuarios" (id, nombre) VALUES ('neo8', 'Neon');
INSERT INTO public."gestionVideos_tbl_usuarios" (id, nombre) VALUES ('Alicia7', 'Alicia Siete');
INSERT INTO public."gestionVideos_tbl_usuarios" (id, nombre) VALUES ('kio', 'kio');
INSERT INTO public."gestionVideos_tbl_usuarios" (id, nombre) VALUES ('kio2', 'kio');


--
-- TOC entry 3502 (class 0 OID 17055)
-- Dependencies: 241
-- Data for Name: gestionVideos_tbl_usuarios_videos; Type: TABLE DATA; Schema: public; Owner: webuser
--

INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (1, 'test', 22);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (2, 'test', 23);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (3, 'kio1', 24);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (4, 'kio1', 25);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (5, 'kio1', 26);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (6, 'kio1', 27);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (7, 'kio1', 28);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (8, 'kio2', 29);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (9, 'kio2', 30);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (10, 'kio2', 31);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (11, 'kio2', 32);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (12, 'kio2', 33);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (13, 'kio2', 34);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (14, 'kio3', 35);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (15, 'kio1', 36);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (16, 'kio1', 37);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (17, 'neo8', 38);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (18, 'neo8', 39);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (19, 'neo8', 40);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (20, 'neo8', 41);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (21, 'neo8', 42);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (22, 'neo8', 43);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (23, 'neo8', 44);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (24, 'neo8', 45);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (25, 'Alicia7', 46);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (26, 'Alicia7', 47);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (27, 'Alicia7', 48);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (28, 'Alicia7', 49);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (29, 'Alicia7', 50);
INSERT INTO public."gestionVideos_tbl_usuarios_videos" (id, id_user_id, id_video_id) VALUES (30, 'Alicia7', 51);


--
-- TOC entry 3500 (class 0 OID 17049)
-- Dependencies: 239
-- Data for Name: gestionVideos_tbl_videos; Type: TABLE DATA; Schema: public; Owner: webuser
--

INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (1, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (2, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (3, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (4, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (5, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (6, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (7, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (8, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (9, 'video2', 'mpg', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (10, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (11, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (12, 'video2', 'mpg', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (13, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (14, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (15, 'video2', 'mpg', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (16, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (17, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (18, 'video2', 'mpg', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (19, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (20, 'video2', 'mpg', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (21, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (22, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (23, 'video2', 'mpg', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (24, 'kiovid1', 'mpg4', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (25, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (26, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (27, 'video1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (28, 'video2', 'mpg', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (29, 'video', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (30, 'video', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (31, 'video', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (32, 'video', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (33, 'video', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (34, 'video2', 'mpg3', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (35, 'videoA', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (36, 'videok1', 'mov', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (37, 'videok1', 'mov', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (38, 'neo1', 'mov', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (39, 'neo1', 'mov', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (40, 'neo1', 'mov', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (41, 'neo1', 'mov', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (42, 'neo2', 'mpg4', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (43, 'neo1', 'mov', 2);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (44, 'neo2', 'mpg4', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (45, 'neo3', 'mov', 3);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (46, 'aliciavid1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (47, 'aliciavid1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (48, 'aliciavid1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (49, 'aliciavid1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (50, 'aliciavid1', 'mov', 1);
INSERT INTO public."gestionVideos_tbl_videos" (id, nombre, extension, size) VALUES (51, 'aliciavid2', 'mpg4', 2);


--
-- TOC entry 3475 (class 0 OID 16601)
-- Dependencies: 214
-- Data for Name: tbl_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('ma', 'qwety1');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Maria', 'qwrtt2');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Maria A', 'qwert2');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Maria A', 'qwerty1');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Maria A', 'qwery1');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Nor', 'qwety3');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Maria P', 'qwerty4');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Maria', 'qwetyy6');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Maria', 'qrtu5');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Sonia', 'qryu8');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Sonia P', 'asdt9');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Mar', 'qwetyu78');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('mar', 'ghu1');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Mari', 'hju7');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Kio', 'kio9');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('KioA', 'kio8');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('rei', 'rei1');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Guy', 'gugu7');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Sofi', 'ertyi9');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('UsuarioA', 'userA');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Alicia', 'qwerty');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Alicia A', 'qwert3');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Alicia', 'alicia1');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Alicia D', 'alicia2');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Alicia Tres', 'alicia3');
INSERT INTO public.tbl_usuarios (nombre, id) VALUES ('Alicia Dos', 'qwerty2');


--
-- TOC entry 3497 (class 0 OID 16812)
-- Dependencies: 236
-- Data for Name: tbl_usuarios_videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('qrtu5', 3);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('qryu8', 4);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('asdt9', 5);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('asdt9', 6);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('kio8', 7);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('rei1', 8);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('gugu7', 9);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('ertyi9', 10);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('userA', 11);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('qwerty', 12);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('qwert3', 13);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('qwert3', 14);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('qwert3', 15);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('alicia1', 16);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('alicia2', 17);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('alicia3', 18);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('alicia3', 19);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('alicia3', 20);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('alicia3', 21);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('alicia3', 22);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('alicia3', 23);
INSERT INTO public.tbl_usuarios_videos (id_user, id_video) VALUES ('qwerty2', 24);


--
-- TOC entry 3496 (class 0 OID 16804)
-- Dependencies: 235
-- Data for Name: tbl_videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (1, 'Vid2', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (2, 'videoa', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (3, 'vido1', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (4, 'mov1', 'mpg', 2);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (5, 'mov1', 'mpg', 2);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (6, 'mov2', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (7, 'kio1', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (8, 're1', 'mov', 2);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (9, 'gu1', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (10, 'muevete1', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (11, 'UsarioVidA', 'mov', 2);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (12, 'Video1', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (13, 'Video1', '2', 2);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (14, 'Video9', 'mov', 2);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (15, 'Video9', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (16, 'Video10', 'mov', 2);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (17, 'Video11', 'mov', 2);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (18, 'Video12', 'mov', 3);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (19, 'Video14', 'mov', 3);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (20, 'Video14', 'mov', 2);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (21, 'Video15', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (22, 'Video16', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (23, 'Video20', 'mov', 1);
INSERT INTO public.tbl_videos (id, nombre, extension, size) VALUES (24, 'Video30', 'mpg4', 2);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 219
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 227
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 225
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 229
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 231
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 217
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 215
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 240
-- Name: gestionVideos_tbl_usuarios_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public."gestionVideos_tbl_usuarios_videos_id_seq"', 30, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 238
-- Name: gestionVideos_tbl_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser
--

SELECT pg_catalog.setval('public."gestionVideos_tbl_videos_id_seq"', 51, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 234
-- Name: tbl_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_videos_id_seq', 24, true);


--
-- TOC entry 3274 (class 2606 OID 16778)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3279 (class 2606 OID 16708)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3282 (class 2606 OID 16674)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 16665)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 16699)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3271 (class 2606 OID 16658)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 16690)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 16723)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3284 (class 2606 OID 16681)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 16697)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 16737)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3287 (class 2606 OID 16773)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3302 (class 2606 OID 16759)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 16651)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3266 (class 2606 OID 16649)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 16642)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 16786)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3312 (class 2606 OID 17047)
-- Name: gestionVideos_tbl_usuarios gestionVideos_tbl_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public."gestionVideos_tbl_usuarios"
    ADD CONSTRAINT "gestionVideos_tbl_usuarios_pkey" PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 17059)
-- Name: gestionVideos_tbl_usuarios_videos gestionVideos_tbl_usuarios_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public."gestionVideos_tbl_usuarios_videos"
    ADD CONSTRAINT "gestionVideos_tbl_usuarios_videos_pkey" PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 17053)
-- Name: gestionVideos_tbl_videos gestionVideos_tbl_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public."gestionVideos_tbl_videos"
    ADD CONSTRAINT "gestionVideos_tbl_videos_pkey" PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 16606)
-- Name: tbl_usuarios tbl_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_usuarios
    ADD CONSTRAINT tbl_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 16811)
-- Name: tbl_videos tbl_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_videos
    ADD CONSTRAINT tbl_videos_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 1259 OID 16779)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3277 (class 1259 OID 16719)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3280 (class 1259 OID 16720)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3267 (class 1259 OID 16705)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3288 (class 1259 OID 16735)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3291 (class 1259 OID 16734)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3294 (class 1259 OID 16749)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3297 (class 1259 OID 16748)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3285 (class 1259 OID 16774)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3300 (class 1259 OID 16770)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3303 (class 1259 OID 16771)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3304 (class 1259 OID 16788)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3307 (class 1259 OID 16787)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3310 (class 1259 OID 17060)
-- Name: gestionVideos_tbl_usuarios_id_6ad778cd_like; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX "gestionVideos_tbl_usuarios_id_6ad778cd_like" ON public."gestionVideos_tbl_usuarios" USING btree (id varchar_pattern_ops);


--
-- TOC entry 3315 (class 1259 OID 17071)
-- Name: gestionVideos_tbl_usuarios_videos_id_user_id_58f7b11a; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX "gestionVideos_tbl_usuarios_videos_id_user_id_58f7b11a" ON public."gestionVideos_tbl_usuarios_videos" USING btree (id_user_id);


--
-- TOC entry 3316 (class 1259 OID 17072)
-- Name: gestionVideos_tbl_usuarios_videos_id_user_id_58f7b11a_like; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX "gestionVideos_tbl_usuarios_videos_id_user_id_58f7b11a_like" ON public."gestionVideos_tbl_usuarios_videos" USING btree (id_user_id varchar_pattern_ops);


--
-- TOC entry 3317 (class 1259 OID 17073)
-- Name: gestionVideos_tbl_usuarios_videos_id_video_id_7f08ea0e; Type: INDEX; Schema: public; Owner: webuser
--

CREATE INDEX "gestionVideos_tbl_usuarios_videos_id_video_id_7f08ea0e" ON public."gestionVideos_tbl_usuarios_videos" USING btree (id_video_id);


--
-- TOC entry 3321 (class 2606 OID 16714)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3322 (class 2606 OID 16709)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3320 (class 2606 OID 16700)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3323 (class 2606 OID 16729)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3324 (class 2606 OID 16724)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3325 (class 2606 OID 16743)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3326 (class 2606 OID 16738)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3327 (class 2606 OID 16760)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3328 (class 2606 OID 16765)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3331 (class 2606 OID 17061)
-- Name: gestionVideos_tbl_usuarios_videos gestionVideos_tbl_us_id_user_id_58f7b11a_fk_gestionVi; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public."gestionVideos_tbl_usuarios_videos"
    ADD CONSTRAINT "gestionVideos_tbl_us_id_user_id_58f7b11a_fk_gestionVi" FOREIGN KEY (id_user_id) REFERENCES public."gestionVideos_tbl_usuarios"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3332 (class 2606 OID 17066)
-- Name: gestionVideos_tbl_usuarios_videos gestionVideos_tbl_us_id_video_id_7f08ea0e_fk_gestionVi; Type: FK CONSTRAINT; Schema: public; Owner: webuser
--

ALTER TABLE ONLY public."gestionVideos_tbl_usuarios_videos"
    ADD CONSTRAINT "gestionVideos_tbl_us_id_video_id_7f08ea0e_fk_gestionVi" FOREIGN KEY (id_video_id) REFERENCES public."gestionVideos_tbl_videos"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3329 (class 2606 OID 16816)
-- Name: tbl_usuarios_videos tbl_usuarios_videos_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_usuarios_videos
    ADD CONSTRAINT tbl_usuarios_videos_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.tbl_usuarios(id);


--
-- TOC entry 3330 (class 2606 OID 16821)
-- Name: tbl_usuarios_videos tbl_usuarios_videos_id_video_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_usuarios_videos
    ADD CONSTRAINT tbl_usuarios_videos_id_video_fkey FOREIGN KEY (id_video) REFERENCES public.tbl_videos(id);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 3508
-- Name: DATABASE pro_gol; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE pro_gol TO webuser;


-- Completed on 2023-07-22 06:32:37

--
-- PostgreSQL database dump complete
--

