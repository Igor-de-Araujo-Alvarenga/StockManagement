PGDMP     -                    |            stock    15.3    15.3 %               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24622    stock    DATABASE     �   CREATE DATABASE stock WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE stock;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    24624    tb_categories    TABLE     i   CREATE TABLE public.tb_categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
 !   DROP TABLE public.tb_categories;
       public         heap    postgres    false    4            �            1259    24623    tb_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tb_categories_id_seq;
       public          postgres    false    215    4                        0    0    tb_categories_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tb_categories_id_seq OWNED BY public.tb_categories.id;
          public          postgres    false    214            �            1259    24645    tb_products    TABLE     Z  CREATE TABLE public.tb_products (
    id integer NOT NULL,
    name character varying(150),
    description text,
    price numeric,
    code character varying(10),
    quantity integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    category_id integer,
    size_id integer,
    status_id integer
);
    DROP TABLE public.tb_products;
       public         heap    postgres    false    4            �            1259    24644    tb_products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tb_products_id_seq;
       public          postgres    false    221    4            !           0    0    tb_products_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tb_products_id_seq OWNED BY public.tb_products.id;
          public          postgres    false    220            �            1259    24631    tb_sizes    TABLE     d   CREATE TABLE public.tb_sizes (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.tb_sizes;
       public         heap    postgres    false    4            �            1259    24630    tb_sizes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.tb_sizes_id_seq;
       public          postgres    false    217    4            "           0    0    tb_sizes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.tb_sizes_id_seq OWNED BY public.tb_sizes.id;
          public          postgres    false    216            �            1259    24638 	   tb_status    TABLE     e   CREATE TABLE public.tb_status (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.tb_status;
       public         heap    postgres    false    4            �            1259    24637    tb_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.tb_status_id_seq;
       public          postgres    false    219    4            #           0    0    tb_status_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.tb_status_id_seq OWNED BY public.tb_status.id;
          public          postgres    false    218            t           2604    24627    tb_categories id    DEFAULT     t   ALTER TABLE ONLY public.tb_categories ALTER COLUMN id SET DEFAULT nextval('public.tb_categories_id_seq'::regclass);
 ?   ALTER TABLE public.tb_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            w           2604    24648    tb_products id    DEFAULT     p   ALTER TABLE ONLY public.tb_products ALTER COLUMN id SET DEFAULT nextval('public.tb_products_id_seq'::regclass);
 =   ALTER TABLE public.tb_products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            u           2604    24634    tb_sizes id    DEFAULT     j   ALTER TABLE ONLY public.tb_sizes ALTER COLUMN id SET DEFAULT nextval('public.tb_sizes_id_seq'::regclass);
 :   ALTER TABLE public.tb_sizes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            v           2604    24641    tb_status id    DEFAULT     l   ALTER TABLE ONLY public.tb_status ALTER COLUMN id SET DEFAULT nextval('public.tb_status_id_seq'::regclass);
 ;   ALTER TABLE public.tb_status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219                      0    24624    tb_categories 
   TABLE DATA           1   COPY public.tb_categories (id, name) FROM stdin;
    public          postgres    false    215   �'                 0    24645    tb_products 
   TABLE DATA           �   COPY public.tb_products (id, name, description, price, code, quantity, created_at, updated_at, category_id, size_id, status_id) FROM stdin;
    public          postgres    false    221   �'                 0    24631    tb_sizes 
   TABLE DATA           ,   COPY public.tb_sizes (id, name) FROM stdin;
    public          postgres    false    217   �(                 0    24638 	   tb_status 
   TABLE DATA           -   COPY public.tb_status (id, name) FROM stdin;
    public          postgres    false    219   �(       $           0    0    tb_categories_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tb_categories_id_seq', 3, true);
          public          postgres    false    214            %           0    0    tb_products_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tb_products_id_seq', 11, true);
          public          postgres    false    220            &           0    0    tb_sizes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tb_sizes_id_seq', 3, true);
          public          postgres    false    216            '           0    0    tb_status_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.tb_status_id_seq', 4, true);
          public          postgres    false    218            y           2606    24629     tb_categories tb_categories_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tb_categories
    ADD CONSTRAINT tb_categories_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tb_categories DROP CONSTRAINT tb_categories_pkey;
       public            postgres    false    215                       2606    24652    tb_products tb_products_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_products
    ADD CONSTRAINT tb_products_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tb_products DROP CONSTRAINT tb_products_pkey;
       public            postgres    false    221            {           2606    24636    tb_sizes tb_sizes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.tb_sizes
    ADD CONSTRAINT tb_sizes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.tb_sizes DROP CONSTRAINT tb_sizes_pkey;
       public            postgres    false    217            }           2606    24643    tb_status tb_status_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tb_status
    ADD CONSTRAINT tb_status_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tb_status DROP CONSTRAINT tb_status_pkey;
       public            postgres    false    219            �           2606    24653    tb_products fk_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_products
    ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES public.tb_categories(id);
 A   ALTER TABLE ONLY public.tb_products DROP CONSTRAINT fk_category;
       public          postgres    false    221    215    3193            �           2606    24658    tb_products fk_size    FK CONSTRAINT     u   ALTER TABLE ONLY public.tb_products
    ADD CONSTRAINT fk_size FOREIGN KEY (size_id) REFERENCES public.tb_sizes(id);
 =   ALTER TABLE ONLY public.tb_products DROP CONSTRAINT fk_size;
       public          postgres    false    217    3195    221            �           2606    24663    tb_products fk_status    FK CONSTRAINT     z   ALTER TABLE ONLY public.tb_products
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES public.tb_status(id);
 ?   ALTER TABLE ONLY public.tb_products DROP CONSTRAINT fk_status;
       public          postgres    false    3197    221    219               ;   x�3�L�IM.)���L.�2�L��/�H-�2���/-N���IQH,(��L�K
��qqq �&         �   x��ҽ��0��y�� ��|8Ɇ��FT:�4z��$� �bg�O�_&�\���}w:Xw��z���iF�<�.0,��T���1~�j+~�g�D�ň�PM��<�e�4Z�1�9��j���Z��Q���
��J���y��Q3EA7)a\�<�U��Y%�w��d�A���������K��!�Ȗ�<��BD�@���D���VJ�Ƶ�            x�3��2���2������� d         D   x�3���W�/JI-*�2�t,K��IL�I�2��/-Q�OS.�O��2�t,O�,��KWJ-��qqq h�     