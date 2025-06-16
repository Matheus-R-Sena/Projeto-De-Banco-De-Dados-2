USE trabalhoBancoDeDados2;

-- obs: sem indíces de chaves primárias

CREATE INDEX idx_ninja_id_vila ON Ninja(id_vila);

CREATE INDEX idx_cla_nome ON Cla(nome);

CREATE INDEX idx_ninja_id_cla ON Ninja(id_cla);

CREATE INDEX idx_kekkeigenkai_nome_kekkei ON KekkeiGenkai(nome_kekkei);

CREATE INDEX idx_ninja_kekkei_id_kekkei ON Ninja_Kekkei(id_kekkei);

CREATE INDEX idx_ninja_kekkei_id ON Ninja_Kekkei(id);

CREATE INDEX idx_sensei_id_time ON Sensei(id_time);

CREATE INDEX idx_ninja_invocacao_id ON Ninja_Invocacao(id);

CREATE INDEX idx_ninja_invocacao_id_invocacao ON Ninja_Invocacao(id_invocacao);

CREATE INDEX idx_ninja_nome ON Ninja(nome);

CREATE INDEX idx_ninja_arma_id ON Ninja_Arma(id);

CREATE INDEX idx_ninja_arma_id_arma ON Ninja_Arma(id_arma);

CREATE INDEX idx_ninja_time_id_time ON Ninja_Time(id_time);

CREATE INDEX idx_time_nome ON Time(nome);

CREATE INDEX idx_hokage_id_vila ON Hokage(id_vila);

CREATE INDEX idx_time_missao_id_missao ON Time_Missao(id_missao);

CREATE INDEX idx_missao_rank ON Missao(`rank`);

CREATE INDEX idx_ninja_time_id ON Ninja_Time(id);