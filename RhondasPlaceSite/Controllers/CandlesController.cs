using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RhondasPlaceSite.Models;

namespace RhondasPlaceSite.Controllers
{
    public class CandlesController : Controller
    {
        private RhondasPlace_1Entities db = new RhondasPlace_1Entities();

        // GET: Candles
        public ActionResult Index()
        {
            var candles = db.Candles.Include(c => c.CandleSize).Include(c => c.CandleType).Include(c => c.Image).Include(c => c.Lid).Include(c => c.Scent);
            return View(candles.ToList());
        }

        //Get ScentList
        private ActionResult GetScent()
        {
            List<SelectListItem> items = new List<SelectListItem>();

            items.Add(new SelectListItem { Text = "Action", Value = "0" });

            items.Add(new SelectListItem { Text = "Drama", Value = "1" });

            items.Add(new SelectListItem { Text = "Comedy", Value = "2", Selected = true });

            items.Add(new SelectListItem { Text = "Science Fiction", Value = "3" });

            ViewBag.MovieType = items;

            return View(items);

        }

        //GET: Scents
        public ActionResult MyScentList()
        {
            ////Get the Candel Scents Name
            //var MyScent = GetScent();
            //return View(MyScent);

            List<SelectListItem> items = new List<SelectListItem>();

            items.Add(new SelectListItem { Text = "Action", Value = "0" });

            items.Add(new SelectListItem { Text = "Drama", Value = "1" });

            items.Add(new SelectListItem { Text = "Comedy", Value = "2", Selected = true });

            items.Add(new SelectListItem { Text = "Science Fiction", Value = "3" });

            ViewBag.MovieType = items;

            return View(items);
        }

        // GET: Candles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Candle candle = db.Candles.Find(id);
            if (candle == null)
            {
                return HttpNotFound();
            }
            return View(candle);
        }

        // GET: Candles/Create
        public ActionResult Create()
        {
            ViewBag.CandleSizeID = new SelectList(db.CandleSizes, "CandleSizeID", "CandleName");
            ViewBag.CandleTypeID = new SelectList(db.CandleTypes, "CandleTypeID", "CandleDescription");
            ViewBag.ImageID = new SelectList(db.Images, "ImageID", "ImageURL");
            ViewBag.LidID = new SelectList(db.Lids, "LidID", "LidDescription");
            ViewBag.ScentID = new SelectList(db.Scents, "ScentID", "ScentName");
            return View();
        }

        // POST: Candles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CandleID,ImageID,CandleTypeID,CandleSizeID,ScentID,LidID,AddDateTime,AddUserName,LastUpdateTime,LastUpdateUserName,IsDeleted,Price")] Candle candle)
        {
            if (ModelState.IsValid)
            {
                db.Candles.Add(candle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CandleSizeID = new SelectList(db.CandleSizes, "CandleSizeID", "CandleName", candle.CandleSizeID);
            ViewBag.CandleTypeID = new SelectList(db.CandleTypes, "CandleTypeID", "CandleDescription", candle.CandleTypeID);
            ViewBag.ImageID = new SelectList(db.Images, "ImageID", "ImageURL", candle.ImageID);
            ViewBag.LidID = new SelectList(db.Lids, "LidID", "LidDescription", candle.LidID);
            ViewBag.ScentID = new SelectList(db.Scents, "ScentID", "ScentName", candle.ScentID);
            return View(candle);
        }

        // GET: Candles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Candle candle = db.Candles.Find(id);
            if (candle == null)
            {
                return HttpNotFound();
            }
            ViewBag.CandleSizeID = new SelectList(db.CandleSizes, "CandleSizeID", "CandleName", candle.CandleSizeID);
            ViewBag.CandleTypeID = new SelectList(db.CandleTypes, "CandleTypeID", "CandleDescription", candle.CandleTypeID);
            ViewBag.ImageID = new SelectList(db.Images, "ImageID", "ImageURL", candle.ImageID);
            ViewBag.LidID = new SelectList(db.Lids, "LidID", "LidDescription", candle.LidID);
            ViewBag.ScentID = new SelectList(db.Scents, "ScentID", "ScentName", candle.ScentID);
            return View(candle);
        }

        // POST: Candles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CandleID,ImageID,CandleTypeID,CandleSizeID,ScentID,LidID,AddDateTime,AddUserName,LastUpdateTime,LastUpdateUserName,IsDeleted,Price")] Candle candle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(candle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CandleSizeID = new SelectList(db.CandleSizes, "CandleSizeID", "CandleName", candle.CandleSizeID);
            ViewBag.CandleTypeID = new SelectList(db.CandleTypes, "CandleTypeID", "CandleDescription", candle.CandleTypeID);
            ViewBag.ImageID = new SelectList(db.Images, "ImageID", "ImageURL", candle.ImageID);
            ViewBag.LidID = new SelectList(db.Lids, "LidID", "LidDescription", candle.LidID);
            ViewBag.ScentID = new SelectList(db.Scents, "ScentID", "ScentName", candle.ScentID);
            return View(candle);
        }

        // GET: Candles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Candle candle = db.Candles.Find(id);
            if (candle == null)
            {
                return HttpNotFound();
            }
            return View(candle);
        }

        // POST: Candles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Candle candle = db.Candles.Find(id);
            db.Candles.Remove(candle);
            db.SaveChanges();
            return RedirectToAction("Index");
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
