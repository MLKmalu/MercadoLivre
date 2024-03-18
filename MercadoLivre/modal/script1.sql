-- MySQL Workbench Synchronization
-- Generated: 2024-03-12 08:49
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: ctism

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `mercado_livre`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `mercado_livre`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `senha` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `tipo_user_id`),
  INDEX `fk_user_tipo_user_idx` (`tipo_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_tipo_user`
    FOREIGN KEY (`tipo_user_id`)
    REFERENCES `mercado_livre`.`tipo_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mercado_livre`.`tipo_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mercado_livre`.`pedido` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `data_compra` DATE NULL DEFAULT NULL,
  `data_aprovacao` DATE NULL DEFAULT NULL,
  `valor_total` FLOAT(11) NULL DEFAULT NULL,
  `data_entrega` DATE NULL DEFAULT NULL,
  `pedidocol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mercado_livre`.`item` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `qtd` INT(11) NULL DEFAULT NULL,
  `preco_custo` FLOAT(11) NULL DEFAULT NULL,
  `preco_venda` FLOAT(11) NULL DEFAULT NULL,
  `itemcol` VARCHAR(45) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `user_tipo_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_user1_idx` (`user_id` ASC, `user_tipo_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_item_user1`
    FOREIGN KEY (`user_id` , `user_tipo_user_id`)
    REFERENCES `mercado_livre`.`user` (`id` , `tipo_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mercado_livre`.`pedido_has_item` (
  `pedido_id` INT(11) NOT NULL,
  `item_id` INT(11) NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  `qtd` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pedido_id`, `item_id`, `id`),
  INDEX `fk_pedido_has_item_item1_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_pedido_has_item_pedido1_idx` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_has_item_pedido1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `mercado_livre`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_item_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `mercado_livre`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
