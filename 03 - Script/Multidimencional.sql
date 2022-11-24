
CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL,
                nk_data DATE NOT NULL,
                desc_data_completa VARCHAR(60) NOT NULL,
                nr_ano INTEGER NOT NULL,
                nm_trimestre VARCHAR(20) NOT NULL,
                nr_ano_trimestre VARCHAR(20) NOT NULL,
                nr_mes INTEGER NOT NULL,
                nm_mes VARCHAR(20) NOT NULL,
                ano_mes VARCHAR(20) NOT NULL,
                nr_semana INTEGER NOT NULL,
                ano_semana VARCHAR(20) NOT NULL,
                nr_dia INTEGER NOT NULL,
                nr_dia_ano INTEGER NOT NULL,
                nm_dia_semana VARCHAR(20) NOT NULL,
                flag_final_semana CHAR(3) NOT NULL,
                flag_feriado CHAR(3) NOT NULL,
                nm_feriado VARCHAR(60) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT dim_data_pk PRIMARY KEY (sk_data)
);


CREATE TABLE public.dim_rodovia (
                sk_rodovia INTEGER NOT NULL,
                nk_numrodovia INTEGER NOT NULL,
                estado_rodovia VARCHAR(2) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_rodovia PRIMARY KEY (sk_rodovia)
);


CREATE TABLE public.dim_multa (
                sk_multa INTEGER NOT NULL,
                valor REAL NOT NULL,
                nk_cod INTEGER NOT NULL,
                data DATE NOT NULL,
                hora TIME NOT NULL,
                tipo VARCHAR(50) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_cod PRIMARY KEY (sk_multa)
);


CREATE TABLE public.dim_proprietario (
                sk_proprietario INTEGER NOT NULL,
                nk_cpf INTEGER NOT NULL,
                cidade VARCHAR(50) NOT NULL,
                bairro VARCHAR(100) NOT NULL,
                estado VARCHAR(30) NOT NULL,
				sexo CHAR(1) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_propritario PRIMARY KEY (sk_proprietario)
);


CREATE TABLE public.dim_veiculo (
                sk_veiculo INTEGER NOT NULL,
                nk_cod INTEGER NOT NULL,
                cor VARCHAR(20) NOT NULL,
                renavan INTEGER NOT NULL,
                placa VARCHAR(7) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_veiculo PRIMARY KEY (sk_veiculo)
);


CREATE TABLE public.ft_infracao (
                sk_infracao INTEGER NOT NULL,
                sk_proprietario INTEGER NOT NULL,
                sk_rodovia INTEGER NOT NULL,
                sk_veiculo INTEGER NOT NULL,
                sk_multa INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                CONSTRAINT sk_infracao PRIMARY KEY (sk_infracao)
);


ALTER TABLE public.ft_infracao ADD CONSTRAINT dim_data_ft_infracao_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_infracao ADD CONSTRAINT dim_rodovia_ft_infracao_fk
FOREIGN KEY (sk_rodovia)
REFERENCES public.dim_rodovia (sk_rodovia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_infracao ADD CONSTRAINT dim_multa_ft_infracao_fk
FOREIGN KEY (sk_multa)
REFERENCES public.dim_multa (sk_multa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_infracao ADD CONSTRAINT dim_proprietario_ft_infracao_fk
FOREIGN KEY (sk_proprietario)
REFERENCES public.dim_proprietario (sk_proprietario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_infracao ADD CONSTRAINT dim_veiculo_ft_infracao_fk
FOREIGN KEY (sk_veiculo)
REFERENCES public.dim_veiculo (sk_veiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
