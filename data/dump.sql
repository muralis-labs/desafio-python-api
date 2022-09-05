DROP TABLE IF EXISTS tipos_pagamento;

CREATE TABLE IF NOT EXISTS tipos_pagamento (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
   	tipo TEXT NOT NULL
);

INSERT INTO tipos_pagamento (tipo) 
VALUES 
    ('dinheiro'),
    ('débito'),
    ('crédito'),
    ('pix');

DROP TABLE IF EXISTS categorias;

CREATE TABLE IF NOT EXISTS categorias (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
   	nome TEXT NOT NULL,
    descricao TEXT
);

INSERT INTO categorias (nome) 
VALUES 
    ('custos fixos'),
    ('alimentação'),
    ('transporte'),
    ('medicamentos');

DROP TABLE IF EXISTS despesas;

CREATE TABLE IF NOT EXISTS despesas (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
   	valor REAL NOT NULL,
	data_compra TEXT DEFAULT CURRENT_DATE,
    descricao TEXT,
	tipo_pagamento_id INTEGER,
    categoria_id INTEGER,
    
    FOREIGN KEY (tipo_pagamento_id)
        REFERENCES tipos_pagamento (id),
    FOREIGN KEY (categoria_id)
        REFERENCES categorias (id)
);
