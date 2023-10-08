CREATE DATABASE EVENTBOARD;

CREATE TABLE USERS(
    USER_ID INT NOT NULL AUTO_INCREMENT,
    USER_CODE VARCHAR(255) NOT NULL,
    USER_NAME VARCHAR(255) NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    FIRST_NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    LAST_NAME VARCHAR(255) NOT NULL,
    UNIQUE (USER_NAME),
    PRIMARY KEY (USER_ID)
);
ALTER TABLE USERS AUTO_INCREMENT=1;
INSERT INTO USERS (USER_CODE, USER_NAME, PASSWORD, FIRST_NAME, LAST_NAME, EMAIL) VALUES (0, 'admin', 'admin', 'admin_first_name', 'admin_last_name', 'admin_email@umass.edu');

CREATE TABLE ASSOCIATIONS(
    ASSOCIATION_ID INT NOT NULL AUTO_INCREMENT,
    USER_ID INT NOT NULL,
    TAG_ID INT,
    ASSOCIATION_NAME VARCHAR(255) NOT NULL,
    DESCRIPTION VARCHAR(255) NOT NULL,
    ADDRESS VARCHAR(255),
    CONTACT_INFO VARCHAR(255),
    EMAIL VARCHAR(255),
    APPROVAL_STATUS VARCHAR(1) NOT NULL,
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID),
    FOREIGN KEY (TAG_ID) REFERENCES TAGS(TAG_ID),
    PRIMARY KEY (ASSOCIATION_ID)
);

ALTER TABLE ASSOCIATIONS AUTO_INCREMENT = 1;
ALTER TABLE ASSOCIATIONS ADD CONSTRAINT UC_ASSOCIATIONS UNIQUE(USER_ID, ASSOCIATION_ID);


CREATE TABLE EVENTS(
        EVENT_ID INT NOT NULL AUTO_INCREMENT,
        ASSOCIATION_ID INT NOT NULL,
        START_TIME TIMESTAMP NOT NULL,
        END_TIME TIMESTAMP NOT NULL,
        NAME VARCHAR(255) NOT NULL,
        VENUE VARCHAR(255),
        DESCRIPTION VARCHAR(255) NOT NULL,
        FOREIGN KEY (ASSOCIATION_ID) REFERENCES ASSOCIATIONS(ASSOCIATION_ID),
        PRIMARY KEY (EVENT_ID)
);

ALTER TABLE EVENTS AUTO_INCREMENT = 1;


CREATE TABLE FOLLOW_ASSOCIATIONS(
    FOLLOW_ASSOCIATION_ID INT NOT NULL AUTO_INCREMENT,
    USER_ID INT NOT NULL,
    ASSOCIATION_ID INT NOT NULL,
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID),
    FOREIGN KEY (ASSOCIATION_ID) REFERENCES ASSOCIATIONS(ASSOCIATION_ID),
    PRIMARY KEY (FOLLOW_ASSOCIATION_ID)
);

ALTER TABLE FOLLOW_ASSOCIATIONS AUTO_INCREMENT = 1;

CREATE TABLE FOLLOW_EVENTS(
    FOLLOW_EVENT_ID INT NOT NULL AUTO_INCREMENT,
    USER_ID INT NOT NULL,
    EVENT_ID INT NOT NULL,
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID),
    FOREIGN KEY (EVENT_ID) REFERENCES EVENTS(EVENT_ID),
    PRIMARY KEY (FOLLOW_EVENT_ID),
    CONSTRAINT UC_FA UNIQUE (USER_ID, EVENT_ID)
);

ALTER TABLE FOLLOW_EVENTS AUTO_INCREMENT = 1;