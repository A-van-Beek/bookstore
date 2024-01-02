import { Router } from "express";
import notFoundErrorHandler from "../middleware/notFoundErrorHandler.js";
import getUserOrders from "../services/users/getUserOrders.js";
import getOrders from "../services/users/getOrders.js";

const router = Router();

router.get("/", async (req, res) => {
  const { book_id, user_id } = req.query;
  const orders = await getOrders(book_id, user_id);
  res.status(200).json(orders);
});

router.get(
  "/:id/orders",
  async (req, res, next) => {
    try {
      const { id } = req.params;
      console.log("gevonden " & id);
      const userOrders = await getUserOrders(id);

      res.status(200).json(userOrders);
    } catch (error) {
      next(error);
    }
  },
  notFoundErrorHandler
);

router.get(
  "/:id",
  async (req, res, next) => {
    try {
      const { id } = req.params;
      const order = await getOrderById(id);

      res.status(200).json(order);
    } catch (error) {
      next(error);
    }
  },
  notFoundErrorHandler
);

export default router;
