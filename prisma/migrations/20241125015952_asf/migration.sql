/*
  Warnings:

  - The primary key for the `Developer` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `TechTag` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Developer" DROP CONSTRAINT "Developer_userId_fkey";

-- DropForeignKey
ALTER TABLE "_DeveloperToTechTag" DROP CONSTRAINT "_DeveloperToTechTag_A_fkey";

-- DropForeignKey
ALTER TABLE "_DeveloperToTechTag" DROP CONSTRAINT "_DeveloperToTechTag_B_fkey";

-- AlterTable
ALTER TABLE "Developer" DROP CONSTRAINT "Developer_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "userId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Developer_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Developer_id_seq";

-- AlterTable
ALTER TABLE "TechTag" DROP CONSTRAINT "TechTag_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "TechTag_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "TechTag_id_seq";

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "User_id_seq";

-- AlterTable
ALTER TABLE "_DeveloperToTechTag" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AddForeignKey
ALTER TABLE "Developer" ADD CONSTRAINT "Developer_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DeveloperToTechTag" ADD CONSTRAINT "_DeveloperToTechTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Developer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DeveloperToTechTag" ADD CONSTRAINT "_DeveloperToTechTag_B_fkey" FOREIGN KEY ("B") REFERENCES "TechTag"("id") ON DELETE CASCADE ON UPDATE CASCADE;
