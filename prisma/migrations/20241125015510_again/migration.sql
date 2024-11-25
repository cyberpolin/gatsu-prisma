/*
  Warnings:

  - You are about to drop the column `updatedAt` on the `Developer` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `TechTag` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Developer" DROP COLUMN "updatedAt";

-- AlterTable
ALTER TABLE "TechTag" DROP COLUMN "updatedAt";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "updatedAt";
