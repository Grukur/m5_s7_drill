PGDMP     
        	            {            m5_s7_drill    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17544    m5_s7_drill    DATABASE     ~   CREATE DATABASE m5_s7_drill WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE m5_s7_drill;
                postgres    false            �            1259    17561 	   arriendos    TABLE     }  CREATE TABLE public.arriendos (
    folio numeric(12,0) NOT NULL,
    fecha date DEFAULT now(),
    dias numeric(5,0) NOT NULL,
    valor_dia numeric(12,0) NOT NULL,
    garantia character varying(30) NOT NULL,
    id_herramienta numeric(12,0) NOT NULL,
    id_cliente character varying(10) NOT NULL,
    CONSTRAINT arriendos_valor_dia_check CHECK ((valor_dia >= (0)::numeric))
);
    DROP TABLE public.arriendos;
       public         heap    postgres    false            �            1259    17550    clientes    TABLE     �   CREATE TABLE public.clientes (
    run character varying(10) NOT NULL,
    nombre character varying(120) NOT NULL,
    correo character varying(80) NOT NULL,
    direccion character varying(120) NOT NULL,
    telefono character varying(15) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    17545    empresas    TABLE       CREATE TABLE public.empresas (
    run character varying(10) NOT NULL,
    nombre character varying(120) NOT NULL,
    direccion character varying(120) NOT NULL,
    telefono character varying(15) NOT NULL,
    correo character varying(80) NOT NULL,
    web character varying(50)
);
    DROP TABLE public.empresas;
       public         heap    postgres    false            �            1259    17555    herramientas    TABLE     �   CREATE TABLE public.herramientas (
    id numeric(12,0) NOT NULL,
    nombre character varying(120) NOT NULL,
    precio_dia numeric(12,0) NOT NULL,
    CONSTRAINT herramientas_precio_dia_check CHECK ((precio_dia >= (0)::numeric))
);
     DROP TABLE public.herramientas;
       public         heap    postgres    false                      0    17561 	   arriendos 
   TABLE DATA                 public          postgres    false    217   �                 0    17550    clientes 
   TABLE DATA                 public          postgres    false    215   �                 0    17545    empresas 
   TABLE DATA                 public          postgres    false    214   h                 0    17555    herramientas 
   TABLE DATA                 public          postgres    false    216          z           2606    17567    arriendos arriendos_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.arriendos
    ADD CONSTRAINT arriendos_pkey PRIMARY KEY (folio);
 B   ALTER TABLE ONLY public.arriendos DROP CONSTRAINT arriendos_pkey;
       public            postgres    false    217            v           2606    17554    clientes clientes_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (run);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    215            t           2606    17549    empresas empresas_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (run);
 @   ALTER TABLE ONLY public.empresas DROP CONSTRAINT empresas_pkey;
       public            postgres    false    214            x           2606    17560    herramientas herramientas_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.herramientas
    ADD CONSTRAINT herramientas_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.herramientas DROP CONSTRAINT herramientas_pkey;
       public            postgres    false    216            {           2606    17573 #   arriendos arriendos_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.arriendos
    ADD CONSTRAINT arriendos_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(run);
 M   ALTER TABLE ONLY public.arriendos DROP CONSTRAINT arriendos_id_cliente_fkey;
       public          postgres    false    215    3190    217            |           2606    17568 '   arriendos arriendos_id_herramienta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.arriendos
    ADD CONSTRAINT arriendos_id_herramienta_fkey FOREIGN KEY (id_herramienta) REFERENCES public.herramientas(id);
 Q   ALTER TABLE ONLY public.arriendos DROP CONSTRAINT arriendos_id_herramienta_fkey;
       public          postgres    false    217    3192    216               �   x���=�0ཿ�*����NQ�k�3�6R�zF���)o�����j�\C>_/���+�HdM]�+���������X9څ�����o�-v�!�s���_Wm6}�Nf��
z�A,�L�1��@*����\nG���Th.�Ȳ,Qq�����j��#��G�d
���=�:��:}[-�L�/���T��:���:���='         �   x���=�0�w~�m@��:��	�$AW�h��3��m]Y�����sW�Myk���+|�^I�q%���"��4N�	p4F`�4�s�65%F�ã������!�Ҕ�	�';��8N�T��Ex���������Z�j �X�w�����_���V3�D6ñ��~U1�=P��S�iV��#�^�� �`���         �   x�M�A�@໿bn*l��etɃ!Һ��ƺ#��?/����TuS>[����ک#'C��!0��y�	�C�o���k�lmi��]�_e��d�R_�_(9R/]E��w����%N�iv:�n�<�Y�&���Skm�'���G8         �   x��б
�0��ݧ��
���S�B�Pm�M��W���7��to�|����� m7\`}��ݬ��E�8�A�J�Bvd-`e=!=����!+�V�Cc(PE���_���a�:����F*��Fa��K��(n�]&G?�Vo;I^R;�h     