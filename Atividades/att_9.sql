-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Maio-2021 às 18:56
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `att_9`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `Nome` varchar(30) DEFAULT NULL,
  `Sigla` varchar(3) DEFAULT NULL,
  `Codigo` int(3) NOT NULL,
  `Coordenador` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`Nome`, `Sigla`, `Codigo`, `Coordenador`) VALUES
('Tec. Telematica', 'DTT', 121, 121031),
('Tec. Construção de Edificios', 'DCE', 122, 122047),
('Eng. Computação', 'DEC', 125, 125331);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependentes`
--

CREATE TABLE `dependentes` (
  `MatricProf` int(6) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `RG` varchar(13) NOT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `DataNasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `dependentes`
--

INSERT INTO `dependentes` (`MatricProf`, `Nome`, `RG`, `Sexo`, `DataNasc`) VALUES
(121003, 'José Ramon', '80.222.555.9', 'M', '1998-05-19'),
(121031, 'Elly Barros', '40.022.007.1', 'F', '1972-08-22'),
(122045, 'Meyre Barros', '12.137.019.2', 'F', '1974-02-25'),
(122047, 'Bianca Torres', '77.157.864.3', 'F', '1998-09-03'),
(125332, 'Leandro Bezerra', '02.787.364.6', 'M', '2004-02-16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `MatProf` int(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `email`
--

INSERT INTO `email` (`MatProf`, `email`) VALUES
(121003, 'pedropereira02@gmail.com'),
(121031, 'josemariacampos@gmail.com'),
(122045, 'bentocosta@gmail.com'),
(122047, 'anaclara186@gmail.com'),
(125331, 'maria_luiza_machado@gmail.com'),
(125332, 'joana_maria@gmail.com'),
(125335, 'joaocarlos_matos@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `Nome` varchar(15) DEFAULT NULL,
  `SNome` varchar(15) DEFAULT NULL,
  `Matricula` int(6) NOT NULL,
  `DataNasc` date DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Salario` float DEFAULT NULL,
  `Matric_Coord_Area` int(6) DEFAULT NULL,
  `Depto` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`Nome`, `SNome`, `Matricula`, `DataNasc`, `Sexo`, `Salario`, `Matric_Coord_Area`, `Depto`) VALUES
('Pedro', 'Pereira da Siva', 121003, '1982-03-25', 'M', 4000, NULL, 121),
('José Maria', 'Campos', 121031, '1978-04-10', 'M', 7000, 121003, 121),
('Bento', 'Diniz Costa', 122045, '1980-11-27', 'M', 4000, NULL, 122),
('Ana Clara', 'Araujo Santos', 122047, '1994-12-30', 'F', 7200, 122045, 122),
('Maria Luiza', 'Machado', 125331, '1974-08-16', 'F', 6800, 125332, 125),
('Joana Maria', 'Pereira', 125332, '1990-06-12', 'F', 4500, NULL, 125),
('João Carlos', 'Matos Cavalcant', 125335, '1976-07-22', 'M', 3700, 125332, 125);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `Nome` varchar(30) DEFAULT NULL,
  `Codigo` int(6) NOT NULL,
  `Depto` int(3) DEFAULT NULL,
  `Duração` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`Nome`, `Codigo`, `Depto`, `Duração`) VALUES
('Deep Learning', 123001, 125, 300),
('Segurança de Redes', 123002, 125, 300),
('Análise de Dados', 123003, 125, 300),
('Topografia', 123004, 122, 300),
('Tecnicas Construtivas', 123005, 122, 300),
('Sistemas de Comunicação', 123006, 121, 300),
('Redes de Longa Distancia', 123007, 121, 300);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `MatricProf` int(6) NOT NULL,
  `telefone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`MatricProf`, `telefone`) VALUES
(121003, '(81)99889-2233'),
(121031, '(83)98877-1234'),
(122045, '(83)99405-4321'),
(122047, '(81)99463-7819'),
(125331, '(83)99406-6532'),
(125332, '(83)99559-7788'),
(125335, '(83)99268-6278');

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalha_em`
--

CREATE TABLE `trabalha_em` (
  `MatricProf` int(6) NOT NULL,
  `CodProj` int(3) NOT NULL,
  `Horas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `trabalha_em`
--

INSERT INTO `trabalha_em` (`MatricProf`, `CodProj`, `Horas`) VALUES
(121003, 123006, 300),
(121031, 123007, 300),
(122045, 123004, 300),
(122047, 123005, 300),
(125331, 123003, 300),
(125332, 123001, 300),
(125335, 123002, 300);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_PROFESSOR` (`Coordenador`) USING BTREE;

--
-- Índices para tabela `dependentes`
--
ALTER TABLE `dependentes`
  ADD PRIMARY KEY (`MatricProf`,`RG`),
  ADD KEY `FK_MatricProf` (`MatricProf`) USING BTREE;

--
-- Índices para tabela `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`MatProf`,`email`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`Matricula`),
  ADD KEY `FK_DEPARTAMENTO` (`Depto`) USING BTREE;

--
-- Índices para tabela `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_ProjDepto` (`Depto`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`MatricProf`,`telefone`);

--
-- Índices para tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD PRIMARY KEY (`MatricProf`,`CodProj`),
  ADD KEY `FK_ProjProf` (`CodProj`),
  ADD KEY `fk_MatricProf` (`MatricProf`) USING BTREE;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `FK_PROFESSOR` FOREIGN KEY (`Coordenador`) REFERENCES `professor` (`Matricula`);

--
-- Limitadores para a tabela `dependentes`
--
ALTER TABLE `dependentes`
  ADD CONSTRAINT `FK_PROF_DEP` FOREIGN KEY (`MatricProf`) REFERENCES `professor` (`Matricula`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `FK_ProfDepto` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Codigo`);

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `FK_ProjDepto` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Codigo`);

--
-- Limitadores para a tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD CONSTRAINT `FK_MatricProf` FOREIGN KEY (`MatricProf`) REFERENCES `professor` (`Matricula`),
  ADD CONSTRAINT `FK_ProjProf` FOREIGN KEY (`CodProj`) REFERENCES `projeto` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
