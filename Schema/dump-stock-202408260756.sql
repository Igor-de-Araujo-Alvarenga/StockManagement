PGDMP         8                |            stock    15.3    15.3 7    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            6           1262    24622    stock    DATABASE     �   CREATE DATABASE stock WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE stock;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            7           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1255    24694    log_product_insert()    FUNCTION     �   CREATE FUNCTION public.log_product_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO tb_history (product_id, operation_id, created_at)
    VALUES (NEW.id, 1, NOW());
    RETURN NEW;
END;
$$;
 +   DROP FUNCTION public.log_product_insert();
       public          postgres    false    4            �            1259    24624    tb_categories    TABLE     i   CREATE TABLE public.tb_categories (
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
       public          postgres    false    4    215            8           0    0    tb_categories_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tb_categories_id_seq OWNED BY public.tb_categories.id;
          public          postgres    false    214            �            1259    24676 
   tb_history    TABLE     �   CREATE TABLE public.tb_history (
    id integer NOT NULL,
    product_id integer NOT NULL,
    operation_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);
    DROP TABLE public.tb_history;
       public         heap    postgres    false    4            �            1259    24675    tb_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tb_history_id_seq;
       public          postgres    false    4    225            9           0    0    tb_history_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tb_history_id_seq OWNED BY public.tb_history.id;
          public          postgres    false    224            �            1259    24669    tb_operation    TABLE     g   CREATE TABLE public.tb_operation (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
     DROP TABLE public.tb_operation;
       public         heap    postgres    false    4            �            1259    24668    tb_operation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_operation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tb_operation_id_seq;
       public          postgres    false    223    4            :           0    0    tb_operation_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tb_operation_id_seq OWNED BY public.tb_operation.id;
          public          postgres    false    222            �            1259    24645    tb_products    TABLE     Z  CREATE TABLE public.tb_products (
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
       public          postgres    false    4    221            ;           0    0    tb_products_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tb_products_id_seq OWNED BY public.tb_products.id;
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
       public          postgres    false    4    217            <           0    0    tb_sizes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.tb_sizes_id_seq OWNED BY public.tb_sizes.id;
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
       public          postgres    false    219    4            =           0    0    tb_status_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.tb_status_id_seq OWNED BY public.tb_status.id;
          public          postgres    false    218                       2604    24627    tb_categories id    DEFAULT     t   ALTER TABLE ONLY public.tb_categories ALTER COLUMN id SET DEFAULT nextval('public.tb_categories_id_seq'::regclass);
 ?   ALTER TABLE public.tb_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    24679    tb_history id    DEFAULT     n   ALTER TABLE ONLY public.tb_history ALTER COLUMN id SET DEFAULT nextval('public.tb_history_id_seq'::regclass);
 <   ALTER TABLE public.tb_history ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    24672    tb_operation id    DEFAULT     r   ALTER TABLE ONLY public.tb_operation ALTER COLUMN id SET DEFAULT nextval('public.tb_operation_id_seq'::regclass);
 >   ALTER TABLE public.tb_operation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    24648    tb_products id    DEFAULT     p   ALTER TABLE ONLY public.tb_products ALTER COLUMN id SET DEFAULT nextval('public.tb_products_id_seq'::regclass);
 =   ALTER TABLE public.tb_products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    24634    tb_sizes id    DEFAULT     j   ALTER TABLE ONLY public.tb_sizes ALTER COLUMN id SET DEFAULT nextval('public.tb_sizes_id_seq'::regclass);
 :   ALTER TABLE public.tb_sizes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    24641    tb_status id    DEFAULT     l   ALTER TABLE ONLY public.tb_status ALTER COLUMN id SET DEFAULT nextval('public.tb_status_id_seq'::regclass);
 ;   ALTER TABLE public.tb_status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            &          0    24624    tb_categories 
   TABLE DATA           1   COPY public.tb_categories (id, name) FROM stdin;
    public          postgres    false    215   :=       0          0    24676 
   tb_history 
   TABLE DATA           N   COPY public.tb_history (id, product_id, operation_id, created_at) FROM stdin;
    public          postgres    false    225   �=       .          0    24669    tb_operation 
   TABLE DATA           0   COPY public.tb_operation (id, name) FROM stdin;
    public          postgres    false    223   �=       ,          0    24645    tb_products 
   TABLE DATA           �   COPY public.tb_products (id, name, description, price, code, quantity, created_at, updated_at, category_id, size_id, status_id) FROM stdin;
    public          postgres    false    221   �=       (          0    24631    tb_sizes 
   TABLE DATA           ,   COPY public.tb_sizes (id, name) FROM stdin;
    public          postgres    false    217   �>       *          0    24638 	   tb_status 
   TABLE DATA           -   COPY public.tb_status (id, name) FROM stdin;
    public          postgres    false    219   �>       >           0    0    tb_categories_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tb_categories_id_seq', 3, true);
          public          postgres    false    214            ?           0    0    tb_history_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tb_history_id_seq', 1, true);
          public          postgres    false    224            @           0    0    tb_operation_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tb_operation_id_seq', 1, true);
          public          postgres    false    222            A           0    0    tb_products_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tb_products_id_seq', 14, true);
          public          postgres    false    220            B           0    0    tb_sizes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tb_sizes_id_seq', 3, true);
          public          postgres    false    216            C           0    0    tb_status_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.tb_status_id_seq', 4, true);
          public          postgres    false    218            �           2606    24629     tb_categories tb_categories_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tb_categories
    ADD CONSTRAINT tb_categories_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tb_categories DROP CONSTRAINT tb_categories_pkey;
       public            postgres    false    215            �           2606    24681    tb_history tb_history_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tb_history
    ADD CONSTRAINT tb_history_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tb_history DROP CONSTRAINT tb_history_pkey;
       public            postgres    false    225            �           2606    24674    tb_operation tb_operation_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tb_operation
    ADD CONSTRAINT tb_operation_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tb_operation DROP CONSTRAINT tb_operation_pkey;
       public            postgres    false    223            �           2606    24652    tb_products tb_products_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_products
    ADD CONSTRAINT tb_products_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tb_products DROP CONSTRAINT tb_products_pkey;
       public            postgres    false    221            �           2606    24636    tb_sizes tb_sizes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.tb_sizes
    ADD CONSTRAINT tb_sizes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.tb_sizes DROP CONSTRAINT tb_sizes_pkey;
       public            postgres    false    217            �           2606    24643    tb_status tb_status_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tb_status
    ADD CONSTRAINT tb_status_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tb_status DROP CONSTRAINT tb_status_pkey;
       public            postgres    false    219            �           2620    24695 $   tb_products after_insert_tb_products    TRIGGER     �   CREATE TRIGGER after_insert_tb_products AFTER INSERT ON public.tb_products FOR EACH ROW EXECUTE FUNCTION public.log_product_insert();
 =   DROP TRIGGER after_insert_tb_products ON public.tb_products;
       public          postgres    false    221    226            �           2606    24653    tb_products fk_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_products
    ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES public.tb_categories(id);
 A   ALTER TABLE ONLY public.tb_products DROP CONSTRAINT fk_category;
       public          postgres    false    215    221    3206            �           2606    24658    tb_products fk_size    FK CONSTRAINT     u   ALTER TABLE ONLY public.tb_products
    ADD CONSTRAINT fk_size FOREIGN KEY (size_id) REFERENCES public.tb_sizes(id);
 =   ALTER TABLE ONLY public.tb_products DROP CONSTRAINT fk_size;
       public          postgres    false    221    217    3208            �           2606    24663    tb_products fk_status    FK CONSTRAINT     z   ALTER TABLE ONLY public.tb_products
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES public.tb_status(id);
 ?   ALTER TABLE ONLY public.tb_products DROP CONSTRAINT fk_status;
       public          postgres    false    221    3210    219            �           2606    24687 '   tb_history tb_history_operation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_history
    ADD CONSTRAINT tb_history_operation_id_fkey FOREIGN KEY (operation_id) REFERENCES public.tb_operation(id);
 Q   ALTER TABLE ONLY public.tb_history DROP CONSTRAINT tb_history_operation_id_fkey;
       public          postgres    false    3214    223    225            �           2606    24682 %   tb_history tb_history_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_history
    ADD CONSTRAINT tb_history_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.tb_products(id);
 O   ALTER TABLE ONLY public.tb_history DROP CONSTRAINT tb_history_product_id_fkey;
       public          postgres    false    225    3212    221            &   ;   x�3�L�IM.)���L.�2�L��/�H-�2���/-N���IQH,(��L�K
��qqq �&      0   /   x�3�44�4�4202�5��52T04�25�21�33304������ ���      .      x�3���v
����� z�      ,   �   x��н�1��y�� �g��$��'
J:؂�������vg��h(����w�n��������tO�� Pe��P�6Z7��v��f���w�]�q�丄TE�#xsr���bv0�k��s��̗]��4*�E ��%�Jk��>p�:T���<]�FZ|8iE �c�=��KM�@����#u�      (      x�3��2���2������� d      *   D   x�3���W�/JI-*�2�t,K��IL�I�2��/-Q�OS.�O��2�t,O�,��KWJ-��qqq h�     