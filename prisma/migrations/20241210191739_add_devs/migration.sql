/*
  Warnings:

  - Added the required column `lastName` to the `Developer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Developer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Developer" ADD COLUMN     "lastName" TEXT NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL;
