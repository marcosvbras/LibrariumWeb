-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 14-Jul-2016 às 00:37
-- Versão do servidor: 5.6.12-log
-- versão do PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `librarium`
--
CREATE DATABASE IF NOT EXISTS `librarium` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `librarium`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `status_area` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `area`
--

INSERT INTO `area` (`id`, `nome`, `status_area`) VALUES
(1, 'Banco de Dados', 1),
(2, 'Mobile', 1),
(3, 'Programação', 1),
(4, 'Padrões de Projetos', 1),
(5, 'Web', 1),
(6, 'Redes', 1),
(7, 'Sistemas Operacionais', 1),
(8, 'Cloud Computing', 1),
(9, 'Guias', 1),
(10, 'Controle de Versão', 1),
(11, 'Frameworks', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `status_autor` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id`, `nome`, `status_autor`) VALUES
(1, 'Mauricio Aniche', 1),
(2, 'Carlos Bueno', 1),
(3, 'Alexandre Aquiles', 1),
(4, 'Rodrigo Ferreira', 1),
(5, 'Guilherme Silveira', 1),
(6, 'Alberto Souza', 1),
(7, 'Anderson Leite', 1),
(8, 'Daniel Romero', 1),
(9, 'Daniel Wildt', 1),
(10, 'Dionata Moura', 1),
(11, 'Éderson Cássio', 1),
(12, 'Eduardo Guerra', 1),
(13, 'Everton Coimbra de Araújo', 1),
(14, 'Felipe Cruz', 1),
(15, 'Felipe Torres', 1),
(16, 'Gabriel Schade Cardoso', 1),
(17, 'Greg Nudelman', 1),
(18, 'Mário Amaral', 1),
(19, 'Joviane Jardim', 1),
(20, 'Hébert Coelho', 1),
(21, 'Henrique Lobo Weissmann', 1),
(22, 'João Bosco Monteiro', 1),
(23, 'Luscas Souza', 1),
(24, 'Tárcio Zemel', 1),
(25, 'Thiago Custódio', 1),
(26, 'Plínio Balduino', 1),
(27, 'Rodrigo Turini', 1),
(28, 'Vinícius Baggio Fuentes', 1),
(29, 'Eduardo Gonçalves', 1),
(30, 'Lucas Cavalcante', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE IF NOT EXISTS `editora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `status_editora` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`id`, `nome`, `status_editora`) VALUES
(1, 'Casa do Código', 1),
(2, 'Novatec', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

CREATE TABLE IF NOT EXISTS `emprestimo` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_emprestimo` tinyint(4) NOT NULL,
  `livro_ID` int(10) unsigned NOT NULL,
  `data_emprestimo` datetime NOT NULL,
  `data_devolucao` datetime NOT NULL,
  `supervisor_funcionario_matricula` int(11) NOT NULL,
  `funcionario_matricula` int(11) NOT NULL,
  `status_devolucao` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_emprestimo_livro1_idx` (`livro_ID`),
  KEY `fk_emprestimo_supervisor1_idx` (`supervisor_funcionario_matricula`),
  KEY `fk_emprestimo_funcionario1_idx` (`funcionario_matricula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Extraindo dados da tabela `emprestimo`
--

INSERT INTO `emprestimo` (`ID`, `status_emprestimo`, `livro_ID`, `data_emprestimo`, `data_devolucao`, `supervisor_funcionario_matricula`, `funcionario_matricula`, `status_devolucao`) VALUES
(16, 1, 21, '2015-12-08 00:00:00', '2015-12-16 00:00:00', 997892, 631643, 0),
(17, 1, 24, '2015-12-08 00:00:00', '2015-12-28 00:00:00', 997892, 9027251, 0),
(18, 1, 11, '2015-12-08 00:00:00', '2015-12-17 00:00:00', 997892, 646362, 0),
(19, 0, 25, '2015-12-09 00:00:00', '2015-12-11 00:00:00', 997892, 646362, 0),
(20, 1, 14, '2015-12-09 19:19:19', '2015-12-10 19:19:36', 997892, 9027251, 1),
(21, 1, 14, '2015-12-09 00:00:00', '2015-12-11 00:00:00', 997892, 997892, 1),
(22, 1, 14, '2015-12-09 00:00:00', '2015-12-12 00:00:00', 997892, 631643, 0),
(23, 1, 7, '2015-12-09 00:00:00', '2015-12-16 00:00:00', 997892, 631643, 1),
(24, 1, 12, '2015-12-09 00:00:00', '2015-12-11 00:00:00', 997892, 646362, 1),
(25, 1, 9, '2015-12-10 00:00:00', '2015-12-16 00:00:00', 997892, 646362, 0),
(26, 1, 27, '2015-12-10 00:00:00', '2015-12-28 00:00:00', 123456, 646362, 1),
(27, 1, 5, '2015-12-10 00:00:00', '2015-12-30 00:00:00', 997892, 9027251, 1),
(28, 1, 12, '2015-12-10 00:00:00', '2015-12-24 00:00:00', 997892, 123456, 1),
(29, 1, 31, '2015-12-10 00:00:00', '2015-12-22 00:00:00', 997892, 286688, 1),
(30, 1, 15, '2015-12-10 00:00:00', '2015-12-21 00:00:00', 997892, 646362, 1),
(31, 1, 13, '2016-03-13 00:00:00', '2016-03-13 00:00:00', 997892, 646362, 0),
(32, 1, 28, '2016-03-30 00:00:00', '2016-03-31 00:00:00', 997892, 123456, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `status_funcionario` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`matricula`, `nome`, `cpf`, `email`, `telefone`, `status_funcionario`) VALUES
(123456, 'Luiz Otávio', '666.666.666-66', 'luizotavioff@hotmail.com', '(31) 8888-88888', 1),
(286688, 'Marcos Vinícius', '085.830.936-01', 'marcosvbras@gmail.com', '(31) 9999-99999', 1),
(631643, 'Larissa Rodrigues Rabelo Foreman Grill', '069.455.415-66', 'larissa@foremail.com', '(11) 9283-92892', 1),
(646362, 'Lucas Skywalker Lemos', '000.000.000-00', 'lukinhas@tatoine.com', '(31) 9867-87890', 1),
(997892, 'Pedro da Costa', '555.555.555-55', 'pedroinf97@gmail.com', '(31) 9878-97978', 1),
(9027251, 'José Lucimar', '888.888.888-88', 'exemplo@exemplo.com', '(31) 9999-99999', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE IF NOT EXISTS `livro` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) NOT NULL,
  `autor_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `edicao` varchar(45) DEFAULT NULL,
  `editora_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `paginas` int(11) NOT NULL,
  `armario` varchar(30) DEFAULT NULL,
  `ano` int(11) NOT NULL,
  `prateleira` varchar(30) DEFAULT NULL,
  `particao` varchar(2) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status_livro` tinyint(4) DEFAULT NULL,
  `isbn` varchar(45) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_livro_autor1_idx` (`autor_id`),
  KEY `fk_livro_area1_idx` (`area_id`),
  KEY `fk_livro_editora1_idx` (`editora_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`ID`, `titulo`, `autor_id`, `area_id`, `edicao`, `editora_id`, `quantidade`, `paginas`, `armario`, `ano`, `prateleira`, `particao`, `url`, `status_livro`, `isbn`, `descricao`) VALUES
(3, 'Orientação a Objetos e SOLID para Ninjas', 1, 3, '3ª', 1, 1, 166, 'II', 2015, '1', '', 'oo-solid-sumario-featured_large.png', 1, '324965782-0', NULL),
(4, 'Guia do mestre programador', 2, 9, '1ª', 1, 0, 203, 'II', 2015, '2', '', 'guia_programador.jpeg', 1, '495641325-0', NULL),
(5, 'Controlando versões com Git e GitHub', 3, 10, '2ª', 1, 0, 175, 'III', 2014, '1', '', 'git-github-featured_large.png', 1, '316497521-0', NULL),
(6, 'Java SE 8 Programmer I', 5, 3, '1ª', 1, 1, 412, 'IV', 2014, '1', '', 'certificacao-java-featured_large.png', 1, '634921457-0', NULL),
(7, 'Google Android - Crie Aplicações para celulares e tables', 22, 2, '2ª', 1, 7, 230, 'I', 2013, '7', '', 'android-featured_large.png', 1, '162947243-0', NULL),
(8, 'Desenvolvimento de Jogos para Android', 7, 2, '1ª', 1, 1, 175, 'I', 2013, '7', '', 'jogos-android-featured_large.png', 1, '364916736-0', NULL),
(9, 'Começando com Linux ', 8, 7, '2ª', 1, 7, 313, 'II', 2012, '6', '', 'linux-featured_large.png', 1, '645645633-0', NULL),
(10, 'Ruby - Aprenda a programar na linguagem mais divertida', 23, 3, '3ª', 1, 1, 299, 'X', 2013, '4', '', 'ruby-featured_large.png', 1, '454166678-0', NULL),
(11, 'Vire o jogo com Spring Framework', 21, 11, '3ª', 1, 3, 250, 'IX', 2014, '1', '', 'spring-framework-featured_large.png', 1, '126663457-0', NULL),
(12, 'Swift - Programe para iPhone e iPad', 5, 2, '1ª', 1, 0, 212, 'III', 2015, '2', '', 'Swift-ebook_large.png', 1, '124345344-0', NULL),
(13, 'Web Design Responsivo', 24, 5, '2ª', 1, 3, 130, 'I', 2013, '2', '', 'web-design-responsivo-featured_large.png', 1, '369767968-0', 'null'),
(14, 'Criando aplicações para o seu Windows Phone', 16, 2, '4ª', 1, 4, 280, 'II', 2013, '3', '', 'windows-phone-featured_large.png', 1, '346455789-0', NULL),
(15, 'Azure', 25, 8, '1ª', 1, 0, 120, 'IV', 2015, '7', '', 'azure-featured_large.png', 1, '787875421-1', NULL),
(16, 'C# e Visual Studio', 13, 3, '1ª', 1, 0, 222, 'III', 2015, '3', '', 'csharp-featured_large.png', 1, '677784123-1', NULL),
(17, 'Design Patterns com Java', 12, 4, '2ª', 1, 1, 192, 'II', 2014, '1', '', 'design-patterns-featured_large.png', 1, '789679461-1', NULL),
(18, 'Jogos Android', 7, 2, '2ª', 1, 1, 215, 'I', 2015, '5', '', 'games-android-featured_large.png', 1, '792531272-1', 'y7yh78y7666666'),
(19, 'Java EE', 6, 5, '1ª', 1, 4, 200, 'V', 2015, '3', '', 'java-ee.jpeg', 1, '678695526-0', NULL),
(20, 'Dominando JavaScript com jQuery', 26, 5, '5ª', 1, 1, 145, 'II', 2014, '4', '', 'javascript-jquery-featured_large.png', 1, '374675611-0', NULL),
(21, 'Desenvolva jogos com HTML5 Canvas e JavaScript', 11, 5, '1ª', 1, 1, 290, 'VI', 2015, '1', '', 'jogos-html-javascript-featured_large.png', 1, '459679895-1', NULL),
(22, 'Desenvolvimento de Jogos para iOS', 7, 2, '2ª', 1, 4, 180, 'V', 2014, '3', '', 'jogos-ios-featured_large.png', 1, '978912121-0', NULL),
(23, 'JSF Eficaz', 20, 5, '1ª', 1, 1, 231, 'I', 2014, '1', '', 'jsf-eficaz-featured_large.png', 1, '797898595-1', NULL),
(24, 'PHP e Laravel', 27, 5, '2ª', 1, 2, 190, 'II', 2014, '1', '', 'laravel-featured_large.png', 1, '978952312-0', NULL),
(25, 'Desbravando Java e Orientação a Objetos', 27, 3, '3ª', 1, 7, 356, 'III', 2013, '1', '', 'orientacao-objetos-java-featured_large.png', 1, '656312371-0', NULL),
(26, 'Python - Escreva seus primeiros programas', 14, 3, '1ª', 1, 0, 298, 'VII', 2015, '3', '', 'python.png', 1, '646213135-1', NULL),
(27, 'Ruby on Rails', 28, 5, '3ª', 1, 0, 321, 'V', 2013, '3', '', 'ruby-on-rails-featured_large.png', 1, '146546789-0', NULL),
(28, 'eXtreme Programming', 9, 4, '1ª', 1, 1, 200, 'III-A', 2014, '4', '', 'extreme_programming.jpeg', 1, '972531378-1', 'null'),
(29, 'Padrões de Projeto para Android', 17, 4, '1ª', 2, 2, 395, 'II-B', 2015, '5', '', 'padroes.jpg', 1, '6747748-8', NULL),
(30, 'SQL - Uma Abordagem para banco de dados', 29, 1, '1ª', 1, 2, 200, 'II-B', 2014, '5', '', 'Amazon-SQL-Oracle_large.jpg', 1, '767565-8', NULL),
(31, 'Microsoft Kinect', 16, 3, '1ª', 1, 1, 200, 'II-A', 2013, '1', '', 'kinect-featured_large.png', 1, '6756757-7', NULL),
(32, 'VRaptor', 30, 11, '1ª', 1, 1, 214, 'I-A', 2015, '6', '', 'vraptor-featured_large.png', 1, '789798-9', NULL),
(33, 'Teste', 7, 9, '1', 1, 21, 123, 'III', 2015, '4', 'B', 'null', 1, '23423', 'null');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE IF NOT EXISTS `reserva` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `livro_ID` int(10) unsigned NOT NULL,
  `funcionario_matricula` int(11) NOT NULL,
  `status_reserva` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_reserva_livro_idx` (`livro_ID`),
  KEY `fk_reserva_funcionario1_idx` (`funcionario_matricula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`ID`, `data`, `livro_ID`, `funcionario_matricula`, `status_reserva`) VALUES
(46, '2015-12-08 00:00:00', 9, 646362, 0),
(47, '2015-12-08 00:00:00', 6, 646362, 0),
(48, '2015-12-08 22:26:24', 10, 646362, 1),
(49, '2015-12-08 00:00:00', 12, 646362, 0),
(50, '2015-12-08 00:00:00', 11, 646362, 0),
(51, '2015-12-08 00:00:00', 25, 646362, 0),
(52, '2015-12-08 22:27:02', 15, 646362, 1),
(53, '2015-12-09 00:23:11', 20, 646362, 1),
(54, '2015-12-09 00:00:00', 25, 646362, 0),
(55, '2015-12-09 00:46:25', 23, 646362, 1),
(63, '2015-12-09 00:00:00', 27, 646362, 0),
(64, '2015-12-09 22:00:10', 4, 646362, 1),
(65, '2015-12-09 22:01:03', 4, 646362, 1),
(68, '2015-12-09 00:00:00', 15, 646362, 0),
(70, '2015-12-09 22:49:28', 26, 646362, 1),
(72, '2015-12-10 00:00:00', 26, 123456, 1),
(73, '2015-12-10 00:00:00', 25, 123456, 1),
(74, '2015-12-10 00:00:00', 4, 646362, 1),
(75, '2015-12-10 00:00:00', 27, 646362, 1),
(77, '2015-12-10 00:00:00', 12, 123456, 0),
(78, '2015-12-10 00:00:00', 13, 646362, 0),
(79, '2015-12-10 00:00:00', 16, 646362, 1),
(80, '2016-03-30 00:00:00', 28, 123456, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `supervisor`
--

CREATE TABLE IF NOT EXISTS `supervisor` (
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `funcionario_matricula` int(11) NOT NULL,
  `status_supervisor` tinyint(4) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  KEY `fk_supervisor_funcionario1_idx` (`funcionario_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `supervisor`
--

INSERT INTO `supervisor` (`login`, `senha`, `funcionario_matricula`, `status_supervisor`, `codigo`) VALUES
('luizao', 'zxcv', 123456, 1, 0),
('fornoindustrial', '12345', 631643, 1, NULL),
('admin', 'librariummasterpass', 997892, 1, NULL),
('lucimar', 'asdf', 9027251, 1, NULL);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `fk_emprestimo_funcionario1` FOREIGN KEY (`funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprestimo_livro1` FOREIGN KEY (`livro_ID`) REFERENCES `livro` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprestimo_supervisor1` FOREIGN KEY (`supervisor_funcionario_matricula`) REFERENCES `supervisor` (`funcionario_matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `fk_livro_area1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livro_autor1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livro_editora1` FOREIGN KEY (`editora_id`) REFERENCES `editora` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_funcionario1` FOREIGN KEY (`funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reserva_livro` FOREIGN KEY (`livro_ID`) REFERENCES `livro` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `funcionario_matricula1` FOREIGN KEY (`funcionario_matricula`) REFERENCES `funcionario` (`matricula`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
