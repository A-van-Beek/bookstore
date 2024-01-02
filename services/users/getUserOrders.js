import { PrismaClient } from "@prisma/client";
import NotFoundError from "../../errors/NotFoundError.js";

const getUserOrders = async (userId) => {
  const prisma = new PrismaClient();
  // console.log("Debugging: Voor het ophalen van gebruikersbestellingen");
  try {
    const userOrders = await prisma.user.findUnique({
      where: {
        id: userId,
      },
      include: {
        orders: true,
      },
    });

    if (!userOrders) {
      throw new NotFoundError("User", userId);
    }
    return userOrders;
  } catch (error) {
    // console.error("Fout tijdens het ophalen van gebruikersbestellingen", error);
    throw error;
  }
};

export default getUserOrders;
