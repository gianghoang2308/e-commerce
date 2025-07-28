using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E.CommerceProject.Models
{
    [Table("Role")]
    public class Role
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "Không được để trống trường này")]
        public string RoleName { get; set; }

        public virtual ICollection<Admin> Admins { get; set; } = new List<Admin>();

        public virtual ICollection<User> Users { get; set; } = new List<User>();
    }
}
