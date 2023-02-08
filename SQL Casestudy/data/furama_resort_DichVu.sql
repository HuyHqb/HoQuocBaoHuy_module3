CREATE TABLE DichVu
(
    idDichVu     int         NOT NULL
        PRIMARY KEY,
    tenDichVu    varchar(45) NULL,
    dienTich     int         NULL,
    soTang       int         NULL,
    soNguoiToiDa int         NULL,
    chiPhiThue   int         NULL,
    idKieuThue   int         NULL,
    idLoaiDichVu int         NULL,
    trangThai    varchar(45) NULL,
    CONSTRAINT DichVu_ibfk_1
        FOREIGN KEY (idKieuThue) REFERENCES KieuThue (idKieuThue),
    CONSTRAINT DichVu_ibfk_2
        FOREIGN KEY (idLoaiDichVu) REFERENCES LoaiDichVu (idLoaiDichVu)
);

CREATE INDEX idKieuThue
    ON DichVu (idKieuThue);

CREATE INDEX idLoaiDichVu
    ON DichVu (idLoaiDichVu);

INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (1, 'High Life', 124, 1, 35, 8977, 2, 3, 'risus praesent');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (2, 'Headfirst', 270, 4, 29, 5115, 3, 1, 'justo maecenas rhoncus aliquam');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (3, 'Babe', 967, 1, 13, 1918, 3, 1, 'condimentum neque');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (4, 'Wise Guys, The (Les grandes gueules)', 979, 3, 44, 9796, 3, 2, 'cursus urna');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (5, 'Chris Rock: Bring the Pain', 566, 6, 48, 7451, 2, 2, 'amet lobortis sapien');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (6, 'Lord of the Rings, The', 312, 7, 37, 2657, 2, 2, 'neque aenean auctor gravida');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (7, 'First Day of the Rest of Your Life, The (Le p', 473, 5, 46, 7215, 4, 2, 'justo morbi ut odio');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (8, 'Musketeers of Pig Alley, The', 686, 7, 50, 1330, 2, 3, 'iaculis justo');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (9, 'Scandal', 161, 3, 18, 9547, 4, 2, 'duis at velit eu est');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (10, 'Bereavement', 942, 5, 16, 3500, 2, 3, 'nam congue risus semper porta');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (11, 'My Best Fiend (Mein liebster Feind)', 26, 5, 12, 3628, 4, 3, 'ornare consequat');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (12, 'Comanche Moon', 417, 7, 19, 4080, 4, 3, 'ipsum dolor sit');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (13, 'Moderns, The', 393, 3, 33, 7117, 3, 2, 'in faucibus orci luctus et');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (14, 'Premiers désirs', 729, 2, 14, 8673, 1, 2, 'bibendum morbi non quam nec');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (15, 'Kicking & Screaming', 545, 2, 50, 5218, 4, 3, 'rhoncus sed vestibulum sit amet');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (16, 'Don''t Bother to Knock', 234, 6, 8, 9836, 1, 2, 'pede venenatis non sodales sed');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (17, 'Virtuosity', 401, 5, 43, 1296, 2, 1, 'vitae consectetuer eget rutrum');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (18, 'Nurse 3D', 471, 7, 20, 5730, 4, 2, 'sollicitudin vitae consectetuer eget');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (19, 'King in New York, A', 81, 7, 47, 5355, 4, 1, 'vulputate nonummy maecenas tincidunt');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (20, 'Beetlejuice', 276, 6, 24, 2094, 2, 1, 'id massa id nisl');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (21, 'Matewan', 101, 6, 48, 3255, 3, 3, 'est congue elementum in hac');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (22, 'Godson, The', 153, 7, 28, 382, 3, 2, 'suscipit a feugiat et');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (23, 'Arnold', 223, 5, 47, 8276, 3, 2, 'aliquet ultrices erat tortor sollicitudin');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (24, 'Under African Skies', 353, 1, 33, 7553, 2, 1, 'augue a');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (25, 'I Saw the Sun (Günesi gördüm)', 301, 2, 45, 9851, 4, 1, 'at nunc commodo placerat');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (26, 'White Shadows in the South Seas', 365, 3, 9, 2739, 2, 3, 'aliquam augue quam sollicitudin');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (27, 'Guardian, The', 971, 7, 4, 1948, 1, 1, 'blandit non interdum');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (28, 'Paper Moon', 254, 3, 34, 2581, 1, 1, 'non velit');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (29, 'For a Lost Soldier (Voor een Verloren Soldaat', 235, 6, 50, 4276, 1, 1, 'non quam nec dui');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (30, 'Jack Strong', 385, 1, 23, 8951, 2, 3, 'risus semper');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (31, 'Apollo 13: To the Edge and Back', 504, 6, 26, 5099, 3, 3, 'donec quis orci eget orci');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (32, 'Truth About Cats & Dogs, The', 230, 3, 24, 3222, 4, 3, 'etiam vel');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (33, 'Somewhere Between', 637, 6, 7, 7405, 4, 2, 'volutpat quam pede lobortis');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (34, 'Little Dieter Needs to Fly', 111, 6, 41, 2853, 3, 3, 'duis faucibus accumsan odio curabitur');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (35, 'Emperor''s New Groove, The', 669, 5, 18, 4738, 2, 2, 'cubilia curae');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (36, 'Teen Beach Movie', 51, 1, 35, 9110, 4, 3, 'ut mauris eget');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (37, 'Cobra Woman', 451, 3, 11, 6070, 3, 1, 'lectus vestibulum quam sapien');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (38, 'Spanish Main, The', 562, 7, 43, 1604, 2, 2, 'hendrerit at vulputate vitae nisl');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (39, 'Babar The Movie', 840, 5, 27, 1917, 1, 3, 'ut volutpat sapien arcu sed');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (40, 'Dodsworth', 638, 6, 31, 7199, 1, 1, 'tempus semper');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (41, 'My Dinner with André', 791, 6, 48, 6054, 2, 2, 'ante vestibulum');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (42, 'Wit', 270, 1, 32, 7103, 1, 1, 'elit proin risus praesent');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (43, 'Hitler: The Rise of Evil', 624, 5, 40, 7770, 2, 1, 'vestibulum velit');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (44, 'Closing the Ring', 658, 6, 7, 45, 1, 3, 'nonummy maecenas tincidunt');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (45, 'Jason Becker: Not Dead Yet', 273, 1, 47, 1059, 4, 1, 'eget tempus vel pede morbi');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (46, 'Independencia', 602, 5, 13, 2679, 4, 2, 'massa volutpat convallis');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (47, 'Margaret''s Museum', 536, 1, 23, 621, 3, 1, 'in hac');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (48, 'Venus Boyz', 567, 5, 6, 3111, 1, 3, 'cubilia curae mauris viverra diam');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (49, 'Diary of a Wimpy Kid', 774, 3, 34, 7368, 4, 3, 'nullam molestie');
INSERT INTO furama_resort.DichVu (idDichVu, tenDichVu, dienTich, soTang, soNguoiToiDa, chiPhiThue, idKieuThue, idLoaiDichVu, trangThai) VALUES (50, 'Across the Line: The Exodus of Charlie Wright', 947, 4, 37, 276, 2, 3, 'ullamcorper augue a suscipit');