using System.Text;
using System.Security.Cryptography;

namespace E.CommerceProject.Models
{
    public static class Cipher
    {
        public static string GenerateSHA256(string data)
        {
            using (var sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(data));
                var hash = new StringBuilder();
                foreach (byte b in bytes)
                {
                    hash.Append(b.ToString("x2"));
                }
                return hash.ToString();
            }
        }
    }
}