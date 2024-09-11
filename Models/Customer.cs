using System.ComponentModel.DataAnnotations;
 
namespace YourNamespace.Models
{
    public class Customer
    {
        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }
 
        [Required(ErrorMessage = "Address is required")]
        public string Address { get; set; }
 
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }
 
        [Required(ErrorMessage = "Phone is required")]
        [Phone(ErrorMessage = "Invalid Phone Number")]
        public string Phone { get; set; }
    }
}