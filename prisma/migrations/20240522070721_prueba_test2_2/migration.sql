-- CreateTable
CREATE TABLE `Usuario` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL,
    `apePat` VARCHAR(30) NOT NULL,
    `apeMat` VARCHAR(30) NOT NULL,
    `sexo` VARCHAR(20) NOT NULL,
    `correo` VARCHAR(150) NOT NULL,
    `usuario` VARCHAR(50) NOT NULL,
    `pwd` VARCHAR(50) NOT NULL,
    `imagen` VARCHAR(500) NOT NULL,
    `idRol` INTEGER NOT NULL,

    UNIQUE INDEX `Usuario_usuario_key`(`usuario`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Rol` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Trabajador` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `edad` INTEGER NOT NULL,
    `experiencia` SMALLINT NOT NULL,
    `trabajos` INTEGER NOT NULL,
    `disponible` BIT(1) NOT NULL,
    `membresia` DATETIME NOT NULL,
    `idUsuario` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Oficio` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OficioTrabajado` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idOficio` INTEGER NOT NULL,
    `idTrabajador` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HistorialTrabajos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descripcion` VARCHAR(250) NOT NULL,
    `costoTotal` INTEGER NOT NULL,
    `idEstado` INTEGER NOT NULL,
    `idUsuario` INTEGER NOT NULL,
    `idTrabajador` INTEGER NOT NULL,
    `idOficio` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Estado` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comentarios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mensaje` VARCHAR(250) NOT NULL,
    `calificacion` TINYINT NOT NULL,
    `idTrabajo` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EvidenciaTrabajos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idImagen` VARCHAR(500) NOT NULL,
    `idTrabajo` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ImagenComentarios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idImagen` VARCHAR(500) NOT NULL,
    `idComentario` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Calificaciones` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `calificacion` TINYINT NOT NULL,
    `idUsuario` INTEGER NOT NULL,
    `idTrabajador` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Direccion` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `latitud` DECIMAL(9, 6) NOT NULL,
    `longitud` DECIMAL(9, 6) NOT NULL,
    `municipio` VARCHAR(35) NOT NULL,
    `colonia` VARCHAR(35) NOT NULL,
    `calle` VARCHAR(50) NOT NULL,
    `cp` INTEGER NOT NULL,
    `numeroExt` SMALLINT NOT NULL,
    `descripcion` VARCHAR(50) NOT NULL,
    `idTrabajo` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Usuario` ADD CONSTRAINT `Usuario_idRol_fkey` FOREIGN KEY (`idRol`) REFERENCES `Rol`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Trabajador` ADD CONSTRAINT `Trabajador_idUsuario_fkey` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OficioTrabajado` ADD CONSTRAINT `OficioTrabajado_idOficio_fkey` FOREIGN KEY (`idOficio`) REFERENCES `Oficio`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OficioTrabajado` ADD CONSTRAINT `OficioTrabajado_idTrabajador_fkey` FOREIGN KEY (`idTrabajador`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HistorialTrabajos` ADD CONSTRAINT `HistorialTrabajos_idEstado_fkey` FOREIGN KEY (`idEstado`) REFERENCES `Estado`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HistorialTrabajos` ADD CONSTRAINT `HistorialTrabajos_idUsuario_fkey` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HistorialTrabajos` ADD CONSTRAINT `HistorialTrabajos_idTrabajador_fkey` FOREIGN KEY (`idTrabajador`) REFERENCES `Trabajador`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HistorialTrabajos` ADD CONSTRAINT `HistorialTrabajos_idOficio_fkey` FOREIGN KEY (`idOficio`) REFERENCES `Oficio`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comentarios` ADD CONSTRAINT `Comentarios_idTrabajo_fkey` FOREIGN KEY (`idTrabajo`) REFERENCES `HistorialTrabajos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EvidenciaTrabajos` ADD CONSTRAINT `EvidenciaTrabajos_idTrabajo_fkey` FOREIGN KEY (`idTrabajo`) REFERENCES `HistorialTrabajos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ImagenComentarios` ADD CONSTRAINT `ImagenComentarios_idComentario_fkey` FOREIGN KEY (`idComentario`) REFERENCES `Comentarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Calificaciones` ADD CONSTRAINT `Calificaciones_idUsuario_fkey` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Calificaciones` ADD CONSTRAINT `Calificaciones_idTrabajador_fkey` FOREIGN KEY (`idTrabajador`) REFERENCES `Trabajador`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Direccion` ADD CONSTRAINT `Direccion_idTrabajo_fkey` FOREIGN KEY (`idTrabajo`) REFERENCES `HistorialTrabajos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
