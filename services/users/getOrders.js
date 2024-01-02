import { PrismaClient } from "@prisma/client";

const getOrders = async (book_id, user_id) => {
  const prisma = new PrismaClient();

  return prisma.order.findMany({
    where: {
      book_id,
      user_id,
    },
  });
};

export default getOrders;
