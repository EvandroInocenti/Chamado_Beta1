DROP DATABASE chamado;
CREATE SCHEMA IF NOT EXISTS `chamado` ;
USE `chamado` ;

-- -----------------------------------------------------
-- Table `chamado`.`Unidade`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `chamado`.`Unidade` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(30) NULL ,
  `fone` VARCHAR(15) NULL ,
  `estado` CHAR(2) NULL ,
  `voip` CHAR(4) NULL ,
  PRIMARY KEY (`codigo`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `chamado`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `chamado`.`Usuario` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(50) NULL ,
  `senha` VARCHAR(50) NULL,
  `email` VARCHAR(50) NULL ,
  `Unidade_codigo` INT NOT NULL ,
  PRIMARY KEY (`codigo`, `Unidade_codigo`) ,
  INDEX `fk_Usuario_Unidade1_idx` (`Unidade_codigo` ASC) ,
  CONSTRAINT `fk_Usuario_Unidade1`
    FOREIGN KEY (`Unidade_codigo` )
    REFERENCES `chamado`.`Unidade` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `chamado`.`Atendente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `chamado`.`Atendente` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(50) NULL ,
  `email` VARCHAR(50) NULL ,
  PRIMARY KEY (`codigo`) )
ENGINE = InnoDB
COMMENT = '	';

-- -----------------------------------------------------
-- Table `chamado`.`Setor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chamado`.`Setor` (
	`codigo` INT NOT NULL AUTO_INCREMENT ,
    `nome` VARCHAR(50) NULL ,
    `Atendente_codigo` INT NOT NULL ,
    PRIMARY KEY (`codigo`, `Atendente_codigo`) ,
    INDEX `fk_Atendente_Setor_idx` (`Atendente_codigo` ASC) ,
    CONSTRAINT `fk_Atendente_Setor1`
    FOREIGN KEY (`Atendente_codigo` )
    REFERENCES `chamado`.`Atendente` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `chamado`.`Status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `chamado`.`Status` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `situacao` VARCHAR(10) NULL ,
  PRIMARY KEY (`codigo`) )
ENGINE = InnoDB;

INSERT INTO `chamado`.`status` (`situacao`) VALUES ('Aberto');
INSERT INTO `chamado`.`status` (`situacao`) VALUES ('Andamento');
INSERT INTO `chamado`.`status` (`situacao`) VALUES ('Em Pausa');
INSERT INTO `chamado`.`status` (`situacao`) VALUES ('Finalizado');
INSERT INTO `chamado`.`status` (`situacao`) VALUES ('Cancelado');

-- -----------------------------------------------------
-- Table `chamado`.`Chamado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `chamado`.`Chamado` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `tipo` VARCHAR(45) NULL ,
  `descricao` VARCHAR(100) NULL ,
  `Status_codigo` INT NOT NULL ,
  `Usuario_codigo` INT NOT NULL ,
  `Setor_codigo` INT NOT NULL ,
  PRIMARY KEY (`codigo`, `Status_codigo`, `Usuario_codigo`, `Setor_codigo`) ,
  INDEX `fk_Chamado_Status1_idx` (`Status_codigo` ASC) ,
  INDEX `fk_Chamado_Usuario1_idx` (`Usuario_codigo` ASC) ,
  INDEX `fk_Chamado_Setor1_idx` (`Setor_codigo` ASC) ,
  CONSTRAINT `fk_Chamado_Status1`
    FOREIGN KEY (`Status_codigo` )
    REFERENCES `chamado`.`Status` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Chamado_Usuario1`
    FOREIGN KEY (`Usuario_codigo` )
    REFERENCES `chamado`.`Usuario` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_Chamado_Setor1`
    FOREIGN KEY (`Setor_codigo` )
    REFERENCES `chamado`.`Setor` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  
ENGINE = InnoDB
COMMENT = '		';

USE `chamado`;