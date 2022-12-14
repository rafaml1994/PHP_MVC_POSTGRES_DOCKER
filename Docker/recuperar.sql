PGDMP     2                
    z         	   recuperar    14.2 (Debian 14.2-1.pgdg110+1)    14.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    19334 	   recuperar    DATABASE     ]   CREATE DATABASE recuperar WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE recuperar;
                admin    false            ?            1259    19451    alumnos    TABLE     ?   CREATE TABLE public.alumnos (
    idprofesor integer,
    idalumno integer NOT NULL,
    usuario character varying(50),
    "contraseña" character varying(50),
    dni character varying(9)
);
    DROP TABLE public.alumnos;
       public         heap    admin    false            ?            1259    19450    alumnos_idalumno_seq    SEQUENCE     ?   CREATE SEQUENCE public.alumnos_idalumno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.alumnos_idalumno_seq;
       public          admin    false    211                       0    0    alumnos_idalumno_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.alumnos_idalumno_seq OWNED BY public.alumnos.idalumno;
          public          admin    false    210            ?            1259    19574 	   calificar    TABLE     ?   CREATE TABLE public.calificar (
    idcalificar integer NOT NULL,
    idalumno integer,
    usabilidad double precision,
    codigo double precision,
    total double precision,
    votar integer
);
    DROP TABLE public.calificar;
       public         heap    admin    false            ?            1259    19573    calificar_idcalificar_seq    SEQUENCE     ?   CREATE SEQUENCE public.calificar_idcalificar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.calificar_idcalificar_seq;
       public          admin    false    214                       0    0    calificar_idcalificar_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.calificar_idcalificar_seq OWNED BY public.calificar.idcalificar;
          public          admin    false    213            ?            1259    19585    grupo    TABLE     j   CREATE TABLE public.grupo (
    idgrupo integer,
    idalumno integer,
    grupo character varying(20)
);
    DROP TABLE public.grupo;
       public         heap    admin    false            ?            1259    19462    grupos    TABLE     U   CREATE TABLE public.grupos (
    idprofesor integer,
    idgrupo integer NOT NULL
);
    DROP TABLE public.grupos;
       public         heap    admin    false            ?            1259    19335 
   profesores    TABLE     ?   CREATE TABLE public.profesores (
    idprofesor integer NOT NULL,
    usuario character varying(50),
    "contraseña" character varying(500),
    rol boolean,
    cookies integer
);
    DROP TABLE public.profesores;
       public         heap    admin    false            p           2604    19454    alumnos idalumno    DEFAULT     t   ALTER TABLE ONLY public.alumnos ALTER COLUMN idalumno SET DEFAULT nextval('public.alumnos_idalumno_seq'::regclass);
 ?   ALTER TABLE public.alumnos ALTER COLUMN idalumno DROP DEFAULT;
       public          admin    false    210    211    211            q           2604    19577    calificar idcalificar    DEFAULT     ~   ALTER TABLE ONLY public.calificar ALTER COLUMN idcalificar SET DEFAULT nextval('public.calificar_idcalificar_seq'::regclass);
 D   ALTER TABLE public.calificar ALTER COLUMN idcalificar DROP DEFAULT;
       public          admin    false    214    213    214                      0    19451    alumnos 
   TABLE DATA           T   COPY public.alumnos (idprofesor, idalumno, usuario, "contraseña", dni) FROM stdin;
    public          admin    false    211   ?"                 0    19574 	   calificar 
   TABLE DATA           \   COPY public.calificar (idcalificar, idalumno, usabilidad, codigo, total, votar) FROM stdin;
    public          admin    false    214   #                 0    19585    grupo 
   TABLE DATA           9   COPY public.grupo (idgrupo, idalumno, grupo) FROM stdin;
    public          admin    false    215   :#                 0    19462    grupos 
   TABLE DATA           5   COPY public.grupos (idprofesor, idgrupo) FROM stdin;
    public          admin    false    212   m#       
          0    19335 
   profesores 
   TABLE DATA           V   COPY public.profesores (idprofesor, usuario, "contraseña", rol, cookies) FROM stdin;
    public          admin    false    209   ?#                  0    0    alumnos_idalumno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.alumnos_idalumno_seq', 5, true);
          public          admin    false    210                       0    0    calificar_idcalificar_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.calificar_idcalificar_seq', 4, true);
          public          admin    false    213            u           2606    19456    alumnos alumnos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (idalumno);
 >   ALTER TABLE ONLY public.alumnos DROP CONSTRAINT alumnos_pkey;
       public            admin    false    211            y           2606    19579    calificar calificar_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.calificar
    ADD CONSTRAINT calificar_pkey PRIMARY KEY (idcalificar);
 B   ALTER TABLE ONLY public.calificar DROP CONSTRAINT calificar_pkey;
       public            admin    false    214            w           2606    19466    grupos grupos_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (idgrupo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_pkey;
       public            admin    false    212            s           2606    19341    profesores profesores_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (idprofesor);
 D   ALTER TABLE ONLY public.profesores DROP CONSTRAINT profesores_pkey;
       public            admin    false    209            z           2606    19457    alumnos alumnos_idprofesor_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_idprofesor_fkey FOREIGN KEY (idprofesor) REFERENCES public.profesores(idprofesor);
 I   ALTER TABLE ONLY public.alumnos DROP CONSTRAINT alumnos_idprofesor_fkey;
       public          admin    false    211    209    3187            |           2606    19580 !   calificar calificar_idalumno_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.calificar
    ADD CONSTRAINT calificar_idalumno_fkey FOREIGN KEY (idalumno) REFERENCES public.alumnos(idalumno);
 K   ALTER TABLE ONLY public.calificar DROP CONSTRAINT calificar_idalumno_fkey;
       public          admin    false    3189    214    211            }           2606    19588    grupo grupo_idalumno_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_idalumno_fkey FOREIGN KEY (idalumno) REFERENCES public.alumnos(idalumno);
 C   ALTER TABLE ONLY public.grupo DROP CONSTRAINT grupo_idalumno_fkey;
       public          admin    false    3189    215    211            ~           2606    19593    grupo grupo_idgrupo_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_idgrupo_fkey FOREIGN KEY (idgrupo) REFERENCES public.grupos(idgrupo);
 B   ALTER TABLE ONLY public.grupo DROP CONSTRAINT grupo_idgrupo_fkey;
       public          admin    false    212    3191    215            {           2606    19467    grupos grupos_idprofesor_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_idprofesor_fkey FOREIGN KEY (idprofesor) REFERENCES public.profesores(idprofesor);
 G   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_idprofesor_fkey;
       public          admin    false    209    3187    212               ?   x?3?4?L?)???(*MMJ,6?4426?4?G.#NcTF?*LPUc?0?,?ȡK??qqq 8? ?         "   x?3?4?4?@.#Nc8ۘ??6?4??c???? ??         #   x?3?4?t/*-?W0?2?4Ab!????=... Rf#            x?3?4?2?4bc?=... "      
   (   x?3?LN,?M???LL????,?44?2?r`B\1z\\\ %??     