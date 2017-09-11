-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Projeto-Esquadrias
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Projeto-Esquadrias
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Projeto-Esquadrias` DEFAULT CHARACTER SET utf8 ;
USE `Projeto-Esquadrias` ;

-- -----------------------------------------------------
-- Table `Projeto-Esquadrias`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto-Esquadrias`.`perfil` (
  `id_perfil` INT NOT NULL AUTO_INCREMENT,
  `codigo_perfil` VARCHAR(15) NOT NULL,
  `codigo_alt` VARCHAR(45) NULL,
  `tamanho` FLOAT NULL,
  `peso` FLOAT NULL,
  `fornecedor` VARCHAR(45) NULL,
  `preco_kg` FLOAT NULL,
  `preco_barra` FLOAT NULL,
  `imagem` TINYBLOB NULL,
  PRIMARY KEY (`codigo_perfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto-Esquadrias`.`acessorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto-Esquadrias`.`acessorio` (
  `id_acessorio` INT NOT NULL,
  `codigo_acessorio` VARCHAR(15) NOT NULL,
  `quantidade` INT NULL,
  `peso` FLOAT NULL,
  `tamanho` FLOAT NULL,
  `cor` VARCHAR(45) NULL,
  `fornecedor` VARCHAR(45) NULL,
  `preco` FLOAT NULL,
  `imagem` TINYBLOB NULL,
  PRIMARY KEY (`codigo_acessorio`))
ENGINE = InnoDB
COMMENT = '		';


-- -----------------------------------------------------
-- Table `Projeto-Esquadrias`.`vidro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto-Esquadrias`.`vidro` (
  `id_vidro` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `espessura` INT NULL,
  `cor` VARCHAR(45) NULL,
  `fornecedor` VARCHAR(45) NULL,
  `preco` FLOAT NULL,
  `vidrocol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_vidro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto-Esquadrias`.`desconto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto-Esquadrias`.`desconto` (
  `desconto` INT NULL,
  `perfil_codigo_perfil` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`desconto`, `perfil_codigo_perfil`),
  INDEX `fk_desconto_perfil1_idx` (`perfil_codigo_perfil` ASC),
  CONSTRAINT `fk_desconto_perfil1`
    FOREIGN KEY (`perfil_codigo_perfil`)
    REFERENCES `Projeto-Esquadrias`.`perfil` (`codigo_perfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto-Esquadrias`.`servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto-Esquadrias`.`servico` (
  `idservico` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `preco` FLOAT NULL,
  `duracao` FLOAT NULL,
  PRIMARY KEY (`idservico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto-Esquadrias`.`esquadria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto-Esquadrias`.`esquadria` (
  `idesquadria` INT NOT NULL AUTO_INCREMENT,
  `desconto_desconto` INT NOT NULL,
  `desconto_perfil_codigo_perfil` VARCHAR(15) NOT NULL,
  `perfil_codigo_perfil` VARCHAR(15) NOT NULL,
  `acessorio_codigo_acessorio` VARCHAR(15) NOT NULL,
  `servico_idservico` INT NULL,
  `vidro_id_vidro` INT NOT NULL,
  PRIMARY KEY (`idesquadria`, `servico_idservico`, `vidro_id_vidro`),
  INDEX `fk_esquadria_desconto1_idx` (`desconto_desconto` ASC, `desconto_perfil_codigo_perfil` ASC),
  INDEX `fk_esquadria_perfil1_idx` (`perfil_codigo_perfil` ASC),
  INDEX `fk_esquadria_acessorio1_idx` (`acessorio_codigo_acessorio` ASC),
  INDEX `fk_esquadria_servico1_idx` (`servico_idservico` ASC),
  INDEX `fk_esquadria_vidro1_idx` (`vidro_id_vidro` ASC),
  CONSTRAINT `fk_esquadria_desconto1`
    FOREIGN KEY (`desconto_desconto` , `desconto_perfil_codigo_perfil`)
    REFERENCES `Projeto-Esquadrias`.`desconto` (`desconto` , `perfil_codigo_perfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_esquadria_perfil1`
    FOREIGN KEY (`perfil_codigo_perfil`)
    REFERENCES `Projeto-Esquadrias`.`perfil` (`codigo_perfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_esquadria_acessorio1`
    FOREIGN KEY (`acessorio_codigo_acessorio`)
    REFERENCES `Projeto-Esquadrias`.`acessorio` (`codigo_acessorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_esquadria_servico1`
    FOREIGN KEY (`servico_idservico`)
    REFERENCES `Projeto-Esquadrias`.`servico` (`idservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_esquadria_vidro1`
    FOREIGN KEY (`vidro_id_vidro`)
    REFERENCES `Projeto-Esquadrias`.`vidro` (`id_vidro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto-Esquadrias`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto-Esquadrias`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `telefone` INT NULL,
  `email` VARCHAR(45) NULL,
  `cpf` INT NULL,
  `cnpj` INT NULL,
  PRIMARY KEY (`id_cliente`));


-- -----------------------------------------------------
-- Table `Projeto-Esquadrias`.`obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto-Esquadrias`.`obra` (
  `idobra` INT NOT NULL,
  `comentario` VARCHAR(45) NULL,
  `endereco` VARCHAR(70) NOT NULL,
  `cidade` VARCHAR(45) NULL,
  `cep` INT(8) NULL,
  `telefone` INT NULL,
  `esquadria_idesquadria` INT NULL,
  `servico_idservico` INT NOT NULL,
  PRIMARY KEY (`idobra`),
  INDEX `fk_obra_esquadria1_idx` (`esquadria_idesquadria` ASC),
  INDEX `fk_obra_servico1_idx` (`servico_idservico` ASC),
  CONSTRAINT `fk_obra_esquadria1`
    FOREIGN KEY (`esquadria_idesquadria`)
    REFERENCES `Projeto-Esquadrias`.`esquadria` (`idesquadria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_obra_servico1`
    FOREIGN KEY (`servico_idservico`)
    REFERENCES `Projeto-Esquadrias`.`servico` (`idservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto-Esquadrias`.`orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projeto-Esquadrias`.`orcamento` (
  `idorcamento` INT NOT NULL,
  `obra_idobra` INT NULL,
  `cliente_id_cliente` INT NOT NULL,
  PRIMARY KEY (`idorcamento`, `obra_idobra`),
  INDEX `fk_orcamento_obra1_idx` (`obra_idobra` ASC),
  INDEX `fk_orcamento_cliente1_idx` (`cliente_id_cliente` ASC),
  CONSTRAINT `fk_orcamento_obra1`
    FOREIGN KEY (`obra_idobra`)
    REFERENCES `Projeto-Esquadrias`.`obra` (`idobra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orcamento_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `Projeto-Esquadrias`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
