using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace BMSMVC.Controllers
{
    [Route("[controller]")]
    public class AccountController : Controller
    {
        private readonly string _connectionString = "YourConnectionString"; // Replace with your actual connection string

        // GET: Account
        public ActionResult Index()
        {
            List<Account> accounts = new List<Account>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetAllAccounts", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    accounts.Add(new Account
                    {
                        AccountId = Convert.ToInt32(reader["AccountId"]),
                        AccountNumber = reader["AccountNumber"].ToString(),
                        CustomerId = Convert.ToInt32(reader["CustomerId"]),
                        Balance = Convert.ToDecimal(reader["Balance"]),
                        AccountType = reader["AccountType"].ToString(),
                        CreatedDate = Convert.ToDateTime(reader["CreatedDate"])
                    });
                }
            }

            return View(accounts);
        }

        // GET: Account/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Account/Create
        [HttpPost]
        public ActionResult Create(Account account)
        {
            if (ModelState.IsValid)
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_AddAccount", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@AccountNumber", account.AccountNumber);
                    cmd.Parameters.AddWithValue("@CustomerId", account.CustomerId);
                    cmd.Parameters.AddWithValue("@Balance", account.Balance);
                    cmd.Parameters.AddWithValue("@AccountType", account.AccountType);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                return RedirectToAction("Index");
            }

            return View(account);
        }

        // GET: Account/Edit/5
        public ActionResult Edit(int id)
        {
            Account account = null;

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetAccountById", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@AccountId", id);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    account = new Account
                    {
                        AccountId = Convert.ToInt32(reader["AccountId"]),
                        AccountNumber = reader["AccountNumber"].ToString(),
                        CustomerId = Convert.ToInt32(reader["CustomerId"]),
                        Balance = Convert.ToDecimal(reader["Balance"]),
                        AccountType = reader["AccountType"].ToString(),
                        CreatedDate = Convert.ToDateTime(reader["CreatedDate"])
                    };
                }
            }

            return View(account);
        }

        // POST: Account/Edit/5
        [HttpPost]
        public ActionResult Edit(Account account)
        {
            if (ModelState.IsValid)
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_UpdateAccount", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@AccountId", account.AccountId);
                    cmd.Parameters.AddWithValue("@AccountNumber", account.AccountNumber);
                    cmd.Parameters.AddWithValue("@CustomerId", account.CustomerId);
                    cmd.Parameters.AddWithValue("@Balance", account.Balance);
                    cmd.Parameters.AddWithValue("@AccountType", account.AccountType);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                return RedirectToAction("Index");
            }

            return View(account);
        }

        // GET: Account/Delete/5
        public ActionResult Delete(int id)
        {
            Account account = null;

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetAccountById", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@AccountId", id);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    account = new Account
                    {
                        AccountId = Convert.ToInt32(reader["AccountId"]),
                        AccountNumber = reader["AccountNumber"].ToString(),
                        CustomerId = Convert.ToInt32(reader["CustomerId"]),
                        Balance = Convert.ToDecimal(reader["Balance"]),
                        AccountType = reader["AccountType"].ToString(),
                        CreatedDate = Convert.ToDateTime(reader["CreatedDate"])
                    };
                }
            }

            return View(account);
        }

        // POST: Account/Delete/5
        [HttpPost]
        public ActionResult Delete(Account account)
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_DeleteAccount", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@AccountId", account.AccountId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            return RedirectToAction("Index");
        }
    }
}