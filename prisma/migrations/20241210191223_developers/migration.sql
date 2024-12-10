/*
  Warnings:

  - You are about to drop the `TechTag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_DeveloperToTechTag` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_DeveloperToTechTag" DROP CONSTRAINT "_DeveloperToTechTag_A_fkey";

-- DropForeignKey
ALTER TABLE "_DeveloperToTechTag" DROP CONSTRAINT "_DeveloperToTechTag_B_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "isAdmin" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "verified" BOOLEAN NOT NULL DEFAULT false;

-- DropTable
DROP TABLE "TechTag";

-- DropTable
DROP TABLE "_DeveloperToTechTag";

-- CreateTable
CREATE TABLE "Skill" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Skill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_DeveloperToSkill" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Skill_name_key" ON "Skill"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_DeveloperToSkill_AB_unique" ON "_DeveloperToSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_DeveloperToSkill_B_index" ON "_DeveloperToSkill"("B");

-- AddForeignKey
ALTER TABLE "_DeveloperToSkill" ADD CONSTRAINT "_DeveloperToSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "Developer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DeveloperToSkill" ADD CONSTRAINT "_DeveloperToSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;
