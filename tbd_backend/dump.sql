PGDMP     #                    {            tbd-db    12.14    12.14 ]    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    89230    tbd-db    DATABASE     �   CREATE DATABASE "tbd-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Chile.1252' LC_CTYPE = 'Spanish_Chile.1252';
    DROP DATABASE "tbd-db";
                postgres    false                        3079    89231    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false                        0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2            �            1259    90263    eme_habilidad    TABLE     t   CREATE TABLE public.eme_habilidad (
    id integer NOT NULL,
    id_emergencia integer,
    id_habilidad integer
);
 !   DROP TABLE public.eme_habilidad;
       public         heap    postgres    false            �            1259    90266    eme_habilidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.eme_habilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.eme_habilidad_id_seq;
       public          postgres    false    212                       0    0    eme_habilidad_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.eme_habilidad_id_seq OWNED BY public.eme_habilidad.id;
          public          postgres    false    213            �            1259    90268 
   emergencia    TABLE     J  CREATE TABLE public.emergencia (
    id integer NOT NULL,
    nombre character varying(100),
    descripcion character varying(400),
    fecha_inicio date,
    fecha_termino date,
    id_institucion integer,
    ubicacion public.geography(Point,4326),
    region character varying(100) DEFAULT 'Sin definir'::character varying
);
    DROP TABLE public.emergencia;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �            1259    90274    emergencia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.emergencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.emergencia_id_seq;
       public          postgres    false    214                       0    0    emergencia_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.emergencia_id_seq OWNED BY public.emergencia.id;
          public          postgres    false    215            �            1259    90276    estado_tarea    TABLE     `   CREATE TABLE public.estado_tarea (
    id integer NOT NULL,
    estado character varying(50)
);
     DROP TABLE public.estado_tarea;
       public         heap    postgres    false            �            1259    90279    estado_tarea_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estado_tarea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.estado_tarea_id_seq;
       public          postgres    false    216                       0    0    estado_tarea_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.estado_tarea_id_seq OWNED BY public.estado_tarea.id;
          public          postgres    false    217            �            1259    90281 	   habilidad    TABLE     a   CREATE TABLE public.habilidad (
    id integer NOT NULL,
    habilidad character varying(100)
);
    DROP TABLE public.habilidad;
       public         heap    postgres    false            �            1259    90284    habilidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.habilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.habilidad_id_seq;
       public          postgres    false    218                       0    0    habilidad_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.habilidad_id_seq OWNED BY public.habilidad.id;
          public          postgres    false    219            �            1259    90286    institucion    TABLE     �   CREATE TABLE public.institucion (
    id integer NOT NULL,
    nombre character varying(100),
    direccion character varying(100),
    contacto character varying(100)
);
    DROP TABLE public.institucion;
       public         heap    postgres    false            �            1259    90289    institucion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.institucion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.institucion_id_seq;
       public          postgres    false    220                       0    0    institucion_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.institucion_id_seq OWNED BY public.institucion.id;
          public          postgres    false    221            �            1259    90291    ranking    TABLE        CREATE TABLE public.ranking (
    id integer NOT NULL,
    id_voluntario integer,
    id_tarea integer,
    puntaje integer
);
    DROP TABLE public.ranking;
       public         heap    postgres    false            �            1259    90294    ranking_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ranking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ranking_id_seq;
       public          postgres    false    222                       0    0    ranking_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ranking_id_seq OWNED BY public.ranking.id;
          public          postgres    false    223            �            1259    90296    tarea    TABLE     �   CREATE TABLE public.tarea (
    id integer NOT NULL,
    nombre character varying(100),
    descripcion character varying(300),
    cantidad_requeridos integer,
    cantidad_inscritos integer,
    id_emergencia integer,
    id_estado integer
);
    DROP TABLE public.tarea;
       public         heap    postgres    false            �            1259    90299    tarea_habilidad    TABLE     u   CREATE TABLE public.tarea_habilidad (
    id integer NOT NULL,
    id_tarea integer,
    id_eme_habilidad integer
);
 #   DROP TABLE public.tarea_habilidad;
       public         heap    postgres    false            �            1259    90302    tarea_habilidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tarea_habilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tarea_habilidad_id_seq;
       public          postgres    false    225                       0    0    tarea_habilidad_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tarea_habilidad_id_seq OWNED BY public.tarea_habilidad.id;
          public          postgres    false    226            �            1259    90304    tarea_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tarea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tarea_id_seq;
       public          postgres    false    224                       0    0    tarea_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tarea_id_seq OWNED BY public.tarea.id;
          public          postgres    false    227            �            1259    90306    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    rol character varying(255)
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    90312    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    228            	           0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    229            �            1259    90314    vol_habilidad    TABLE     t   CREATE TABLE public.vol_habilidad (
    id integer NOT NULL,
    id_voluntario integer,
    id_habilidad integer
);
 !   DROP TABLE public.vol_habilidad;
       public         heap    postgres    false            �            1259    90317    vol_habilidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vol_habilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.vol_habilidad_id_seq;
       public          postgres    false    230            
           0    0    vol_habilidad_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.vol_habilidad_id_seq OWNED BY public.vol_habilidad.id;
          public          postgres    false    231            �            1259    90319 
   voluntario    TABLE     �   CREATE TABLE public.voluntario (
    id integer NOT NULL,
    nombre character varying(100),
    fecha_nacimiento date,
    ubicacion public.geography(Point,4326),
    latitud double precision,
    longitud double precision
);
    DROP TABLE public.voluntario;
       public         heap    postgres    false    2    2    2    2    2    2    2    2            �            1259    90325    voluntario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.voluntario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.voluntario_id_seq;
       public          postgres    false    232                       0    0    voluntario_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.voluntario_id_seq OWNED BY public.voluntario.id;
          public          postgres    false    233            4           2604    90327    eme_habilidad id    DEFAULT     t   ALTER TABLE ONLY public.eme_habilidad ALTER COLUMN id SET DEFAULT nextval('public.eme_habilidad_id_seq'::regclass);
 ?   ALTER TABLE public.eme_habilidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            5           2604    90328    emergencia id    DEFAULT     n   ALTER TABLE ONLY public.emergencia ALTER COLUMN id SET DEFAULT nextval('public.emergencia_id_seq'::regclass);
 <   ALTER TABLE public.emergencia ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            7           2604    90329    estado_tarea id    DEFAULT     r   ALTER TABLE ONLY public.estado_tarea ALTER COLUMN id SET DEFAULT nextval('public.estado_tarea_id_seq'::regclass);
 >   ALTER TABLE public.estado_tarea ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            8           2604    90330    habilidad id    DEFAULT     l   ALTER TABLE ONLY public.habilidad ALTER COLUMN id SET DEFAULT nextval('public.habilidad_id_seq'::regclass);
 ;   ALTER TABLE public.habilidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            9           2604    90331    institucion id    DEFAULT     p   ALTER TABLE ONLY public.institucion ALTER COLUMN id SET DEFAULT nextval('public.institucion_id_seq'::regclass);
 =   ALTER TABLE public.institucion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            :           2604    90332 
   ranking id    DEFAULT     h   ALTER TABLE ONLY public.ranking ALTER COLUMN id SET DEFAULT nextval('public.ranking_id_seq'::regclass);
 9   ALTER TABLE public.ranking ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            ;           2604    90333    tarea id    DEFAULT     d   ALTER TABLE ONLY public.tarea ALTER COLUMN id SET DEFAULT nextval('public.tarea_id_seq'::regclass);
 7   ALTER TABLE public.tarea ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    224            <           2604    90334    tarea_habilidad id    DEFAULT     x   ALTER TABLE ONLY public.tarea_habilidad ALTER COLUMN id SET DEFAULT nextval('public.tarea_habilidad_id_seq'::regclass);
 A   ALTER TABLE public.tarea_habilidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            =           2604    90335 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228            >           2604    90336    vol_habilidad id    DEFAULT     t   ALTER TABLE ONLY public.vol_habilidad ALTER COLUMN id SET DEFAULT nextval('public.vol_habilidad_id_seq'::regclass);
 ?   ALTER TABLE public.vol_habilidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230            ?           2604    90337    voluntario id    DEFAULT     n   ALTER TABLE ONLY public.voluntario ALTER COLUMN id SET DEFAULT nextval('public.voluntario_id_seq'::regclass);
 <   ALTER TABLE public.voluntario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232            �          0    90263    eme_habilidad 
   TABLE DATA           H   COPY public.eme_habilidad (id, id_emergencia, id_habilidad) FROM stdin;
    public          postgres    false    212   �j       �          0    90268 
   emergencia 
   TABLE DATA           }   COPY public.emergencia (id, nombre, descripcion, fecha_inicio, fecha_termino, id_institucion, ubicacion, region) FROM stdin;
    public          postgres    false    214   �j       �          0    90276    estado_tarea 
   TABLE DATA           2   COPY public.estado_tarea (id, estado) FROM stdin;
    public          postgres    false    216   �k       �          0    90281 	   habilidad 
   TABLE DATA           2   COPY public.habilidad (id, habilidad) FROM stdin;
    public          postgres    false    218   �k       �          0    90286    institucion 
   TABLE DATA           F   COPY public.institucion (id, nombre, direccion, contacto) FROM stdin;
    public          postgres    false    220   �l       �          0    90291    ranking 
   TABLE DATA           G   COPY public.ranking (id, id_voluntario, id_tarea, puntaje) FROM stdin;
    public          postgres    false    222   �l       2          0    89541    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    208   "m       �          0    90296    tarea 
   TABLE DATA           {   COPY public.tarea (id, nombre, descripcion, cantidad_requeridos, cantidad_inscritos, id_emergencia, id_estado) FROM stdin;
    public          postgres    false    224   ?m       �          0    90299    tarea_habilidad 
   TABLE DATA           I   COPY public.tarea_habilidad (id, id_tarea, id_eme_habilidad) FROM stdin;
    public          postgres    false    225   �n       �          0    90306    usuario 
   TABLE DATA           >   COPY public.usuario (id, username, password, rol) FROM stdin;
    public          postgres    false    228   o       �          0    90314    vol_habilidad 
   TABLE DATA           H   COPY public.vol_habilidad (id, id_voluntario, id_habilidad) FROM stdin;
    public          postgres    false    230   �o       �          0    90319 
   voluntario 
   TABLE DATA           `   COPY public.voluntario (id, nombre, fecha_nacimiento, ubicacion, latitud, longitud) FROM stdin;
    public          postgres    false    232   �o                  0    0    eme_habilidad_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.eme_habilidad_id_seq', 12, true);
          public          postgres    false    213                       0    0    emergencia_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.emergencia_id_seq', 5, true);
          public          postgres    false    215                       0    0    estado_tarea_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.estado_tarea_id_seq', 6, true);
          public          postgres    false    217                       0    0    habilidad_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.habilidad_id_seq', 15, true);
          public          postgres    false    219                       0    0    institucion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.institucion_id_seq', 2, true);
          public          postgres    false    221                       0    0    ranking_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ranking_id_seq', 1, false);
          public          postgres    false    223                       0    0    tarea_habilidad_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tarea_habilidad_id_seq', 1, false);
          public          postgres    false    226                       0    0    tarea_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tarea_id_seq', 1, true);
          public          postgres    false    227                       0    0    usuario_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuario_id_seq', 22, true);
          public          postgres    false    229                       0    0    vol_habilidad_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.vol_habilidad_id_seq', 1, false);
          public          postgres    false    231                       0    0    voluntario_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.voluntario_id_seq', 3, true);
          public          postgres    false    233            C           2606    90339     eme_habilidad eme_habilidad_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT eme_habilidad_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.eme_habilidad DROP CONSTRAINT eme_habilidad_pkey;
       public            postgres    false    212            E           2606    90341    emergencia emergencia_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT emergencia_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.emergencia DROP CONSTRAINT emergencia_pkey;
       public            postgres    false    214            G           2606    90343    estado_tarea estado_tarea_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.estado_tarea
    ADD CONSTRAINT estado_tarea_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.estado_tarea DROP CONSTRAINT estado_tarea_pkey;
       public            postgres    false    216            I           2606    90345    habilidad habilidad_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.habilidad
    ADD CONSTRAINT habilidad_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.habilidad DROP CONSTRAINT habilidad_pkey;
       public            postgres    false    218            K           2606    90347    institucion institucion_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.institucion DROP CONSTRAINT institucion_pkey;
       public            postgres    false    220            M           2606    90349    ranking ranking_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ranking DROP CONSTRAINT ranking_pkey;
       public            postgres    false    222            Q           2606    90351 $   tarea_habilidad tarea_habilidad_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT tarea_habilidad_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tarea_habilidad DROP CONSTRAINT tarea_habilidad_pkey;
       public            postgres    false    225            O           2606    90353    tarea tarea_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_pkey;
       public            postgres    false    224            S           2606    90355    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    228            U           2606    90357     vol_habilidad vol_habilidad_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT vol_habilidad_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.vol_habilidad DROP CONSTRAINT vol_habilidad_pkey;
       public            postgres    false    230            W           2606    90359    voluntario voluntario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.voluntario
    ADD CONSTRAINT voluntario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.voluntario DROP CONSTRAINT voluntario_pkey;
       public            postgres    false    232            X           2606    90360 .   eme_habilidad eme_habilidad_id_emergencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT eme_habilidad_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencia(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.eme_habilidad DROP CONSTRAINT eme_habilidad_id_emergencia_fkey;
       public          postgres    false    214    212    3653            Y           2606    90365 -   eme_habilidad eme_habilidad_id_habilidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.eme_habilidad
    ADD CONSTRAINT eme_habilidad_id_habilidad_fkey FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.eme_habilidad DROP CONSTRAINT eme_habilidad_id_habilidad_fkey;
       public          postgres    false    218    212    3657            Z           2606    90370 )   emergencia emergencia_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.emergencia
    ADD CONSTRAINT emergencia_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.institucion(id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.emergencia DROP CONSTRAINT emergencia_id_institucion_fkey;
       public          postgres    false    220    3659    214            [           2606    90375    ranking ranking_id_tarea_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_id_tarea_fkey FOREIGN KEY (id_tarea) REFERENCES public.tarea(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.ranking DROP CONSTRAINT ranking_id_tarea_fkey;
       public          postgres    false    224    222    3663            \           2606    90380 "   ranking ranking_id_voluntario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_id_voluntario_fkey FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.ranking DROP CONSTRAINT ranking_id_voluntario_fkey;
       public          postgres    false    222    232    3671            ]           2606    90385 5   tarea_habilidad tarea_habilidad_id_eme_habilidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT tarea_habilidad_id_eme_habilidad_fkey FOREIGN KEY (id_eme_habilidad) REFERENCES public.eme_habilidad(id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.tarea_habilidad DROP CONSTRAINT tarea_habilidad_id_eme_habilidad_fkey;
       public          postgres    false    212    225    3651            ^           2606    90390 -   tarea_habilidad tarea_habilidad_id_tarea_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarea_habilidad
    ADD CONSTRAINT tarea_habilidad_id_tarea_fkey FOREIGN KEY (id_tarea) REFERENCES public.tarea(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.tarea_habilidad DROP CONSTRAINT tarea_habilidad_id_tarea_fkey;
       public          postgres    false    225    3663    224            _           2606    90395 -   vol_habilidad vol_habilidad_id_habilidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT vol_habilidad_id_habilidad_fkey FOREIGN KEY (id_habilidad) REFERENCES public.habilidad(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.vol_habilidad DROP CONSTRAINT vol_habilidad_id_habilidad_fkey;
       public          postgres    false    218    230    3657            `           2606    90400 .   vol_habilidad vol_habilidad_id_voluntario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vol_habilidad
    ADD CONSTRAINT vol_habilidad_id_voluntario_fkey FOREIGN KEY (id_voluntario) REFERENCES public.voluntario(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.vol_habilidad DROP CONSTRAINT vol_habilidad_id_voluntario_fkey;
       public          postgres    false    232    3671    230            �   ,   x���4�44�QF\� ژ�АӔ�Є��D�r��qqq ���      �   �   x���1�0@�9=E. rR��1M�`d� H�B��b��BBb�^��塰i���-ː%��0bJ���\���<�"O�B;b&�A�3hfʼs�J�l������S���nڕtX[��Y��!�ȕ���4�U)��(�n��7����}�0�Ao�������#�o�v^U�#LT�      �   3   x�3�H�K�L�+I�2�t�S((�ON-��2�t��K�ɬJL������ )��      �   �   x�U��1D��*RR��h��71��];�������A�Þgޛ�~��h��I����J��'��XW������;��~��y��`\S�SA���
I`t���c�"[R��P��9)��v�_��5+y	��[���VF�      �   1   x�3�t.*�R��J�t�M���K,V01��45�4426153����� ��
Z      �   @   x����0C���0	�0L���P�`�ɋ=1�fMz9���� ���!�tH꿍$Y���7����`      2      x������ � �      �   �  x�u�MN�@���)��?IKhY�*�-g�W��ȓ �m8 +�Ћ�iS�
�HQ=?�M��l!1h����e;v�N�W(�v$!�߹��`��ç>n�vX���te3X;��÷7�*Vc�{5}�lYM�셨"�j��������	�fP@����wB5&e�{�����(����a����R?���!L�*UOu�:��0���C��6�^�GQo�}*�J�\��%�^(�5������TzXSli�^CbӒ�����A�s�+��8=��!����_�V�����,��K�l�ҹ7a�\G��<�8N5���C����cS��b��\s^��*+���i�bT�*4X���7��"��h�YN �Q�<{�ʲ���      �   9   x����0����/Nr�B�u��M�y��p)�A+!��d�[Y�Û�s�g���0�	      �   e   x�32�LK-�K�K�w(-NL��K��T1JT14P�p�sutrO�.+(7O�OMs4���/�,/6�s�,.6��ɰ2HLN1J�J���tt�������� Q��      �      x������ � �      �   �  x�m��j�0��.�]�R7
�<@7SbJ�t�L��G��L(�6^}:�Ϗ�i��:�!�H3��Ͷ��K�M HZ˸H��"nf>�`��f'�&rO���# ��f�#[��8U��j	KZ�n��;��D����>v3ȌGtLQ[�-à�pɥ�q�������j6�K��������Lp���(�|�ᇐ��-�䛅�W�dR����{����FH-����NK��-5��~����&�>���wK���nS�[m��n�P5[�c,=��>7a�a���z?ߟ7]GW�t5�z�
b�m��s�L*%?B	A����ܷ����e$ދǱh2C)��^-�FX����E�Fd�eT�O�-���7��0���d:� ��a�"7��)�'|������4Mo�ï     