import NotFoundError from "../../errors/NotFoundError.js";
import { PrismaClient } from "@prisma/client";

const getOrderById = async (id) => {
  const prisma = new PrismaClient();
  const order = await prisma.book.findUnique({
    where: {
      id,
    },
  });

  if (!order) {
    throw new NotFoundError("Order", id);
  }

  return order;
};

export default getOrderById;
