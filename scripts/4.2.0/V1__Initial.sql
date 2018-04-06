SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

--
-- Name: appinfo; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE appinfo (
    id bigint NOT NULL,
    version integer,
    schemaversion integer NOT NULL
);


--
-- Name: appinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE appinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: appinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE appinfo_id_seq OWNED BY appinfo.id;


--
-- Name: device; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE device (
    id bigint NOT NULL,
    version integer,
    uuid character varying(255)
);


--
-- Name: device_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE device_id_seq OWNED BY device.id;


--
-- Name: devicerevision; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE devicerevision (
    id bigint NOT NULL,
    version integer,
    additionalinfo character varying(255),
    conventionname character varying(255),
    conventionnameeqclass character varying(255),
    deleted boolean NOT NULL,
    instanceindex character varying(255),
    requestdate timestamp without time zone,
    device_id bigint,
    devicetype_id bigint,
    requestedby_id bigint,
    section_id bigint
);


--
-- Name: devicerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE devicerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: devicerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE devicerevision_id_seq OWNED BY devicerevision.id;


--
-- Name: namepart; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE namepart (
    id bigint NOT NULL,
    version integer,
    nameparttype character varying(255),
    uuid character varying(255)
);


--
-- Name: namepart_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE namepart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: namepart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE namepart_id_seq OWNED BY namepart.id;


--
-- Name: namepartrevision; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE namepartrevision (
    id bigint NOT NULL,
    version integer,
    deleted boolean NOT NULL,
    description character varying(255),
    mnemonic character varying(255),
    mnemoniceqclass character varying(255),
    name character varying(255),
    processdate timestamp without time zone,
    processorcomment character varying(255),
    requestdate timestamp without time zone,
    requestercomment character varying(255),
    status character varying(255),
    namepart_id bigint,
    parent_id bigint,
    processedby_id bigint,
    requestedby_id bigint
);


--
-- Name: namepartrevision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE namepartrevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: namepartrevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE namepartrevision_id_seq OWNED BY namepartrevision.id;


--
-- Name: useraccount; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE useraccount (
    id bigint NOT NULL,
    version integer,
    role character varying(255),
    username character varying(255)
);


--
-- Name: useraccount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE useraccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: useraccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE useraccount_id_seq OWNED BY useraccount.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY appinfo ALTER COLUMN id SET DEFAULT nextval('appinfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY device ALTER COLUMN id SET DEFAULT nextval('device_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY devicerevision ALTER COLUMN id SET DEFAULT nextval('devicerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY namepart ALTER COLUMN id SET DEFAULT nextval('namepart_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY namepartrevision ALTER COLUMN id SET DEFAULT nextval('namepartrevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY useraccount ALTER COLUMN id SET DEFAULT nextval('useraccount_id_seq'::regclass);


--
-- Name: appinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY appinfo
    ADD CONSTRAINT appinfo_pkey PRIMARY KEY (id);


--
-- Name: device_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY device
    ADD CONSTRAINT device_pkey PRIMARY KEY (id);


--
-- Name: devicerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY devicerevision
    ADD CONSTRAINT devicerevision_pkey PRIMARY KEY (id);


--
-- Name: namepart_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY namepart
    ADD CONSTRAINT namepart_pkey PRIMARY KEY (id);


--
-- Name: namepartrevision_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY namepartrevision
    ADD CONSTRAINT namepartrevision_pkey PRIMARY KEY (id);


--
-- Name: useraccount_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY useraccount
    ADD CONSTRAINT useraccount_pkey PRIMARY KEY (id);


--
-- Name: fk_3f26vetemhujfdm9q74ecr2u5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY namepartrevision
    ADD CONSTRAINT fk_3f26vetemhujfdm9q74ecr2u5 FOREIGN KEY (namepart_id) REFERENCES namepart(id);


--
-- Name: fk_4ucnoos7kd8s1gaqbpwm1xptq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY devicerevision
    ADD CONSTRAINT fk_4ucnoos7kd8s1gaqbpwm1xptq FOREIGN KEY (requestedby_id) REFERENCES useraccount(id);


--
-- Name: fk_9vomfk9x1jow27ifx6xc62c5x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY namepartrevision
    ADD CONSTRAINT fk_9vomfk9x1jow27ifx6xc62c5x FOREIGN KEY (processedby_id) REFERENCES useraccount(id);


--
-- Name: fk_9xs5oy86lf0j8ukpjokjipeke; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY namepartrevision
    ADD CONSTRAINT fk_9xs5oy86lf0j8ukpjokjipeke FOREIGN KEY (requestedby_id) REFERENCES useraccount(id);


--
-- Name: fk_d3ocbsb4tl4ttnusn98khq148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY devicerevision
    ADD CONSTRAINT fk_d3ocbsb4tl4ttnusn98khq148 FOREIGN KEY (devicetype_id) REFERENCES namepart(id);


--
-- Name: fk_l7kklb4mxixjs27nsso6shone; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY devicerevision
    ADD CONSTRAINT fk_l7kklb4mxixjs27nsso6shone FOREIGN KEY (section_id) REFERENCES namepart(id);


--
-- Name: fk_l9r1givkfaiol5or2lnr324xp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY devicerevision
    ADD CONSTRAINT fk_l9r1givkfaiol5or2lnr324xp FOREIGN KEY (device_id) REFERENCES device(id);


--
-- Name: fk_lufxqy46l9eiq55d445rbukag; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY namepartrevision
    ADD CONSTRAINT fk_lufxqy46l9eiq55d445rbukag FOREIGN KEY (parent_id) REFERENCES namepart(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


INSERT INTO appinfo (version, schemaversion) VALUES (1,1);
