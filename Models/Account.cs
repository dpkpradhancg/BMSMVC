using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BMSMVC.Models
{
    public class Account
    {
        public int AccountId { get; set; }
        public string AccountNumber { get; set; }
        public int CustomerId { get; set; }
        public decimal Balance { get; set; }
        public string AccountType { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}