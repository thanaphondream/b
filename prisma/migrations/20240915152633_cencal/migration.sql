/*
  Warnings:

  - You are about to drop the column `point` on the `games` table. All the data in the column will be lost.
  - You are about to drop the column `price` on the `games` table. All the data in the column will be lost.
  - You are about to drop the column `usergame_id` on the `order` table. All the data in the column will be lost.
  - You are about to drop the `users_games` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `email` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pointId` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_gameId` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `order` DROP FOREIGN KEY `Order_usergame_id_fkey`;

-- DropForeignKey
ALTER TABLE `users_games` DROP FOREIGN KEY `Users_games_game_id_fkey`;

-- DropForeignKey
ALTER TABLE `users_games` DROP FOREIGN KEY `Users_games_user_id_fkey`;

-- AlterTable
ALTER TABLE `games` DROP COLUMN `point`,
    DROP COLUMN `price`;

-- AlterTable
ALTER TABLE `order` DROP COLUMN `usergame_id`,
    ADD COLUMN `email` VARCHAR(191) NOT NULL,
    ADD COLUMN `pointId` INTEGER NOT NULL,
    ADD COLUMN `status` VARCHAR(191) NOT NULL DEFAULT 'รอดำเนินการ',
    ADD COLUMN `user_gameId` VARCHAR(191) NOT NULL,
    ADD COLUMN `user_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `payment` ADD COLUMN `pay_img` VARCHAR(191) NOT NULL DEFAULT 'https://topicstock.pantip.com/chalermthai/topicstock/2007/04/A5312975/A5312975-0.jpg';

-- DropTable
DROP TABLE `users_games`;

-- CreateTable
CREATE TABLE `Cencal` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `note` VARCHAR(191) NULL,
    `orderId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Point` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `point` INTEGER NOT NULL,
    `price` INTEGER NOT NULL,
    `game_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_pointId_fkey` FOREIGN KEY (`pointId`) REFERENCES `Point`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cencal` ADD CONSTRAINT `Cencal_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Point` ADD CONSTRAINT `Point_game_id_fkey` FOREIGN KEY (`game_id`) REFERENCES `Games`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
