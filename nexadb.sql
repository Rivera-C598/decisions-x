use nexa_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(50) UNIQUE NOT NULL,
    account_number VARCHAR(20) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    balance DECIMAL(10,2) DEFAULT 0.00,
    confirmation_code VARCHAR(10) NOT NULL
);


CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_from VARCHAR(50) NOT NULL,
    user_to VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE student_debts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    debt_amount DECIMAL(10,2) NOT NULL,
    hidden_fees DECIMAL(10,2) NOT NULL
);

insert into users (account_number, username, password, balance, confirmation_code) values ('2622709884', 'Addy Pincked', '$2a$04$SH35OdJv52ZTihNjqO8f4utGhP1kPib.Y5ztNC8a6RK1J3bp3UW8.', 7009.37, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('0412830354', 'Graeme Sewards', '$2a$04$AQEaoUreC0VyaOzsKRqfy.AUqQTX7AiRGvgg/c8C4qwJrXfSezhce', 802310.45, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7203350327', 'Freddie Griffitt', '$2a$04$pxQIEXzKunbKEvdiuzxRfe2MceHIAj9kntb5nicTdF8mznpQax9Mm', 558711.27, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7403667208', 'Sven Britney', '$2a$04$KaTwKrLq1H/LygLxD86WjOivN9241WX53k3qGjLadyhmIdOwVSePm', 98858.6, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4307490893', 'Clair Oscroft', '$2a$04$rAI2fK3EXrlBHX6RblhMwOvu4YgLhNM8XsIqx9afW1nRv7r0axSfC', 554077.0, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2839761715', 'Israel Quiddihy', '$2a$04$VcMwYig75ufUkyUz1GTbN.EZZ135f2kwjLlHU2wCS/piBURQh12s.', 182555.08, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('0347109946', 'Gabriell Ygo', '$2a$04$0jOoTLJFV/obRku.tpbzdeoa/uIUJGlLvw5dkTc54qIuTnRQSzyui', 623278.25, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9833733232', 'Barth Leahair', '$2a$04$kklHQkibDwJI0l.krzKbaOSyWkudrNwthvhFs0y4J/SaI4FIpRkzm', 328969.58, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3106581034', 'Fionna Curnucke', '$2a$04$bZkOuUwdJ.jyU2VQkhh0e.m4X/wwhXrQCPrnpbpl8Pa4SqC8sIdym', 111156.1, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9676529327', 'Margaretta Sleightholm', '$2a$04$bzS.Wa9n7vGvu8an19VyTOAys7/.TaKwhc7FBRG2yIEMTgvMRrzUi', 875496.12, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('1769150326', 'Rogerio Blasik', '$2a$04$a2W/oaesUonv3oSJaxgElegUa3mWo9f7wYmR4yW1V/B.Efgt67Lq2', 785074.68, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3086113021', 'Even Elgar', '$2a$04$yZJ1hvZeGYU/JGObQSc4ielTOufUYXeMGBSz2CfeEzUONic9ugb46', 642403.62, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9255841239', 'Ibrahim Dimitriades', '$2a$04$iobRVrBWcV0D.9uqqOXwYe2HHJmxnU9bTeUFrYdqCsD/Mqzn81xA2', 61932.51, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9947512351', 'Edithe Dowthwaite', '$2a$04$WF.YpPDqcVuOo7vU3LzVGO9r0Cmg8ykpSdt0u14UZ0tBYrcsYFZxi', 559104.82, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('1237305429', 'Walt Whittles', '$2a$04$l..wIh1b58eXRNXyr.sArOyVouTub77Agc4.bw.dh0biyWYBt538S', 15685.86, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4611072486', 'Bryana Sakins', '$2a$04$Tb6eUcCbWrnNvsSfYiZBleiM3AHRccOfD6PJM6bc.NBeBL5KOLUou', 820455.45, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3497833469', 'Witty Skipper', '$2a$04$6Lq3WY2L0vWA9T0Z4FRVEOIjmodbgHfIZAmWyQeA8uxq2P3kvdZLy', 362871.29, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4666496734', 'Anderea Basant', '$2a$04$WeQ3j5HSbU8CeOuzgcMJH.Q9LI2XQcH/Cvw40UCOsSFqLkPQ.kFq.', 199658.22, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2070179167', 'Danella Pentelo', '$2a$04$KALLOtIy.klXe1Lxytp9sOUg/cUIoguKTR9mOC.vayky5R4fpQWv2', 123599.34, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5430152060', 'Billye Whitehall', '$2a$04$0woqCM9JuHsddGcGK2.uq.zKpqztsnp2o9z1Ph1tTrovP0KWcQ62a', 230499.27, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('8547992497', 'Winfred Ditzel', '$2a$04$4QQQ0/wBVwdBqoP4V12YYOM2ADQ.7QP4.jWsz2/ZEVJqkeuioIogK', 549297.23, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('0655642413', 'Archibald Coyte', '$2a$04$T.YhxEDZCX2L5iItUtq1Gu76u5PL2VuGkg2DJ4WcCEKrXrJ9Eu16a', 834360.49, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5687632513', 'Rurik Davers', '$2a$04$iTBhiwgUY9mnqGsP2/ImfOi6KpCeUqxKa7hKZUe8uEpVjJUvN.m86', 601856.07, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5556963818', 'Babbette Sherbourne', '$2a$04$Uwnr9bou6klm7UqgHWo3nuitZaQ01LumgNUT/GnRZqYsa/PNMpgR2', 323249.89, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('1122574026', 'Reinwald Sharrock', '$2a$04$KA9mbCSNMTSCKAbUTPk9iezE195qtXJuYJGhLIc2MqJLYiGxnbocq', 586261.34, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3386292534', 'Etti Nuzzti', '$2a$04$BYgfBpA9HrU7GG/VB9Eq3.eZNENtXxeY2J4O/iL1jLPpf37LPQIcm', 723650.47, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3929264029', 'Devora Roddell', '$2a$04$d41xmnYgqxboYTBBDg1B0O03pR56Bxj6OHOM1ZxTN51.SrDvg/ad6', 479552.38, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2740773187', 'Lalo Back', '$2a$04$XaPnbMYXFqvQJMeX7.K0guhj5fu4dPCvj.6MW8uKYFvKKBQaTrEjO', 677976.67, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7500706351', 'Nevin Gauford', '$2a$04$MucI2ioCn7kpdTCWdYkYn.9HNTsH667zuOsyaMPIANXSLMV1EojFW', 507493.0, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('6423073855', 'Marillin Elvidge', '$2a$04$P3iSN/Lkqv9oJ.4LNDx5V.FBXNr9I08sWCQ.ReA/PlRxXbXn69ZSK', 620471.81, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9891288702', 'Billie Hanfrey', '$2a$04$ajKam5orJj6pMuLKf.DeU.2xai8ICB2KSbcufXC1S8qlESQEqFk/q', 148417.2, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4963407799', 'Thelma Crooks', '$2a$04$baccgvsFHEP8HBC6HpH.T.eXkQ7wRpwVh0UyJkeJNe4rj9F8pg4xC', 778019.25, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7637948000', 'Ive O''Glassane', '$2a$04$oCm.oOAXM3ElNIqN4KFCwuue7OTBwbKb2o68jodeKVixWAp48JgK.', 112411.9, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('8570788491', 'Shaylyn Mattussevich', '$2a$04$ISfsMyzvjOURnrjvgMcQue62O9JMDcBrH2uQpJeFoOnV24hsAGyau', 217352.52, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4888473881', 'Jae Elfleet', '$2a$04$8bP.Wsd70a.wEseelgUVgepYMKujc66uiuP.yW.mVCBoJfykx6Qeu', 814190.95, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3857849085', 'Salomi Lauder', '$2a$04$u/ljAoRJIr7ptx7eUiTtAeurNTAAkmIMnCxqPm8g8MbXC1MOq8LUO', 692516.03, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('8604380037', 'Sutton Sails', '$2a$04$jXKIF.32waQFYko0DJ/CCevRJpRUCaN88fPVeEVhLIjnJDOIf8Z3S', 945972.3, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2086523435', 'Rob Cramer', '$2a$04$UKfnJtoV8ZsTMKbBH1Pss.bX1hZa8sh9dcq3ug40HZZmj/CEmYrSW', 810866.16, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4865908897', 'Falito Ondrousek', '$2a$04$Bdvb.dmz2ZWLJ97mn1GzHuIdMqO7/eOkiTxXR/.BLH3HEqJxjqgbq', 214444.14, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('8806672670', 'Janot Leydon', '$2a$04$QLZH6LX7abL1fn1DniFNN.CoiWS3kNO5XTSF6fxF.qqa.JFWvTreu', 708235.06, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4459072804', 'Meredithe Serotsky', '$2a$04$VTQHfzryEDgXdWcdEirwKevK3I7170df1VgXm5E8Ltnp6oaRju/XO', 377161.34, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2906017302', 'Koren Freake', '$2a$04$z5MEC1vTFvxlAp6ICnxXreCR4Rprmdv58acsAgJEHVIXlCw3pUwt6', 494545.73, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7576828842', 'Reina Palluschek', '$2a$04$SttJiI.pG9dB7E.1Vfa/ku840ixcLxsB8ODncGI29llZ5hW3Axgze', 672819.4, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3541202394', 'Brit Lambarth', '$2a$04$2Fy9UPjUPCEVV2s/XJtoRerhlTtOqspn/oCws8aB/rwAqvNAGMB.6', 630238.57, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('1643246239', 'Prescott McGinn', '$2a$04$66x/2J5G/1vEzp6Kznwrg.Cc1IGpsEG2QrQVnqeow3ZbS7XiPrAZG', 165510.58, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('6777047303', 'Betsy Mewett', '$2a$04$coNj87ORvt0UYut4ELtwQuSFKtrKfGaFmd1DmKbAst0NEpVbwP/VO', 185334.32, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3894934942', 'Jaclin Mechem', '$2a$04$b4eeRpcFWB7myEPyGcPy8.Gx4SdYzhYgxYjOkGshv5ZWC4UxRfyyW', 769914.08, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('8480548814', 'Pearce Climar', '$2a$04$C54ugqh0AmMkIFOIMOb6duw3Cvnr59ojI835A9H/bW.RVRK3TWA3q', 353047.05, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7260386732', 'Aundrea Dirkin', '$2a$04$sOXP/k90eWmWWAz7awOQe./Aos5f/J0GxkHJd3x4zDeUkctiXoAQO', 39704.82, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2790134472', 'Sauveur Delhay', '$2a$04$ZJgvwiGXlWeupY7bEIy0..qkKCDifhO9BvWKr9RDftUvjhVm7syLa', 307107.0, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2015826878', 'Kittie Kennon', '$2a$04$lp4/Td4MC7dH0RXSsIklSekHm78KhWnJWjPQ0aek4cq6SHTSi.Ziy', 625175.64, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('0063478069', 'Debee Buckie', '$2a$04$aDHectOQZE5YDGuoo2MOpu0gUQV6SLyqJIyU4XvBwUlXPEjuwqnOG', 195313.8, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4829595783', 'Cynthie MacGillavery', '$2a$04$dPEwaIQMmWMNrkJqO3dRJ.jwWM03iBDSlXAbiCJ5UybDoJo2upv4y', 219569.64, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7085230505', 'Fee Yelland', '$2a$04$o1MvScH9gikQ0M2r0YcZbu/6NWiBph0J4PUQmRnAMpMeJ3fMxWXby', 958237.25, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3583036213', 'Davie Brothers', '$2a$04$0rtpJPb2RX6oUSXTTFOrOOYTf87f3fq59FNsOqNWSLwdeBZq82JAW', 886321.53, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2408023265', 'Nahum Di Biasio', '$2a$04$vKZ24A1VFEEysTJbG5M1XeknsHhm.1YPgL2CWqvVu1kVn9ZsWSF/O', 486303.11, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3018799525', 'Sharlene Conachie', '$2a$04$ZicSKO7BKpTRkAILWFkLt.rFAphlm7kkTCECWyXAlhZKE6tYLefVC', 258295.26, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2236792008', 'Alika McIlory', '$2a$04$5WRrlPWfGp3A5z6Hsljp1u0S8sfk.Dp/sKy1Y1UXeyvccziHWSvJy', 888098.34, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2895301495', 'Katerine Novill', '$2a$04$BsTHm8DfuaRZ8kJzp.d8XutfyUHU6dAfELIRDAAw44DInDODu/eBe', 734829.17, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2459140275', 'Lorilyn Ancliff', '$2a$04$WGQIeyiIExoWHillKdFeaONZz0OEsb858RuP3fBjqQoy3zLmD.gVa', 886854.55, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4152938285', 'Bald Pitts', '$2a$04$kKa/1XKBAYi3rbx7eXwPy.MDdGpOO2XgC58l.k/igwgE5NJGw0IvW', 309450.26, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5033644882', 'Hill Doelle', '$2a$04$PcSl1NBTH8tuMhMRONzP4O7PU7/av1xrAPUlMJGkq.bUPiGlNOc/K', 10158.41, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9398593718', 'Damara Paolino', '$2a$04$OuOXK9IzbvxtDDJhLoCCjutNAw7J0gS3uDOmUKhZb4k/KGPMJ2YE6', 960697.08, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2860868653', 'Chlo Matskevich', '$2a$04$f23wySQ4yVIQrEztJPJteudXzX6VYu50GlHKm7zgGpaGvRR/Qonwy', 732890.16, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4066763534', 'Ahmad Janicki', '$2a$04$/GH3tGRE3O/TVh5SB36WN.MysLf7bk93HH/Wt70o7UDAZ07llsE5O', 811508.63, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5134026002', 'Joscelin Messingham', '$2a$04$huT/.XqeJCdEgfea7SsdxezhIrTL8Rz8K9Sdi/g/PU90KvgMLUi4a', 681.54, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7180393074', 'Chrystal Fennick', '$2a$04$ay6zuOsKT/M/2Jrx6YcG2epk5n3rcYYHlV4oPYKGAmXMvluNhNb1W', 827345.74, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7594326615', 'Celene Burnall', '$2a$04$pUb3i6SRREDg.msf4jYKxeHjJ4aI3sq5QkBeOSBTaPXLa3V7Ilbdy', 989253.92, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5681587201', 'Costanza Simmonett', '$2a$04$Z5WXd1naLKbNcs2m9Ngk4.ithABMP5e4CWfbfMH0tKolLBIVBsnmy', 7491.68, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('8736611862', 'Jamal Matheson', '$2a$04$yRqETFchoFSTNeyDt78GROi8CF.DCm62omUU6mR.2zpmlB1iYujdO', 209451.81, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4184115893', 'Brenden Birden', '$2a$04$8u.Po.3WuTbfuhN.W9J2kuxzEd6thSWVhv0FEsB2.euXOthT5YW5O', 445492.09, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9031073017', 'Elsi Bensley', '$2a$04$gcFSJ0cFYKM3SW7po5Bz3O.6FepO5YqlyRQ43k.k6zQ8bz/.vPa6.', 434567.43, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('8970753132', 'Shelia Stife', '$2a$04$3hfmHcSdObkZoQcNay4ugek4oTbtXAlhCjAe8rxRFTyzxBCAiu6HK', 641854.53, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5406569955', 'Mauricio Tonkin', '$2a$04$U5OYOPxcZP/gzEJ5IvDJxOJDPlexT9HmA94JTN8B1IABmeRrESf96', 208570.41, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('1797965642', 'Nerita Hay', '$2a$04$XqEezevTUo4Bg7CGEo6vsOhlDbDzjyDMy/yhW8Jds8umhhIQNC8va', 628029.35, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2249624711', 'Linnell Kinnock', '$2a$04$7SYHiIoW0ivJH.RImxKdUONFGScn3.IXlbrJ5PTEOjhvj8px9UdUm', 515811.64, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('6867318753', 'Gannon Farress', '$2a$04$Zk5CbXP6VRvONH.5w2a36uJwEKm7jGKIIAAGaTBUAW1cTPUG2Ti0W', 123698.94, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5017734135', 'Diego Smullin', '$2a$04$eRVpg64Iw6aQpbNezSMKqerdjA5VBtecZ5exdPSUedm9QkR8T3Jj6', 757739.88, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2068638175', 'Caitrin Dutch', '$2a$04$PCUOkqGN0L.enq96Ey3wgOMsHdYJq6CPH8c7fDh312nRKzhRWT5lK', 397697.47, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('6235803855', 'Welbie Rogez', '$2a$04$zbxTMmFk8tGP2HJMiHzuwuHLY2fz51DnfvYFlk0OYxedancdxvAk2', 731965.26, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('0827346520', 'Jorrie Hurlin', '$2a$04$ML2nO6EFwClgxjoqocEweuqObjZuV4Sa8vBq5j174BmPxbbdC9IWa', 969699.85, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7726922365', 'Carol-jean Dosdell', '$2a$04$RlPbi0aub8NJsAHWUyAbYOVvXVyjBnsA8s6pY4gVvcFZZLJgsiYxC', 351631.35, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('6944676690', 'Floris Privett', '$2a$04$Vx1RFIljZhTTeDe57Vf9k.kAw0oXWwmbFqYclZ/O.ntqav/A8Upe.', 583657.74, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9926075887', 'Malva Saphir', '$2a$04$ve3yPDtQxS1lJRBVrUp9JuMs.cGTfXN6fmQ6TMwpdAKnUBrr8dlJu', 251498.46, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('7627427082', 'Gallagher Stihl', '$2a$04$x4pkifKyLMHOeSE3rpZ4WesRU6.nJIH0KdDJU7GBBKp46P3Uh.LuW', 561973.74, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('6000209433', 'Dag Kennelly', '$2a$04$uG3SHPFauZ4QRDtSUNkYIOQKTlye0R4eeeRgZSBu86u.RaNCv22Au', 33367.33, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('0403830590', 'Cammy Costerd', '$2a$04$9MxKNuhk2J.eLbpDqAhEdOGFGgyRq9QSf85mYQTYVbyO6nYj4JNJC', 777042.6, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5459267540', 'Kelcie Brecknall', '$2a$04$fNlnEi4bVhEa5qpsaoQW8OYIWCcd9P5c0WwZ5OMxq0cLOrv0rvs6m', 674288.49, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('6252050548', 'Bartolemo Stubbeley', '$2a$04$8Ya8HbHwmFK0g0CP1uT7pOPvC40mSzwFJnaLSTOKdGIxYUI/Lhany', 63761.19, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4042741177', 'Sorcha Preuvost', '$2a$04$2BQOQjV7ULdDlczkN3/7teESWZiVIe.9IpuYJzkGY/IV9Ql2qyBV.', 804572.47, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('8206476072', 'Lew Kidstone', '$2a$04$TEgVffnTqu6UAGV2IF/RFOXzbXL2QxulDUZ.EH8klt7VwsRDUufNO', 116643.37, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('3094655667', 'Laura Tremelling', '$2a$04$hh46xpQAbd4NfxQIcwoxjOaPF5AQxlQtGY9zpeRXiiEwHNG/KW/hW', 350290.98, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('4927685109', 'Bronny Monteaux', '$2a$04$ypBDgNMouFosEjjqwH/5HOPuN.mcvEfYFL0MUPHIOBdrpx1rv.FKO', 482129.79, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2843592781', 'Erna Stanes', '$2a$04$Da2Jce/reoXRvWWGqlneMeB1PMpTTetg9FSYIJthUvXhUuEiDI/y2', 107176.79, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('2380486655', 'Cassy Kikke', '$2a$04$X9YmpIFHXZw6W.91njSMQudu/euvcPYiegQGWtUoUEdOvMzgvqO8i', 395526.1, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9643086858', 'Cloris Ganderton', '$2a$04$U4Do.Whr52/e24cBxDVf9OPf33oHMvtfMdjOSM/lPV2.8RFY4A/uy', 434929.73, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5253589362', 'Jo-anne Draude', '$2a$04$oX/Hd05FFMCVLh4RW6.9J.kbTX9LmwOOrRx.3ECgq22cufw4Z8sJe', 291593.79, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('5846146716', 'Howie Gimlet', '$2a$04$NjgaLu/iC4HvOVzFNMhdGOsHaqE1T2YBVBrlkMXxs7tI7PrzvluVS', 541492.33, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('1728663420', 'Giffie Jugging', '$2a$04$Jx3kfKKa843.Y3Uq4YhGmOzcpD7uIaptFhKeh2roeHZH9GCu71rqi', 41066.13, '142831');
insert into users (account_number, username, password, balance, confirmation_code) values ('9801189667', 'Mechelle Clair', '$2a$04$LAOOGz8Esk7tJoxdEgL43ejcLoZqD2XpZkRCv36IXs.QViD2co3Qu', 715478.42, '142831');

insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3854645677', 'Francisco Shaw', 124937.4, 21722.12);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3898180741', 'Devan Renbold', 559300.4, 68722.12);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3650585852', 'Emmett Matyushonok', 858710.26, 66033.93);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4465420349', 'Sasha Gilford', 469480.05, 78145.65);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('1419348959', 'Alberto Bowfin', 880737.74, 73441.55);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6721056860', 'Jacqueline Aldhous', 303308.1, 32492.06);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3311013266', 'Filide Bee', 571957.71, 66806.24);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5926527230', 'Gayleen Ungaretti', 292331.13, 46361.69);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('2094580008', 'Sibley Feasey', 63341.96, 95432.21);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('9663932220', 'Eileen Surfleet', 817694.89, 19686.32);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('2731846961', 'Nevsa Myring', 957506.58, 41086.44);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('1590263396', 'Sibyl Cleworth', 637911.73, 52053.12);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4443115419', 'Henrieta Peddersen', 17406.19, 27808.21);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('2440968298', 'Dale Davenell', 5047.5, 55578.96);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3293573887', 'Christabella Boutellier', 578743.55, 54994.53);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6487405294', 'Isadora Parcall', 492311.29, 66665.79);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('2614916958', 'Findlay Elkington', 816058.96, 48808.06);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('1739202037', 'Florian Gillum', 958508.68, 62125.9);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('9010295808', 'Sheela Farryann', 622895.25, 76262.51);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0721391838', 'Danielle Alsford', 104874.61, 76996.08);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0530455061', 'Meara Gottelier', 521592.63, 38323.58);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0202974569', 'Liuka Bredes', 724756.23, 3555.94);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('7469785007', 'Kinna Lude', 903834.31, 40324.74);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8065830452', 'Georgeanna Cicchelli', 405435.89, 84085.46);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('2675336543', 'Dayle Poynor', 56151.34, 50717.5);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4633039088', 'Andy Grocock', 482368.34, 99406.72);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('2718708513', 'Ynes Carrabott', 642821.3, 9014.55);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5066303656', 'Lucien Wake', 95812.8, 9671.78);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0679482221', 'Eirena Kikke', 428874.92, 70144.02);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('9846097063', 'Kathryne Pennycord', 508776.17, 19317.41);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8880315580', 'Siobhan Stanborough', 331068.21, 75953.75);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('7688761407', 'Frayda Trusty', 37252.08, 99691.85);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8771603438', 'Aubine Cleaveland', 970827.87, 93891.21);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8756134012', 'Dionisio Ort', 334702.7, 47679.45);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8940405729', 'Merrick Mosby', 446706.78, 52910.93);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8711774409', 'Cad Fennick', 554589.03, 32840.61);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0790266872', 'Marylin Berrey', 603363.41, 63660.86);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3867026257', 'Spenser Rowntree', 564911.29, 59663.48);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('9825171787', 'Elly Dunridge', 781528.39, 19970.37);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('1884496796', 'Meade Gentle', 168280.49, 25785.93);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6367977330', 'Waylon Antosik', 975844.5, 73659.97);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('2027644698', 'Pammi Sneden', 655171.87, 18439.35);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5066368693', 'Tyrone Caulkett', 954983.34, 12848.9);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6154203758', 'Anna Weavers', 32130.16, 14034.12);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4321643591', 'Benedetto Chaudrelle', 497077.84, 27587.0);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3175117687', 'Rosemarie Strangwood', 957244.7, 83603.85);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6876006066', 'Byrle Victoria', 633743.88, 71036.1);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4844134327', 'Lorine Rosander', 102997.45, 146.65);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4089214710', 'Helen-elizabeth Maymond', 337636.52, 37100.7);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5675405845', 'Odelinda Burthom', 893222.99, 98185.27);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6909094851', 'Norene Pierpoint', 577316.8, 84508.49);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8107019224', 'Obadiah Bartolomivis', 113494.92, 46870.41);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5942833179', 'Nicholas Feldstein', 661957.94, 1713.16);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6947252657', 'Ellyn Chaffe', 765892.0, 81887.2);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5529262058', 'Corena Perell', 975855.94, 5144.46);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('7331916576', 'Clemmie Barrat', 960007.68, 37504.79);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('2550100569', 'Ulick Grabham', 788755.37, 85950.65);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6254992653', 'Rustin Windibank', 332882.03, 97277.1);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5689169701', 'Josephina Gounel', 785166.37, 81968.65);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3131656123', 'Hansiain McGloin', 991594.65, 31051.66);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6825121710', 'Nadean Thay', 437835.13, 74648.72);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('7730784731', 'Lindsey Critten', 208773.41, 24262.97);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4180039000', 'Spence Van de Vlies', 62565.56, 69525.36);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('9266491144', 'Suzann Escalante', 143767.4, 83117.05);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6457475557', 'Jorry Jaime', 139832.17, 10069.74);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3318082295', 'Sydelle Wallworth', 165197.41, 66761.64);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8049320797', 'Jerri Fernie', 362028.66, 39193.19);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('7552138205', 'Roda Dance', 141300.94, 53451.87);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('7974477523', 'Nadya Lantoph', 373604.67, 29916.44);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3024740515', 'Kamillah Dennerley', 752843.3, 20678.15);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('7828442682', 'Valentin Kryzhov', 379612.76, 20275.96);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('9359199863', 'Layla Moxley', 738815.14, 31642.26);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5405147417', 'Jock Ince', 393931.95, 63342.07);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('7147113684', 'Rolando Finneran', 318888.82, 46284.47);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('2748656119', 'Fulvia Heyfield', 813657.18, 13115.07);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6976771551', 'Inna Besse', 25631.44, 67927.03);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6419352149', 'Dione Caddan', 500076.98, 84551.55);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8148912004', 'Emily Precious', 611736.62, 6407.35);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4438415626', 'Shanna Bultitude', 342718.73, 28093.62);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4490174477', 'Manya Storrie', 129332.48, 98859.88);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('1127985375', 'Del Pawling', 213137.02, 73004.1);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('9232917324', 'Gill Ubsdell', 535272.67, 95322.49);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('1526876806', 'Kirsteni Geelan', 294033.3, 76036.42);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('8551565437', 'Gabi Featherstonhalgh', 423822.82, 26850.48);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('1197395213', 'Mose Gretton', 21910.47, 24063.7);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6068328193', 'Ramona Palfree', 829972.32, 30390.0);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3870303090', 'Grantley Marron', 137948.42, 68340.28);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0032853545', 'Geoffry Keets', 481644.84, 32165.2);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('4080944199', 'Darline Trenholm', 872369.8, 69239.61);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5123193618', 'Katti Overington', 167032.09, 95856.91);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('7239881837', 'Ame Gallant', 926807.26, 70360.85);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5184827639', 'Thomasa Planks', 550968.11, 3714.4);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('3922538867', 'Lilla Upton', 424443.06, 11130.08);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0219970250', 'Rebe Plaschke', 125118.44, 69796.1);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0814156940', 'Sheilakathryn Zamora', 439848.87, 41253.81);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6810697919', 'Nellie Carlo', 576696.56, 50030.58);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('6461798790', 'Chilton Roe', 820752.57, 20813.34);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0178811884', 'Christiane Bending', 627202.04, 50120.26);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('1987595845', 'Verene Fever', 686431.76, 25434.18);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('5833530532', 'Gaelan Sawdon', 792258.27, 27234.35);
insert into student_debts (account_number, username, debt_amount, hidden_fees) values ('0991874002', 'Jessalin Rewbottom', 522184.77, 912.52);
