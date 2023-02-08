CREATE TABLE KhachHang
(
    idKhachHang int         NOT NULL
        PRIMARY KEY,
    idLoaiKhach int         NULL,
    hoTen       varchar(45) NULL,
    ngaySinh    date        NULL,
    soCMND      varchar(45) NULL,
    sdt         varchar(45) NULL,
    email       varchar(45) NULL,
    diaChi      varchar(45) NULL,
    CONSTRAINT KhachHang_soCMND_uindex
        UNIQUE (soCMND),
    CONSTRAINT KhachHang_ibfk_1
        FOREIGN KEY (idLoaiKhach) REFERENCES LoaiKhach (idLoaiKhach)
);

CREATE INDEX idLoaiKhach
    ON KhachHang (idLoaiKhach);

INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (1, 4, 'Gabriello Gulleford', '2014-08-15', '808917920', '437 553 1134', 'ggulleford0@mayoclinic.com', null);
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (2, 2, 'Grover Mackriell', '1992-04-10', '575618835', '709 399 4922', 'acarter1@who.int', 'Da Nang');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (3, 5, 'Gabriello Gulleford', '2006-04-17', '349119006', '423 680 4073', 'lwherrit2@auda.org.au', 'Quang Tri');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (4, 4, 'Lana Fawthorpe', '2001-01-25', '510908054', '840 829 9979', 'merington3@blogtalkradio.com', '600 Fair Oaks Junction');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (5, 2, 'Cass Groveham', null, '277774949', '790 895 6025', null, '0072 Talmadge Parkway');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (6, 2, 'Arther Carter', '2011-10-10', '832175456', '380 351 4121', 'aenright5@google.ru', 'Quang Tri');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (7, 2, 'Lauralee Graffham', '1994-10-09', '629432076', '412 939 5884', 'lgraffham6@comsenz.com', null);
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (8, 4, 'Matilda Loftie', '1992-06-17', '760625512', '206 442 9093', 'mloftie7@nymag.com', '55544 Melody Plaza');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (9, 5, 'Lana Fawthorpe', null, '538888030', '887 375 5190', 'odavidowsky8@ehow.com', 'Quang Tri');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (10, 4, 'Cletis Burnett', '1992-11-09', '651890788', '366 214 4389', 'cburnett9@redcross.org', '6215 Emmet Plaza');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (11, 1, 'Lana Fawthorpe', '2005-01-23', '840223384', '971 624 5559', 'lfawthorpea@nature.com', '77 Mandrake Drive');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (12, 5, 'Gwyn Teas', '2008-10-31', '995866716', '362 219 3728', 'gteasb@printfriendly.com', 'Quang Tri');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (13, 1, 'Arther Carter', '1994-08-18', '915227038', '722 866 7545', 'csprigingsc@xinhuanet.com', 'Quang Ngai');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (14, 3, 'Worthy Fryett', '2014-08-25', '329612625', '708 574 6221', 'wfryettd@ezinearticles.com', '6 Bartillon Lane');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (15, 1, 'Lana Fawthorpe', '2021-04-09', '251632984', '427 243 8648', 'ipaoloe@rakuten.co.jp', '7272 Green Crossing');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (16, 3, 'Ellswerth Linnitt', '2015-05-14', '163151212', '882 948 1899', 'elinnittf@xing.com', '2 Bay Center');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (17, 5, 'Grover Mackriell', null, '663198979', '143 863 2218', null, 'Da Nang');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (18, 5, 'Fiona Legrice', null, '920345572', '465 880 5747', null, '601 Nevada Lane');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (19, 3, 'Robbin Cranage', '2001-12-28', '739336253', '899 933 1678', 'jschorahi@bizjournals.com', '57 Birchwood Trail');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (20, 3, 'Averill Philipsohn', '2007-06-04', '704469122', '403 497 0052', 'aphilipsohnj@nih.gov', 'Vinh');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (21, 5, 'Olva Okie', '1992-07-09', '464258080', '155 907 1456', 'ookiek@mashable.com', '35 Northfield Crossing');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (22, 3, 'Buiron McConaghy', '2015-10-13', '638876895', '847 393 3788', 'bmcconaghyl@gravatar.com', '24747 Sycamore Junction');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (23, 1, 'Averill Philipsohn', '2001-09-11', '929444512', '386 261 3680', 'jbattellm@360.cn', 'Quang Tri');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (24, 4, 'Keri Ledson', '2016-10-26', '551003473', '465 132 6873', 'kledsonn@google.it', '0070 Clemons Street');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (25, 4, 'Clo Feldhammer', '1991-05-14', '346698970', '477 946 5151', 'cfeldhammero@jiathis.com', 'Da Nang');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (26, 5, 'Averill Philipsohn', '2011-08-28', '369005056', '187 872 8585', 'sgladdishp@census.gov', 'Quang Ngai');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (27, 4, 'Clarance Cranke', '1996-01-21', '743483785', '990 296 9399', 'ccrankeq@parallels.com', '5338 Oneill Junction');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (28, 2, 'Arther Carter', '2019-06-03', '807657924', '101 278 8139', 'dvillaltar@chronoengine.com', '5 Alpine Crossing');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (29, 3, 'Heida Whatford', '2014-04-18', '380019728', '582 963 1524', 'hwhatfords@dot.gov', 'Quang Tri');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (30, 5, 'Merrile Tookey', '2012-09-21', '669565484', null, 'mtookeyt@java.com', '85 Dunning Trail');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (31, 2, 'Roselin Bezants', '2016-10-31', '435511865', '942 178 4301', 'rbezantsu@list-manage.com', '188 Mesta Alley');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (32, 4, 'Robbin Cranage', '1996-03-29', '840494395', '166 607 9113', 'sbodlev@aboutads.info', '0307 Nevada Way');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (33, 2, 'Shelby MacCurley', '2002-03-25', '341876886', null, 'smaccurleyw@unesco.org', '45 Blackbird Street');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (34, 1, 'Rubi Piccard', '1998-04-18', '475310464', '987 870 8873', 'rpiccardx@g.co', '71 Burrows Hill');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (35, 1, 'Marris Turbayne', '2011-06-21', '681780988', '114 397 6997', 'mturbayney@bandcamp.com', '60228 Buhler Trail');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (36, 1, 'Patrice Dufty', null, '390990170', '827 206 7909', null, '42 Shasta Drive');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (37, 1, 'Averill Philipsohn', '2009-12-03', '570628662', '389 183 3721', 'sedlyne10@fema.gov', 'Da Nang');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (38, 4, 'Si Parr', '1991-03-29', '554031757', '977 955 4359', 'sparr11@merriam-webster.com', '5 8th Junction');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (39, 4, 'Cathyleen Atteridge', '2005-06-27', '108208036', '188 317 5220', 'catteridge12@pbs.org', '1 Claremont Alley');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (40, 1, 'Read Skermer', null, '754255014', '749 746 7123', null, '61 Sachs Circle');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (41, 1, 'Asa Ryam', '2003-09-06', '677586228', '157 268 3150', 'aryam14@google.com', 'Quang Ngai');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (42, 2, 'Robbin Cranage', '2020-10-10', '440520723', '138 381 8222', 'rcranage15@miibeian.gov.cn', 'Quang Tri');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (43, 4, 'Siana Stachini', '2020-06-25', '166083850', '319 760 6382', 'sstachini16@edublogs.org', '2 Kipling Lane');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (44, 3, 'Sal Cleere', '1998-08-23', '771170685', '936 663 0513', 'scleere17@webmd.com', '772 Hazelcrest Junction');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (45, 2, 'Tommi Biaggetti', '2020-12-31', '534587475', null, 'tbiaggetti18@ucsd.edu', '26 Spohn Hill');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (46, 4, 'Halimeda Hirjak', '1993-09-23', '672794534', '134 750 8021', 'hhirjak19@meetup.com', '60720 Michigan Drive');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (47, 2, 'Ber Billes', '2015-03-03', '995749101', '844 401 5450', 'bbilles1a@cargocollective.com', '0 International Trail');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (48, 4, 'Donalt Hellmer', '2009-03-09', '359788880', '986 475 7916', 'dhellmer1b@flavors.me', '2968 South Pass');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (49, 1, 'Bonny Woehler', '1991-12-16', '185198338', '458 765 0220', 'bwoehler1c@theatlantic.com', '05 Westridge Junction');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (50, 2, 'Dimitry Kliemann', '2017-12-09', '986117332', null, 'dkliemann1d@ovh.net', 'Da Nang');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (51, 3, 'Gianna Marron', '2010-11-26', '727917918', '276 920 3742', 'gmarron1e@nbcnews.com', '6 Declaration Crossing');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (52, 1, 'Julianne Dearden', '2015-05-07', '596944602', '265 823 7868', 'jdearden1f@chron.com', '9 Hooker Crossing');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (53, 3, 'Maribel Agg', '2000-10-10', '740128821', '794 632 7602', 'magg1g@google.cn', '9 Doe Crossing Crossing');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (54, 4, 'Bernardine Covendon', '2001-08-19', '418622909', '193 771 4136', 'bcovendon1h@canalblog.com', 'Quang Tri');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (55, 3, 'Frieda Lightwood', null, '103904653', '655 678 3414', null, '63017 Milwaukee Place');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (56, 3, 'Rosy Milverton', '2007-12-03', '874001082', '304 777 3681', 'rmilverton1j@discuz.net', '770 Lerdahl Circle');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (57, 4, 'Arley Chatelot', '2014-04-17', '205341798', '239 639 6953', 'achatelot1k@mapy.cz', 'Quang Ngai');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (58, 1, 'Lyon Losemann', '1991-11-01', '403104983', '724 477 5152', 'llosemann1l@mit.edu', '3 Ridgeview Parkway');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (59, 5, 'Elsey Vequaud', '1996-12-05', '487113030', '290 726 5077', 'evequaud1m@archive.org', '0 Bluestem Hill');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (60, 5, 'Melisse Grout', '1995-08-07', '736576126', '664 643 9586', 'mgrout1n@tmall.com', 'Da Nang');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (61, 5, 'Dode Furze', '1998-04-09', '561879059', '859 290 3407', 'dfurze1o@tripod.com', 'Vinh');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (62, 4, 'Ranice MacGiffin', '2016-07-24', '345931493', '751 932 8404', 'rmacgiffin1p@google.co.jp', '009 Browning Lane');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (63, 5, 'Homerus Nigh', '2017-10-23', '994508582', '528 153 1539', 'hnigh1q@nbcnews.com', 'Quang Ngai');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (64, 3, 'Shaine Orrocks', '2012-11-21', '423858919', '785 211 3827', 'sorrocks1r@google.co.uk', '7990 Moland Avenue');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (65, 2, 'Geoffry Kubista', '2011-11-22', '383338377', '914 297 8007', 'gkubista1s@examiner.com', '9 Barby Place');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (66, 2, 'Agosto Denney', '2011-05-13', '882741788', null, 'adenney1t@wsj.com', 'Da Nang');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (67, 4, 'Nobie Rome', '2011-07-19', '669860867', '738 796 6154', 'nrome1u@blogtalkradio.com', '8 Marcy Plaza');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (68, 5, 'Eugine Workman', '2010-02-14', '229022124', '138 843 0677', 'eworkman1v@japanpost.jp', 'Vinh');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (69, 1, 'Bram Peplaw', '2013-03-07', '252871621', '356 874 9173', 'bpeplaw1w@phpbb.com', '1 Old Shore Terrace');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (70, 3, 'Josiah Birkinshaw', '2005-09-02', '646304429', '417 394 6002', 'jbirkinshaw1x@ovh.net', null);
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (71, 4, 'Giulio Thomsen', '2012-06-26', '275915713', '755 295 1765', 'gthomsen1y@phpbb.com', '10 Hayes Way');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (72, 5, 'Fons Pinches', '2004-10-20', '880067481', '545 349 4594', 'fpinches1z@boston.com', 'Da Nang');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (73, 1, 'Romeo Piercy', '2017-11-04', '293992016', '952 376 8167', 'rpiercy20@tuttocitta.it', '60226 Sheridan Place');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (74, 4, 'Tiphanie Mottram', '2017-09-04', '581119047', '863 618 8745', 'tmottram21@aboutads.info', '292 Scofield Court');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (75, 1, 'Terrye Pigeram', null, '637488657', '198 769 8182', null, '680 Hudson Road');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (76, 5, 'Hetti Dikles', '2018-01-12', '405380681', '741 866 5658', 'hdikles23@phpbb.com', '2 Troy Court');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (77, 1, 'Aluino Yorston', '2017-01-25', '502201304', '644 417 3313', 'ayorston24@google.com', '5056 Gateway Junction');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (78, 2, 'Lenee Gebbie', '2009-03-10', '632847491', null, 'lgebbie25@tinypic.com', 'Da Nang');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (79, 4, 'Allyn Furmenger', '2008-01-30', '919255404', '976 458 9385', 'afurmenger26@unblog.fr', '654 Helena Park');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (80, 2, 'Yancey Gooday', '2000-07-17', '892845529', '621 992 4250', 'ygooday27@deliciousdays.com', '1525 Ilene Terrace');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (81, 2, 'Romeo Rapson', null, '236435473', '999 494 8107', null, '03 Continental Crossing');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (82, 2, 'Lainey Beccero', '2003-10-03', '521031609', null, 'lbeccero29@cocolog-nifty.com', '3 Milwaukee Junction');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (83, 5, 'Dione Baccup', '2017-05-06', '343647290', '285 356 4501', 'dbaccup2a@house.gov', null);
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (84, 4, 'Merrill Haddrill', '2009-01-06', '803942444', '723 661 8904', 'mhaddrill2b@histats.com', '744 Starling Plaza');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (85, 4, 'Doll Towner', '2013-08-11', '939334240', '142 466 6173', 'dtowner2c@amazonaws.com', '50 Corscot Center');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (86, 3, 'Stu Pettwood', '2010-09-01', '862872715', '579 581 0620', 'spettwood2d@wsj.com', '32 Monterey Avenue');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (87, 2, 'Goldina Gwynne', '1992-06-04', '992414658', '320 866 9347', 'ggwynne2e@blog.com', null);
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (88, 5, 'Sukey Birdsey', '2016-03-04', '722062689', '496 581 9084', 'sbirdsey2f@pbs.org', '74680 Tony Plaza');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (89, 4, 'Klara Guppie', '2010-07-30', '737247377', '955 318 3695', 'kguppie2g@dell.com', '74801 Armistice Hill');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (90, 2, 'Harri Casbon', '1997-04-27', '118646637', '563 464 5594', 'hcasbon2h@hostgator.com', 'Quang Ngai');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (91, 2, 'Whittaker Handman', '2014-11-27', '249002054', '858 253 8919', 'whandman2i@gmpg.org', '0 Mandrake Street');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (92, 1, 'Nerita Ravenscraft', '2014-12-28', '364945473', '739 176 7955', 'nravenscraft2j@nytimes.com', '84412 3rd Center');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (93, 3, 'Issi Ditty', '2005-04-07', '159785805', '187 373 8157', 'iditty2k@instagram.com', '9 Michigan Lane');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (94, 5, 'Beatriz Pettiford', null, '993883986', null, null, 'Quang Ngai');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (95, 5, 'Goober Dighton', '2002-03-14', '263011859', null, 'gdighton2m@sogou.com', '6792 Garrison Lane');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (96, 5, 'Casi Van Merwe', '1996-11-22', '142209080', '876 817 2147', 'cvan2n@shinystat.com', 'Vinh');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (97, 4, 'Allys Cozby', '2020-10-26', '719451236', '121 602 1118', 'acozby2o@bloomberg.com', 'Vinh');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (98, 3, 'Noell Hawker', '2020-04-23', '305329612', '297 708 6936', 'nhawker2p@issuu.com', '662 Rieder Point');
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (99, 3, 'Cymbre Youdell', '1993-09-23', '730211066', '184 332 0579', 'cyoudell2q@merriam-webster.com', null);
INSERT INTO furama_resort.KhachHang (idKhachHang, idLoaiKhach, hoTen, ngaySinh, soCMND, sdt, email, diaChi) VALUES (100, 3, 'Eryn Mingard', '2019-11-29', '262437439', '844 950 1773', 'emingard2r@163.com', '307 Pankratz Avenue');