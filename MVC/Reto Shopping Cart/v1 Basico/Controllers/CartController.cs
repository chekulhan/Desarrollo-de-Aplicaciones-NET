using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingCart.Models;


namespace ShoppingCart.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }

        private int IsExists(string id)
        {

            List<Item> carts = (List<Item>)Session["shoppingcart"];

            for (int i = 0; i < carts.Count; i++)
            {
                if (carts[i].Producto.Id == id)
                {
                    return i;
                }

            }

            return -1;

        }
        public ActionResult Buy(string id)
        {
            RepositorioPM PM = new RepositorioPM();

            if (Session["shoppingcart"] == null)
            {
                List<Item> carts = new List<Item>();
                carts.Add(new Item { Producto = PM.find(id), Quantity = 1 });
                Session["shoppingcart"] = carts;
            }
            else
            {
                List<Item> carts = (List<Item>)Session["shoppingcart"];

                var index = IsExists(id);
                 if (index != -1)
                {
                    carts[index].Quantity++;
                }
                else
                {
                    carts.Add(new Item { Producto = PM.find(id), Quantity = 1 });
                }

                Session["shoppingcart"] = carts;

            }
           
           

            return RedirectToAction("Index");

        }

        public ActionResult Remove(string id)
        {
            List<Item> carts = (List<Item>)Session["shoppingcart"];
  
            carts.RemoveAt(IsExists(id));
            Session["shoppingcart"] = carts;

            return RedirectToAction("Index");
        }
    }
}