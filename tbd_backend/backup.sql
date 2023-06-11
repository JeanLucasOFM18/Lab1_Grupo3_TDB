PGDMP     4    "                {            tbd #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1) #   14.8 (Ubuntu 14.8-0ubuntu0.22.04.1) ]    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25998    tbd    DATABASE     X   CREATE DATABASE tbd WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_CL.UTF-8';
    DROP DATABASE tbd;
                curso    false                        3079    27213    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false                       0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2            �            1259    26124    eme_habilidad    TABLE     t   CREATE TABLE public.eme_habilidad (
    id integer NOT NULL,
    id_emergencia integer,
    id_habilidad integer
);
 !   DROP TABLE public.eme_habilidad;
       public         heap    curso    false            �            1259    26123    eme_habilidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.eme_habilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.eme_habilidad_id_seq;
       public          curso    false    225                       0    0    eme_habilidad_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.eme_habilidad_id_seq OWNED BY public.eme_habilidad.id;
          public          curso    false    224            �            1259    26108 
   emergencia    TABLE     �   CREATE TABLE public.emergencia (
    id integer NOT NULL,
    nombre character varying(100),
    descripcion character varying(400),
    fecha_inicio date,
    fecha_termino date,
    id_institucion integer,
    ubicacion public.geography(Point,4326)
);
    DROP TABLE public.emergencia;
       public         heap    curso    false    2    2    2    2    2    2    2    2            �            1259    26107    emergencia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.emergencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.emergencia_id_seq;
       public          curso    false    223                       0    0    emergencia_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.emergencia_id_seq OWNED BY public.emergencia.id;
          public          curso    false    222            �            1259    26023    estado_tarea    TABLE     `   CREATE TABLE public.estado_tarea (
    id integer NOT NULL,
    estado character varying(50)
);
     DROP TABLE public.estado_tarea;
       public         heap    curso    false            �            1259    26022    estado_tarea_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estado_tarea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.estado_tarea_id_seq;
       public          curso    false    211                       0    0    estado_tarea_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.estado_tarea_id_seq OWNED BY public.estado_tarea.id;
          public          curso    false    210            �            1259    26030 	   habilidad    TABLE     a   CREATE TABLE public.habilidad (
    id integer NOT NULL,
    habilidad character varying(100)
);
    DROP TABLE public.habilidad;
       public         heap    curso    false            �            1259    26029    habilidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.habilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.habilidad_id_seq;
       public          curso    false    213                       0    0    habilidad_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.habilidad_id_seq OWNED BY public.habilidad.id;
          public          curso    false    212            �            1259    26037    institucion    TABLE     �   CREATE TABLE public.institucion (
    id integer NOT NULL,
    nombre character varying(100),
    direccion character varying(100),
    contacto character varying(100)
);
    DROP TABLE public.institucion;
       public         heap    curso    false            �            1259    26036    institucion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.institucion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.institucion_id_seq;
       public          curso    false    215                       0    0    institucion_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.institucion_id_seq OWNED BY public.institucion.id;
          public          curso    false    214            �            1259    26158    ranking    TABLE        CREATE TABLE public.ranking (
    id integer NOT NULL,
    id_voluntario integer,
    id_tarea integer,
    puntaje integer
);
    DROP TABLE public.ranking;
       public         heap    curso    false            �            1259    26157    ranking_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ranking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ranking_id_seq;
       public          curso    false    229                       0    0    ranking_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ranking_id_seq OWNED BY public.ranking.id;
          public          curso    false    228            �            1259    26082    tarea    TABLE     �   CREATE TABLE public.tarea (
    id integer NOT NULL,
    nombre character varying(100),
    descripcion character varying(300),
    cantidad_requeridos integer,
    cantidad_inscritos integer,
    id_emergencia integer,
    id_estado integer
);
    DROP TABLE public.tarea;
       public         heap    curso    false            �            1259    26141    tarea_habilidad    TABLE     u   CREATE TABLE public.tarea_habilidad (
    id integer NOT NULL,
    id_tarea integer,
    id_eme_habilidad integer
);
 #   DROP TABLE public.tarea_habilidad;
       public         heap    curso    false            �            1259    26140    tarea_habilidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tarea_habilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tarea_habilidad_id_seq;
       public          curso    false    227            	           0    0    tarea_habilidad_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tarea_habilidad_id_seq OWNED BY public.tarea_habilidad.id;
          public          curso    false    226            �            1259    26081    tarea_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tarea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tarea_id_seq;
       public          curso    false    221            
           0    0    tarea_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tarea_id_seq OWNED BY public.tarea.id;
          public          curso    false    220            �            1259    28263    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    rol character varying(255)
);
    DROP TABLE public.usuario;
       public         heap    curso    false            �            1259    28262    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          curso    false    236                       0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          curso    false    235            �            1259    26058    vol_habilidad    TABLE     t   CREATE TABLE public.vol_habilidad (
    id integer NOT NULL,
    id_voluntario integer,
    id_habilidad integer
);
 !   DROP TABLE public.vol_habilidad;
       public         heap    curso    false            �            1259    26057    vol_habilidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vol_habilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.vol_habilidad_id_seq;
       public          curso    false    219                       0    0    vol_habilidad_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.vol_habilidad_id_seq OWNED BY public.vol_habilidad.id;
          public          curso    false    218            �            1259    26051 
   voluntario    TABLE     �   CREATE TABLE public.voluntario (
    id integer NOT NULL,
    nombre character varying(100),
    fecha_nacimiento date,
    ubicacion public.geography(Point,4326),
    latitud double precision,
    longitud double precision
);
    DROP TABLE public.voluntario;
       public         heap    curso    false    2    2    2    2    2    2    2    2            �            1259    26050    voluntario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.voluntario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.voluntario_id_seq;
       public          curso    false    217                       0    0    voluntario_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.voluntario_id_seq OWNED BY public.voluntario.id;
          public          curso    false    216            0           2604    26127    eme_habilidad id    DEFAULT     t   ALTER TABLE ONLY public.eme_habilidad ALTER COLUMN id SET DEFAULT nextval('public.eme_habilidad_id_seq'::regclass);
 ?   ALTER TABLE public.eme_habilidad ALTER COLUMN id DROP DEFAULT;
       public          curso    false    225    224    225            /           2604    26111    emergencia id    DEFAULT     n   ALTER TABLE ONLY public.emergencia ALTER COLUMN id SET DEFAULT nextval('public.emergencia_id_seq'::regclass);
 <   ALTER TABLE public.emergencia ALTER COLUMN id DROP DEFAULT;
       public          curso    false    223    222    223            )           2604    26026    estado_tarea id    DEFAULT     r   ALTER TABLE ONLY public.estado_tarea ALTER COLUMN id SET DEFAULT nextval('public.estado_tarea_id_seq'::regclass);
 >   ALTER TABLE public.estado_tarea ALTER COLUMN id DROP DEFAULT;
       public          curso    false    210    211    211            *           2604    26033    habilidad id    DEFAULT     l   ALTER TABLE ONLY public.habilidad ALTER COLUMN id SET DEFAULT nextval('public.habilidad_id_seq'::regclass);
 ;   ALTER TABLE public.habilidad ALTER COLUMN id DROP DEFAULT;
       public          curso    false    212    213    213            +           2604    26040    institucion id    DEFAULT     p   ALTER TABLE ONLY public.institucion ALTER COLUMN id SET DEFAULT nextval('public.institucion_id_seq'::regclass);
 =   ALTER TABLE public.institucion ALTER COLUMN id DROP DEFAULT;
       public          curso    false    215    214    215            2           2604    26161 
   ranking id    DEFAULT     h   ALTER TABLE ONLY public.ranking ALTER COLUMN id SET DEFAULT nextval('public.ranking_id_seq'::regclass);
 9   ALTER TABLE public.ranking ALTER COLUMN id DROP DEFAULT;
       public          curso    false    229    228    229            .           2604    26085    tarea id    DEFAULT     d   ALTER TABLE ONLY public.tarea ALTER COLUMN id SET DEFAULT nextval('public.tarea_id_seq'::regclass);
 7   ALTER TABLE public.tarea ALTER COLUMN id DROP DEFAULT;
       public          curso    false    220    221    221            1           2604    26144    tarea_habilidad id    DEFAULT     x   ALTER TABLE ONLY public.tarea_habilidad ALTER COLUMN id SET DEFAULT nextval('public.tarea_habilidad_id_seq'::regclass);
 A   ALTER TABLE public.tarea_habilidad ALTER COLUMN id DROP DEFAULT;
       public          curso    false    227    226    227            4           2604    28266 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          curso    false    235    236    236            -           2604    26061    vol_habilidad id    DEFAULT     t   ALTER TABLE ONLY public.vol_habilidad ALTER COLUMN id SET DEFAULT nextval('public.vol_habilidad_id_seq'::regclass);
 ?   ALTER TABLE public.vol_habilidad ALTER COLUMN id DROP DEFAULT;
       public          curso    false    218    219    219            ,           2604    26054    voluntario id    DEFAULT     n   ALTER TABLE ONLY public.voluntario ALTER COLUMN id SET DEFAULT nextval('public.voluntario_id_seq'::regclass);
 <   ALTER TABLE public.voluntario ALTER COLUMN id DROP DEFAULT;
       public          curso    false    217    216    217            �          0    26124    eme_habilidad 
   TABLE DATA           H   COPY public.eme_habilidad (id, id_emergencia, id_habilidad) FROM stdin;
    public          curso    false    225   �i       �          0    26108 
   emergencia 
   TABLE DATA           u   COPY public.emergencia (id, nombre, descripcion, fecha_inicio, fecha_termino, id_institucion, ubicacion) FROM stdin;
    public          curso    false    223   �i       �          0    26023    estado_tarea 
   TABLE DATA           2   COPY public.estado_tarea (id, estado) FROM stdin;
    public          curso    false    211   �j       �          0    26030 	   habilidad 
   TABLE DATA           2   COPY public.habilidad (id, habilidad) FROM stdin;
    public          curso    false    213   �j       �          0    26037    institucion 
   TABLE DATA           F   COPY public.institucion (id, nombre, direccion, contacto) FROM stdin;
    public          curso    false    215   _k       �          0    26158    ranking 
   TABLE DATA           G   COPY public.ranking (id, id_voluntario, id_tarea, puntaje) FROM stdin;
    public          curso    false    229   �k       (          0    27523    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          curso    false    231   �k       �          0    26082    tarea 
   TABLE DATA           {   COPY public.tarea (id, nombre, descripcion, cantidad_requeridos, cantidad_inscritos, id_emergencia, id_estado) FROM stdin;
    public          curso    false    221   �k       �          0    26141    tarea_habilidad 
   TABLE DATA           I   COPY public.tarea_habilidad (id, id_tarea, id_eme_habilidad) FROM stdin;
    public          curso    false    227   Jl       �          0    28263    usuario 
   TABLE DATA           >   COPY public.usuario (id, username, password, rol) FROM stdin;
    public          curso    false    236   gl       �          0    26058    vol_habilidad 
   TABLE DATA           H   COPY public.vol_habilidad (id, id_voluntario, id_habilidad) FROM stdin;
    public          curso    false    219   m       �          0    26051 
   voluntario 
   TABLE DATA           `   COPY public.voluntario (id, nombre, fecha_nacimiento, ubicacion, latitud, longitud) FROM stdin;
    public          curso    false    217   (m                  0    0    eme_habilidad_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.eme_habilidad_id_seq', 5, true);
          public          curso    false    224                       0    0    emergencia_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.emergencia_id_seq', 2, true);
          public          curso    false    222                       0    0    estado_tarea_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.estado_tarea_id_seq', 3, true);
          public          curso    false    210                       0    0    habilidad_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.habilidad_id_seq', 5, true);
          public          curso    false    212                       0    0    institucion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.institucion_id_seq', 1, true);
          public          curso    false    214                       0    0    ranking_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ranking_id_seq', 1, false);
          public          curso    false    228                       0    0    tarea_habilidad_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tarea_habilidad_id_seq', 1, false);
          public          curso    false    226                       0    0    tarea_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tarea_id_seq', 1, true);
          public          curso    false    220                       0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.usuario_id_seq', 2, true);
          public          curso    false    235                       0    0    vol_habilidad_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.vol_habilidad_id_seq', 1, false);
          public          curso    false    218                       0    0    voluntario_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.voluntario_id_seq', 3, true);
          public          curso    false    216            D           2606    26129     eme_habilidad eme_habilidad_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT eme_habilidad_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.eme_habilidad DROP CONSTRAINT eme_habilidad_pkey;
       public            curso    false    225            B           2606    26115    emergencia emergencia_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT emergencia_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.emergencia DROP CONSTRAINT emergencia_pkey;
       public            curso    false    223            6           2606    26028    estado_tarea estado_tarea_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.estado_tarea
    ADD CONSTRAINT estado_tarea_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.estado_tarea DROP CONSTRAINT estado_tarea_pkey;
       public            curso    false    211            8           2606    26035    habilidad habilidad_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.habilidad
    ADD CONSTRAINT habilidad_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.habilidad DROP CONSTRAINT habilidad_pkey;
       public            curso    false    213            :           2606    26042    institucion institucion_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.institucion DROP CONSTRAINT institucion_pkey;
       public            curso    false    215            H           2606    26163    ranking ranking_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ranking DROP CONSTRAINT ranking_pkey;
       public            curso    false    229            F           2606    26146 $   tarea_habilidad tarea_habilidad_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT tarea_habilidad_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tarea_habilidad DROP CONSTRAINT tarea_habilidad_pkey;
       public            curso    false    227            @           2606    26087    tarea tarea_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_pkey;
       public            curso    false    221            L           2606    28270    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            curso    false    236            >           2606    26063     vol_habilidad vol_habilidad_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT vol_habilidad_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.vol_habilidad DROP CONSTRAINT vol_habilidad_pkey;
       public            curso    false    219            <           2606    26056    voluntario voluntario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.voluntario DROP CONSTRAINT voluntario_pkey;
       public            curso    false    217            P           2606    26130 .   eme_habilidad eme_habilidad_id_emergencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT eme_habilidad_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencia(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.eme_habilidad DROP CONSTRAINT eme_habilidad_id_emergencia_fkey;
       public          curso    false    4162    225    223            Q           2606    26135 -   eme_habilidad eme_habilidad_id_habilidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT eme_habilidad_id_habilidad_fkey FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.eme_habilidad DROP CONSTRAINT eme_habilidad_id_habilidad_fkey;
       public          curso    false    213    225    4152            O           2606    26116 )   emergencia emergencia_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT emergencia_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.institucion(id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.emergencia DROP CONSTRAINT emergencia_id_institucion_fkey;
       public          curso    false    223    4154    215            U           2606    26169    ranking ranking_id_tarea_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_id_tarea_fkey FOREIGN KEY (id_tarea) REFERENCES public.tarea(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.ranking DROP CONSTRAINT ranking_id_tarea_fkey;
       public          curso    false    221    229    4160            T           2606    26164 "   ranking ranking_id_voluntario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_id_voluntario_fkey FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.ranking DROP CONSTRAINT ranking_id_voluntario_fkey;
       public          curso    false    217    4156    229            S           2606    26152 5   tarea_habilidad tarea_habilidad_id_eme_habilidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT tarea_habilidad_id_eme_habilidad_fkey FOREIGN KEY (id_eme_habilidad) REFERENCES public.eme_habilidad(id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.tarea_habilidad DROP CONSTRAINT tarea_habilidad_id_eme_habilidad_fkey;
       public          curso    false    225    227    4164            R           2606    26147 -   tarea_habilidad tarea_habilidad_id_tarea_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT tarea_habilidad_id_tarea_fkey FOREIGN KEY (id_tarea) REFERENCES public.tarea(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.tarea_habilidad DROP CONSTRAINT tarea_habilidad_id_tarea_fkey;
       public          curso    false    227    221    4160            N           2606    26069 -   vol_habilidad vol_habilidad_id_habilidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT vol_habilidad_id_habilidad_fkey FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.vol_habilidad DROP CONSTRAINT vol_habilidad_id_habilidad_fkey;
       public          curso    false    213    219    4152            M           2606    26064 .   vol_habilidad vol_habilidad_id_voluntario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT vol_habilidad_id_voluntario_fkey FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.vol_habilidad DROP CONSTRAINT vol_habilidad_id_voluntario_fkey;
       public          curso    false    219    217    4156            �      x������ � �      �   �   x���A
�0E��)r��L2��2MZp/�ܔ6Hh���'�^�"v)����[<D��ɧ��]h2�]
K��(z/�V�o/A�t�>�g@��u���N��T�b��B��ҙ�4�t�ږ�>%?ͷYa�=����6v���}�ũ�Y�PZ�qN���U�Lm�,)C��;��*�S�      �   3   x�3�H�K�L�+I�2�t�S((�ON-��2�t��K�ɬJL������ (p�      �   �   x�U���@D�q[�mpq�F���W�Bt�8QBc!p�yfޛmw65�$��<DdZ��A"��ϓ!�V��7�F��s�ĥmq���9��P1v��J��:?���E�l*K�T��kϢ��-�e$���p� ���E�      �   1   x�3�t.*�R��J�t�M���K,V01��45�4426153����� ��
Y      �      x������ � �      (      x������ � �      �   `   x�u̻�0��ڞ"�\�h,�"�-9��( �U�Nh�\4���EW�jW��~�lެ�l*�%�#ƛ��X"�:iD��ЇD �3�/0�      �      x������ � �      �   �   x�5�K�0 �u{�h�,!�"�$�� 6T�'�ӻ�9��$�B�(]S��_�~�4��x�q�.G����Ĝ���)���Y�A7�����aLr~�?��v�p4���%�G���z*�*f��zGY[{;������RJ�f�/^      �      x������ � �      �   �   x���9�0D��Sp���K�SPp�4D�@"��B�+g�<�L��Ɠ'���q��sݻO���^�� �{�^�jk����DG�S$E֔��QU%�(�-����&n�
!4:��ڙ�s�[��?����E?�}     