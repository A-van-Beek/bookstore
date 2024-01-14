-- CreateEnum
CREATE TYPE "ItemType" AS ENUM ('BOOK', 'RECORD');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Book" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "isbn" TEXT NOT NULL,
    "pages" INTEGER NOT NULL,
    "available" BOOLEAN NOT NULL,
    "genre" TEXT NOT NULL,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Record" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "artist" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "available" BOOLEAN NOT NULL,
    "genre" TEXT NOT NULL,

    CONSTRAINT "Record_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" TEXT NOT NULL,
    "order_type" "ItemType" NOT NULL,
    "book_id" TEXT,
    "record_id" TEXT,
    "user_id" TEXT NOT NULL,
    "order_date" TIMESTAMP(3) NOT NULL,
    "delivery_date" TIMESTAMP(3),
    "payment_method" TEXT NOT NULL,
    "comment" TEXT,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE INDEX "Order_book_id_idx" ON "Order"("book_id");

-- CreateIndex
CREATE INDEX "Order_user_id_idx" ON "Order"("user_id");

-- CreateIndex
CREATE INDEX "Order_record_id_idx" ON "Order"("record_id");

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "Book"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_record_id_fkey" FOREIGN KEY ("record_id") REFERENCES "Record"("id") ON DELETE SET NULL ON UPDATE CASCADE;