using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Web_Store.Models;

namespace Web_Store.Areas.Admin.Controllers
{
    [Authorize(Roles = "ADMIN")]
    [ValidateInput(false)]
    public class ItemsController : Controller
    {
        private DB_StoreEntities db = new DB_StoreEntities();

        // GET: Admin/Items
        public ActionResult List(int? page)
        {
            if (page == null) page = 1;
            var Item = (from l in db.Items.Include(a => a.Author)
                        select l).OrderBy(x => x.ItemId);
            int pageSize = 15;
            // 4.1 Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn nếu page = null thì lấy giá trị 1 cho biến pageNumber.
            int pageNumber = (page ?? 1);
            // 5. Trả về các Link được phân trang theo kích thước và số trang.
            return View(Item.ToPagedList(pageNumber, pageSize));
        }
        // GET: Admin/Items/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Item Item = db.Items.Find(id);
            if (Item == null)
            {
                return HttpNotFound();
            }
            return View(Item);
        }

        // GET: Admin/Items/Create
        public ActionResult Create()
        {
            ViewBag.AuthorId = new SelectList(db.Authors, "AuthorId", "Name");
            ViewBag.Categories = new MultiSelectList(db.Categories, "CategoryId", "Name");

            return View();
        }

        // POST: Admin/Items/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ItemId,Name,PublishDate,AuthorId,Quantity,Price,Introduce,ImagePath")] Item Item, int[] Categories)
        {
            if (ModelState.IsValid)
            {
                if (Categories != null)
                    for (int i = 0; i < Categories.Length; i++)
                    {
                        Item.Categories.Add(db.Categories.Find(Categories[i]));
                    }
                Account creater = db.Accounts.Find(HttpContext.User.Identity.Name);
                Discuss dc = new Discuss()
                {
                    Account = creater,
                    StartDate = DateTime.Now,
                    Introduce = "Nói về sách " + Item.Name,
                    Name = "#TL",
                };
                db.Discusses.Add(dc);
                db.SaveChanges();

                var list = db.Discusses.Where(x => x.Username == creater.Username).ToList();
                dc = list[list.Count - 1];
                Item.Discuss = dc;
                Item.Quantity = 0;
                Item.Rate = 0;
                Item.QuantitySold = 0;
                db.Items.Add(Item);
                db.SaveChanges();
                return RedirectToAction("List");
            }

            ViewBag.AuthorId = new SelectList(db.Authors, "AuthorId", "Name", Item.AuthorId);
            ViewBag.Categories = new MultiSelectList(db.Categories, "CategoryId", "Name", Item.Categories);
            return View(Item);
        }

        // GET: Admin/Items/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Item Item = db.Items.Find(id);
            if (Item == null)
            {
                return HttpNotFound();
            }

            ViewBag.Categories = new MultiSelectList(db.Categories, "CategoryId", "Name");
            ViewBag.AuthorId = new SelectList(db.Authors, "AuthorId", "Name");
            return View(Item);
        }

        // POST: Admin/Items/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ItemId,Name,PublishDate,AuthorId,Quantity,Price,Introduce,ImagePath")] Item Item, int[] Categories)
        {
            if (ModelState.IsValid)
            {
                if(Categories!=null)
                    foreach (int i in Categories)
                        Item.Categories.Add(db.Categories.Find(i));
                var existingItem = db.Items.Include("Categories")
                        .Where(s => s.ItemId == Item.ItemId).FirstOrDefault<Item>();

                var deletedCategories = existingItem.Categories.Except(Item.Categories).ToList<Category>();
                var addedCategories = Item.Categories.Except(existingItem.Categories).ToList<Category>();

                deletedCategories.ForEach(c => existingItem.Categories.Remove(c));

                foreach (Category c in addedCategories)
                {
                    if (db.Entry(c).State == EntityState.Detached)
                        db.Categories.Attach(c);

                    existingItem.Categories.Add(c);
                }
                existingItem.Name = Item.Name;
                existingItem.Introduce = Item.Introduce;
                existingItem.AuthorId = Item.AuthorId;
                existingItem.Price = Item.Price;
                existingItem.PublishDate = Item.PublishDate;
                existingItem.ImagePath = Item.ImagePath;

                db.SaveChanges();
                return RedirectToAction("List");
            }

            ViewBag.Categories = new MultiSelectList(db.Categories, "CategoryId", "Name", Item.Categories);
            ViewBag.AuthorId = new SelectList(db.Authors, "AuthorId", "Name", Item.AuthorId);
            return View(Item);
        }

        // GET: Admin/Items/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Item Item = db.Items.Find(id);
            if (Item == null)
            {
                return HttpNotFound();
            }
            return View(Item);
        }

        // POST: Admin/Items/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Item Item = db.Items.Find(id);
            db.Items.Remove(Item);
            db.SaveChanges();
            return RedirectToAction("List");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
